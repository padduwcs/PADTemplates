# This script inspects the environment; it does not install software.
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$missingTools = @()
foreach ($tool in @('pdflatex', 'latexmk', 'perl', 'bibtex', 'kpsewhich')) {
    $command = Get-Command $tool -ErrorAction SilentlyContinue
    if ($command) {
        Write-Host "[OK] $tool : $($command.Source)"
    }
    else {
        Write-Host "[MISSING] $tool"
        $missingTools += $tool
    }
}
foreach ($tool in @('code', 'git')) {
    if (Get-Command $tool -ErrorAction SilentlyContinue) {
        Write-Host "[OK] $tool"
    }
    else {
        Write-Warning "$tool is unavailable in PATH. See docs/installation.md."
    }
}
if ($missingTools.Count -gt 0) {
    throw ('Missing required tools: ' + ($missingTools -join ', ') + '. See docs/installation.md.')
}

$savedPreference = $ErrorActionPreference
try {
    $ErrorActionPreference = 'Continue'
    $versionOutput = & latexmk -v 2>&1
    $latexmkExitCode = $LASTEXITCODE
}
finally {
    $ErrorActionPreference = $savedPreference
}
if ($latexmkExitCode -ne 0) {
    throw 'latexmk could not run. Check Perl and the LaTeX distribution in PATH.'
}
$versionOutput | ForEach-Object { [string]$_ } |
    Where-Object { $_ -match '^Latexmk.*Version' } |
    ForEach-Object { Write-Host "[OK] $_" }

$missingPackages = 0
foreach ($packageFile in @('vietnam.sty', 'vietnamese.ldf', 't5enc.def', 'algorithm.sty', 'algpseudocode.sty', 'algorithm2e.sty', 'tcolorbox.sty', 'tikz.sty', 'ifsym.sty', 'llncs.cls', 'splncs04.bst')) {
    $packagePath = & kpsewhich $packageFile
    if ($LASTEXITCODE -eq 0 -and $packagePath) {
        Write-Host "[OK] $packageFile"
    }
    else {
        Write-Warning "Package file not installed yet: $packageFile"
        $missingPackages++
    }
}
Write-Host "`nToolchain is ready. Missing package checks: $missingPackages."
Write-Host 'MiKTeX can install missing packages at first build. Run scripts/build-all.ps1 to verify every template.'
