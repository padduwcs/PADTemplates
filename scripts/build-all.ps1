# Requires Windows PowerShell 5.1 or PowerShell 7+.
[CmdletBinding()]
param(
    [string]$Template,
    [switch]$Rebuild
)

$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path $PSScriptRoot -Parent
. (Join-Path $PSScriptRoot 'lib/templates.ps1')

if (-not (Get-Command latexmk -ErrorAction SilentlyContinue)) {
    throw 'latexmk was not found. Follow docs/installation.md and restart the terminal.'
}
$catalog = @(Get-TemplateCatalog -RepositoryRoot $repositoryRoot)
if ($Template) {
    $catalog = @($catalog | Where-Object { $_.Id -eq $Template })
    if ($catalog.Count -eq 0) {
        throw "Unknown template: $Template. Use scripts/new-project.ps1 -List to see available ids."
    }
}

$built = 0
foreach ($item in $catalog) {
    foreach ($entrypoint in $item.Entrypoints) {
        Write-Host "`n[BUILD] $($item.Id)/$entrypoint"
        $arguments = @('-synctex=1', '-interaction=nonstopmode', '-file-line-error', '-halt-on-error')
        if ($Rebuild) {
            $arguments += '-g'
        }
        $arguments += $entrypoint

        Push-Location -LiteralPath $item.Path
        try {
            # Check the process exit code, including on Windows PowerShell 5.1,
            # where native stderr may be reported as a NativeCommandError.
            $savedPreference = $ErrorActionPreference
            try {
                $ErrorActionPreference = 'Continue'
                & latexmk @arguments
                $buildExitCode = $LASTEXITCODE
            }
            finally {
                $ErrorActionPreference = $savedPreference
            }
            if ($buildExitCode -ne 0) {
                throw "Build failed: $($item.Id)/$entrypoint (exit $buildExitCode)."
            }
            $pdfPath = Join-Path $item.Path ('build/' + [IO.Path]::ChangeExtension($entrypoint, 'pdf'))
            if (-not (Test-Path -LiteralPath $pdfPath -PathType Leaf) -or (Get-Item -LiteralPath $pdfPath).Length -eq 0) {
                throw "Build finished without the expected PDF: $pdfPath."
            }
            Write-Host "[OK] $pdfPath"
            $built++
        }
        finally {
            Pop-Location
        }
    }
}
Write-Host "`nBuilt $built document(s) from $($catalog.Count) template(s)."
