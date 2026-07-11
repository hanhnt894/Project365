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
    Write-Host "  start     Start a new day"
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

# ─── Start ──────────────────────────────────────────────

function Get-DayFolder {
    param([int]$DayNumber)
    return "{0:D3}" -f $DayNumber
}

function Invoke-Start {
    $cfg = Get-Config
    if (-not $cfg) { return }

    # 1. Git pull
    Write-Host "Pulling latest changes..." -ForegroundColor Gray
    git pull

    if ($LASTEXITCODE -ne 0) {
        Write-Host "Git pull failed." -ForegroundColor Red
        return
    }

    # 2. Increment currentDay
    $nextDay = $cfg.english365.currentDay + 1
    $dayFolder = Get-DayFolder -DayNumber $nextDay
    $engPath = Join-Path -Path $projectRoot -ChildPath $cfg.paths.english365
    $dayPath = Join-Path -Path $engPath -ChildPath $dayFolder

    # 3. Create day directory if missing
    if (-not (Test-Path -LiteralPath $dayPath)) {
        New-Item -ItemType Directory -Path $dayPath -Force | Out-Null
        Write-Host "Created $dayFolder" -ForegroundColor Green
    } else {
        Write-Host "$dayFolder already exists" -ForegroundColor Yellow
    }

    # 4. Copy templates without overwrite
    $tplPath = Join-Path -Path $projectRoot -ChildPath $cfg.paths.templates
    if (Test-Path -LiteralPath $tplPath) {
        Get-ChildItem -Path $tplPath -File | ForEach-Object {
            $dest = Join-Path -Path $dayPath -ChildPath $_.Name
            if (-not (Test-Path -LiteralPath $dest)) {
                Copy-Item -LiteralPath $_.FullName -Destination $dest
                Write-Host "  + $($_.Name)" -ForegroundColor Green
            } else {
                Write-Host "  ~ $($_.Name) (skipped)" -ForegroundColor DarkGray
            }
        }
    }

    Write-Host ""

    # 5. Display checklist
    Write-Host "===== Day $nextDay Checklist =====" -ForegroundColor Cyan
    Write-Host "  [ ] Read Lesson.md" -ForegroundColor White
    Write-Host "  [ ] Study Anki cards" -ForegroundColor White
    Write-Host "  [ ] Complete Reflection section" -ForegroundColor White
    Write-Host "  [ ] Review Progress.md" -ForegroundColor White
    Write-Host ""

    # 6. NOT updating config.json — that's for finish
    Write-Host "Run '.\scripts\p365.ps1 finish' to mark day as complete." -ForegroundColor Gray
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
        Invoke-Start
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
