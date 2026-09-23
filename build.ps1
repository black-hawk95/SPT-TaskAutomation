param(
    [string]$SPTPath = "C:\SPT"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$release = Join-Path $root "release"
$dist = Join-Path $root "dist\BepInEx\plugins\TaskAutomation"

Remove-Item (Join-Path $root "dist") -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $release -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path $dist | Out-Null
New-Item -ItemType Directory -Force -Path $release | Out-Null

Write-Host "Building TaskAutomation for SPT path: $SPTPath"
dotnet build (Join-Path $root "TaskAutomation.csproj") -c Release -p:SPTPath="$SPTPath"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Copy-Item (Join-Path $root "bin\Release\netstandard2.1\TaskAutomation.dll") $dist

$releaseZip = Join-Path $release "TaskAutomation-SPT-4.1.6-port.zip"
Compress-Archive -Path (Join-Path $root "dist\*") -DestinationPath $releaseZip -Force
Write-Host "Done: $releaseZip"
