# This script inspects the environment; it does not install software.
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$missingTools = @()
foreach ($tool in @('pdflatex', 'latexmk', 'bibtex', 'kpsewhich')) {
    $command = Get-Command $tool -ErrorAction SilentlyContinue
    if ($command) {
        Write-Host "[OK] $tool : $($command.Source)"
    }
    else {
        Write-Host "[MISSING] $tool"
        $missingTools += $tool
    }
}
$perlCommand = Get-Command perl -ErrorAction SilentlyContinue
if ($perlCommand) {
    Write-Host "[OK] perl : $($perlCommand.Source)"
}
else {
    Write-Host '[INFO] No separate perl command in PATH; checking whether latexmk can use its own runtime.'
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
    $versionOutput | ForEach-Object { Write-Host ([string]$_) }
    throw 'latexmk could not run. Check its error output, Perl and the LaTeX distribution in PATH. See docs/installation.md.'
}
Write-Host '[OK] latexmk can run; no additional Perl installation is required for this check.'
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
if ($missingPackages -gt 0) {
    Write-Host "`n[ACTION] $missingPackages sampled package file(s) are missing."
    Write-Host 'Install missing packages with your current TeX distribution. MiKTeX can install them at first build.'
}
else {
    Write-Host "`n[OK] All sampled package files are installed."
}
Write-Host 'Check LaTeX Workshop in VS Code Extensions, then run scripts/build-all.ps1 to verify every template.'
