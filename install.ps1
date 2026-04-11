# Anti-Slop-UI: one-command installer (Windows)
#
# HOW TO USE:
# 1. Open PowerShell in your project folder
# 2. Run: irm https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.ps1 | iex

$ErrorActionPreference = "Stop"
$Repo = "https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main"
$Dir = ".claude\skills\anti-slop-ui"

Write-Host ""
Write-Host "  Installing anti-slop-ui v1.0" -ForegroundColor Cyan
Write-Host ""

New-Item -ItemType Directory -Path $Dir -Force | Out-Null
Write-Host "  [1/4] Created $Dir" -ForegroundColor Green

Invoke-WebRequest -Uri "$Repo/SKILL.md" -OutFile "$Dir\SKILL.md" -UseBasicParsing
Write-Host "  [2/4] Downloaded SKILL.md" -ForegroundColor Green

Invoke-WebRequest -Uri "$Repo/BRAIN.md" -OutFile "$Dir\BRAIN.md" -UseBasicParsing
Write-Host "  [3/4] Downloaded BRAIN.md" -ForegroundColor Green

$ClaudeMd = ".claude\CLAUDE.md"
New-Item -ItemType Directory -Path ".claude" -Force | Out-Null

if (Test-Path $ClaudeMd) {
    $content = Get-Content $ClaudeMd -Raw -ErrorAction SilentlyContinue
    if ($content -and $content -notmatch "anti-slop-ui") {
        "`n## Skills`n- Read ``.claude/skills/anti-slop-ui/SKILL.md`` before any frontend work`n- For complex builds, also read ``.claude/skills/anti-slop-ui/BRAIN.md``" | Add-Content $ClaudeMd
        Write-Host "  [4/4] Added to CLAUDE.md" -ForegroundColor Green
    } else {
        Write-Host "  [4/4] Already set up (skipped)" -ForegroundColor Yellow
    }
} else {
    "## Skills`n- Read ``.claude/skills/anti-slop-ui/SKILL.md`` before any frontend work`n- For complex builds, also read ``.claude/skills/anti-slop-ui/BRAIN.md``" | Set-Content $ClaudeMd
    Write-Host "  [4/4] Created CLAUDE.md" -ForegroundColor Green
}

Write-Host ""
Write-Host "  Done! Run 'claude' to start building." -ForegroundColor Cyan
Write-Host ""
