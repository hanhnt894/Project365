#!/usr/bin/env pwsh
<#
.SYNOPSIS
  Project365 CLI — English365 learning workflow manager.
.DESCRIPTION
  p365.ps1 is the main entry point for Project365.
  Reads config.json and dispatches commands.
.PARAMETER Command
  help, version, doctor, start, finish, review, stats
.EXAMPLE
  .\scripts\p365.ps1 help
  .\scripts\p365.ps1 version
  .\scripts\p365.ps1 doctor
#>

#Requires -Version 5.1

# ─── Bootstrap ───────────────────────────────────────────
$scriptRoot = Split-Path -Parent $PSCommandPath
$projectRoot = Split-Path -Parent $scriptRoot
$configPath = Join-Path -Path $projectRoot -ChildPath "config.json"

# ─── Helpers ─────────────────────────────────────────────

function Get-Config {
    if (-not (Test-Path -LiteralPath $configPath)) {
        Write-Warning "config.json not found at: $configPath"
        return $null
    }
    return Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
}

# ─── Commands ────────────────────────────────────────────

function Show-Help {
    $cfg = Get-Config
    $name = if ($cfg) { $cfg.project.name } else { "Project365" }

    Write-Host "$name CLI" -ForegroundColor Cyan
    Write-Host "Usage: .\scripts\p365.ps1 <command>`n" -ForegroundColor Gray
    Write-Host "Commands:" -ForegroundColor Yellow
    Write-Host "  help      Show this help message"
    Write-Host "  version   Show project version"
    Write-Host "  doctor    Check system prerequisites"
    Write-Host "  start     Start a new day (Coming in Sprint 3)"
    Write-Host "  finish    Finish current day (Coming in Sprint 3)"
    Write-Host "  review    Review past lessons (Coming in Sprint 3)"
    Write-Host "  stats     Show learning stats (Coming in Sprint 3)"
}

function Show-Version {
    $cfg = Get-Config
    if (-not $cfg) { return }

    Write-Host "$($cfg.project.name) v$($cfg.project.version)" -ForegroundColor Green
    Write-Host "  Repository : $($cfg.project.repository)"
    Write-Host "  Timezone   : $($cfg.project.timezone)"
    Write-Host "  Sprint     : $($cfg.english365.currentSprint)"
    Write-Host "  Day        : $($cfg.english365.currentDay)/$($cfg.english365.targetDay)"
}

function Invoke-Doctor {
    $cfg = Get-Config
    $allOk = $true

    Write-Host "Project365 Doctor" -ForegroundColor Cyan
    Write-Host "Running checks...`n" -ForegroundColor Gray

    # 1. PowerShell version
    Write-Host -NoNewline "  [PS] PowerShell 7+       "
    if ($PSVersionTable.PSVersion.Major -ge 7) {
        Write-Host "OK ($($PSVersionTable.PSVersion))" -ForegroundColor Green
    } else {
        Write-Host "FAIL ($($PSVersionTable.PSVersion))" -ForegroundColor Red
        $allOk = $false
    }

    # 2. Git
    Write-Host -NoNewline "  [Git] Available          "
    try {
        $gitVer = git --version 2>$null
        if ($gitVer) {
            Write-Host "OK ($gitVer)" -ForegroundColor Green
        } else {
            throw
        }
    } catch {
        Write-Host "FAIL" -ForegroundColor Red
        $allOk = $false
    }

    # 3. config.json
    Write-Host -NoNewline "  [CFG] config.json        "
    if (Test-Path -LiteralPath $configPath) {
        Write-Host "OK" -ForegroundColor Green
    } else {
        Write-Host "FAIL" -ForegroundColor Red
        $allOk = $false
    }

    # 4. English365 directory
    if ($cfg) {
        $engPath = Join-Path -Path $projectRoot -ChildPath $cfg.paths.english365
        Write-Host -NoNewline "  [DIR] $($cfg.paths.english365)      "
        if (Test-Path -LiteralPath $engPath) {
            Write-Host "OK" -ForegroundColor Green
        } else {
            Write-Host "FAIL" -ForegroundColor Red
            $allOk = $false
        }
    }

    # 5. Templates directory
    if ($cfg) {
        $tplPath = Join-Path -Path $projectRoot -ChildPath $cfg.paths.templates
        Write-Host -NoNewline "  [DIR] $($cfg.paths.templates)      "
        if (Test-Path -LiteralPath $tplPath) {
            Write-Host "OK" -ForegroundColor Green
        } else {
            Write-Host "FAIL" -ForegroundColor Red
            $allOk = $false
        }
    }

    Write-Host ""
    if ($allOk) {
        Write-Host "  Result: All checks passed" -ForegroundColor Green
    } else {
        Write-Host "  Result: Some checks failed" -ForegroundColor Yellow
    }
}

# ─── Main ────────────────────────────────────────────────

$command = $args[0]

if (-not $command) {
    Show-Help
    exit 0
}

switch ($command.ToLower()) {
    "help" {
        Show-Help
    }
    "version" {
        Show-Version
    }
    "doctor" {
        Invoke-Doctor
    }
    "start" {
        Write-Host "Coming in Sprint 3" -ForegroundColor Magenta
    }
    "finish" {
        Write-Host "Coming in Sprint 3" -ForegroundColor Magenta
    }
    "review" {
        Write-Host "Coming in Sprint 3" -ForegroundColor Magenta
    }
    "stats" {
        Write-Host "Coming in Sprint 3" -ForegroundColor Magenta
    }
    default {
        Write-Host "Unknown command: $command" -ForegroundColor Red
        Write-Host "Run '.\scripts\p365.ps1 help' for usage." -ForegroundColor Gray
        exit 1
    }
}
