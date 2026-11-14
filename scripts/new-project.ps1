# Copy a standalone template without generated files. Never overwrite a project.
[CmdletBinding(DefaultParameterSetName = 'Create')]
param(
    [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
    [string]$Template,

    [Parameter(Mandatory = $true, ParameterSetName = 'Create')]
    [string]$Destination,

    [Parameter(Mandatory = $true, ParameterSetName = 'List')]
    [switch]$List
)

$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path $PSScriptRoot -Parent
. (Join-Path $PSScriptRoot 'lib/templates.ps1')
$catalog = @(Get-TemplateCatalog -RepositoryRoot $repositoryRoot)
if ($List) {
    $catalog | Select-Object Id, Name, Engine | Format-Table -AutoSize
    return
}

$selected = @($catalog | Where-Object { $_.Id -eq $Template })
if ($selected.Count -ne 1) {
    throw "Unknown template: $Template. Use -List to see available ids."
}
$destinationPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)
$templatesPath = [IO.Path]::GetFullPath((Join-Path $repositoryRoot 'templates'))
$separator = [IO.Path]::DirectorySeparatorChar
if ($destinationPath.Equals($templatesPath, [StringComparison]::OrdinalIgnoreCase) -or
    $destinationPath.StartsWith($templatesPath + $separator, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Put personal projects outside templates/. Use projects/ or a separate directory.'
}
if (Test-Path -LiteralPath $destinationPath) {
    throw "Destination already exists; nothing was copied: $destinationPath."
}

New-Item -ItemType Directory -Path $destinationPath | Out-Null
Get-ChildItem -LiteralPath $selected[0].Path -Force |
    Where-Object { $_.Name -notin @('build', '.git') } |
    ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $destinationPath -Recurse
    }
Write-Host "Created $destinationPath"
Write-Host 'Open this folder in VS Code, edit main.tex, then press Ctrl+Alt+B.'
