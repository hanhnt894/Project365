param(
    [Parameter(Mandatory = $true)]
    [string]$DayNumber
)

$basePath = Split-Path -Parent $PSScriptRoot
$dayPath = Join-Path -Path $basePath -ChildPath "English365\$DayNumber"
$templatePath = Join-Path -Path $basePath -ChildPath "English365\templates"

if (-not (Test-Path -LiteralPath $templatePath)) {
    Write-Host "Template directory not found: $templatePath" -ForegroundColor Red
    exit 1
}

if (Test-Path -LiteralPath $dayPath) {
    Write-Host "Day$DayNumber already exists." -ForegroundColor Yellow
    exit 0
}

New-Item -ItemType Directory -Path $dayPath -Force | Out-Null

$files = @(
    @{ Template = "Lesson.template.md"; Output = "Lesson.md" },
    @{ Template = "README.template.md"; Output = "README.md" },
    @{ Template = "Anki.template.csv";   Output = "Anki.csv" }
)

foreach ($file in $files) {
    $src = Join-Path -Path $templatePath -ChildPath $file.Template
    $dst = Join-Path -Path $dayPath -ChildPath $file.Output

    if (Test-Path -LiteralPath $src) {
        Copy-Item -LiteralPath $src -Destination $dst
        Write-Host "[OK] Create $($file.Output)" -ForegroundColor Green
    } else {
        Write-Host "[FAIL] Template not found: $($file.Template)" -ForegroundColor Red
    }
}
