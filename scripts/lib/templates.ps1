Set-StrictMode -Version 2.0

function Get-TemplateCatalog {
    param([Parameter(Mandatory = $true)][string]$RepositoryRoot)

    $templatesRoot = Join-Path $RepositoryRoot 'templates'
    $manifests = @(Get-ChildItem -LiteralPath $templatesRoot -Filter 'template.json' -File -Recurse |
        Where-Object { $_.FullName -notmatch '[/\\]build[/\\]' } |
        Sort-Object FullName)
    if ($manifests.Count -eq 0) {
        throw 'No template.json files found under templates/.'
    }

    $seenIds = @{}
    foreach ($manifest in $manifests) {
        $metadata = Get-Content -LiteralPath $manifest.FullName -Raw -Encoding UTF8 | ConvertFrom-Json
        foreach ($field in @('id', 'name', 'description', 'category', 'language', 'engine', 'entrypoints')) {
            if ($null -eq $metadata.PSObject.Properties[$field] -or -not $metadata.$field) {
                throw "Missing '$field' in $($manifest.FullName)."
            }
        }
        if ($metadata.id -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$' -or $seenIds.ContainsKey($metadata.id)) {
            throw "Invalid or duplicate template id: $($metadata.id)."
        }
        $seenIds[$metadata.id] = $true
        if ($metadata.engine -notin @('pdflatex', 'xelatex', 'lualatex')) {
            throw "Unsupported engine in $($manifest.FullName): $($metadata.engine)."
        }
        if ($metadata.entrypoints -isnot [System.Array]) {
            throw "entrypoints must be a JSON array in $($manifest.FullName)."
        }

        $templatePath = $manifest.Directory.FullName
        foreach ($requiredFile in @('README.md', 'latexmkrc', '.gitignore', '.vscode/settings.json', '.vscode/extensions.json')) {
            if (-not (Test-Path -LiteralPath (Join-Path $templatePath $requiredFile) -PathType Leaf)) {
                throw "Required file missing from $($metadata.id): $requiredFile."
            }
        }
        $entrypoints = @($metadata.entrypoints)
        if (@($entrypoints | Select-Object -Unique).Count -ne $entrypoints.Count) {
            throw "Duplicate entrypoints in $($metadata.id)."
        }
        foreach ($entrypoint in $entrypoints) {
            # Root documents live at the template root; included files can be in subdirectories.
            if ($entrypoint -notmatch '^[A-Za-z0-9][A-Za-z0-9_-]*\.tex$') {
                throw "Invalid entrypoint in $($metadata.id): $entrypoint."
            }
            if (-not (Test-Path -LiteralPath (Join-Path $templatePath $entrypoint) -PathType Leaf)) {
                throw "Entrypoint missing from $($metadata.id): $entrypoint."
            }
        }

        [PSCustomObject]@{
            Id = [string]$metadata.id
            Name = [string]$metadata.name
            Engine = [string]$metadata.engine
            Path = $templatePath
            Entrypoints = $entrypoints
        }
    }
}
