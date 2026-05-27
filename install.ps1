# Install suprava-content-agent for ChatGPT Codex

$PluginName = "suprava-content-agent"
$SourceRoot = $PSScriptRoot
$SourceManifest = Join-Path $SourceRoot ".codex-plugin\plugin.json"
$SourceSkills = Join-Path $SourceRoot "skills"
$PluginsRoot = Join-Path $env:USERPROFILE "plugins"
$TargetRoot = Join-Path $PluginsRoot $PluginName
$TargetMemory = Join-Path $TargetRoot "skills\suprava-content-agent\memory"
$MarketplaceDir = Join-Path $env:USERPROFILE ".agents\plugins"
$MarketplacePath = Join-Path $MarketplaceDir "marketplace.json"
$BackupRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("suprava-content-agent-memory-" + [guid]::NewGuid().ToString())
$BackupMemory = Join-Path $BackupRoot "memory"

if (-not (Test-Path $SourceManifest)) {
    Write-Error ".codex-plugin\plugin.json not found. Run this script from the plugin root."
    exit 1
}

if (-not (Test-Path $SourceSkills)) {
    Write-Error "skills\ not found. Run this script from the plugin root."
    exit 1
}

Write-Output "Installing $PluginName into ChatGPT Codex..."

if (Test-Path $TargetMemory) {
    New-Item -ItemType Directory -Force $BackupMemory | Out-Null
    Copy-Item -Recurse -Force (Join-Path $TargetMemory "*") $BackupMemory
}

New-Item -ItemType Directory -Force $TargetRoot | Out-Null

Copy-Item -Recurse -Force (Join-Path $SourceRoot ".codex-plugin") $TargetRoot
Copy-Item -Recurse -Force $SourceSkills $TargetRoot

foreach ($fileName in @("README.md", "LICENSE")) {
    $sourceFile = Join-Path $SourceRoot $fileName
    if (Test-Path $sourceFile) {
        Copy-Item -Force $sourceFile $TargetRoot
    }
}

if (Test-Path $BackupMemory) {
    New-Item -ItemType Directory -Force $TargetMemory | Out-Null
    Copy-Item -Recurse -Force (Join-Path $BackupMemory "*") $TargetMemory
    Remove-Item -Recurse -Force $BackupRoot
}

New-Item -ItemType Directory -Force $MarketplaceDir | Out-Null

if (Test-Path $MarketplacePath) {
    $marketplace = Get-Content -Raw $MarketplacePath | ConvertFrom-Json
} else {
    $marketplace = [pscustomobject]@{
        name = "personal"
        interface = [pscustomobject]@{
            displayName = "Personal"
        }
        plugins = @()
    }
}

if (-not $marketplace.plugins) {
    $marketplace | Add-Member -NotePropertyName plugins -NotePropertyValue @() -Force
}

$entry = [pscustomobject]@{
    name = $PluginName
    source = [pscustomobject]@{
        source = "local"
        path = "./plugins/$PluginName"
    }
    policy = [pscustomobject]@{
        installation = "AVAILABLE"
        authentication = "ON_INSTALL"
    }
    category = "Writing"
}

$updatedPlugins = @()
$replaced = $false

foreach ($plugin in @($marketplace.plugins)) {
    if ($plugin.name -eq $PluginName) {
        $updatedPlugins += $entry
        $replaced = $true
    } else {
        $updatedPlugins += $plugin
    }
}

if (-not $replaced) {
    $updatedPlugins += $entry
}

$marketplace.plugins = $updatedPlugins
$marketplace | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 $MarketplacePath

Write-Output ""
Write-Output "Installed plugin root:"
Write-Output "  $TargetRoot"
Write-Output ""
Write-Output "Updated personal marketplace:"
Write-Output "  $MarketplacePath"
Write-Output ""
Write-Output "Restart ChatGPT Codex, then open Plugins and install 'Suprava Content Agent' from your Personal marketplace."
