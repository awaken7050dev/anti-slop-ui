# Anti-Slop-UI: one-command installer (Windows)
#
# Run from anywhere:
#   irm https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.ps1 | iex
#
# Installs to ~\.claude\skills\anti-slop-ui\ (global, works in every project)

$ErrorActionPreference = "Stop"
$Repo = "https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main"
$Dir = "$env:USERPROFILE\.claude\skills\anti-slop-ui"
$ClaudeMd = "$env:USERPROFILE\.claude\CLAUDE.md"

Clear-Host
Write-Host ""
Write-Host "  ───────────────────────────────────────" -ForegroundColor DarkGray
Write-Host "  anti-slop-ui" -ForegroundColor White -NoNewline
Write-Host ""
Write-Host "  stop your sites from looking AI-generated" -ForegroundColor DarkGray
Write-Host "  ───────────────────────────────────────" -ForegroundColor DarkGray
Write-Host ""

New-Item -ItemType Directory -Path $Dir -Force | Out-Null
Write-Host "  " -NoNewline
Write-Host "[1/5]" -ForegroundColor DarkGray -NoNewline
Write-Host " created" -ForegroundColor Green -NoNewline
Write-Host "  ~\.claude\skills\anti-slop-ui\" -ForegroundColor DarkGray

Invoke-WebRequest -Uri "$Repo/SKILL.md" -OutFile "$Dir\SKILL.md" -UseBasicParsing
Write-Host "  " -NoNewline
Write-Host "[2/5]" -ForegroundColor DarkGray -NoNewline
Write-Host " fetched" -ForegroundColor Green -NoNewline
Write-Host "  SKILL.md" -ForegroundColor White -NoNewline
Write-Host "  (33 tells, design system, checklists)" -ForegroundColor DarkGray

Invoke-WebRequest -Uri "$Repo/BRAIN.md" -OutFile "$Dir\BRAIN.md" -UseBasicParsing
Write-Host "  " -NoNewline
Write-Host "[3/5]" -ForegroundColor DarkGray -NoNewline
Write-Host " fetched" -ForegroundColor Green -NoNewline
Write-Host "  BRAIN.md" -ForegroundColor White -NoNewline
Write-Host "  (reasoning architecture)" -ForegroundColor DarkGray

Invoke-WebRequest -Uri "$Repo/PREMIUM.md" -OutFile "$Dir\PREMIUM.md" -UseBasicParsing
Write-Host "  " -NoNewline
Write-Host "[4/5]" -ForegroundColor DarkGray -NoNewline
Write-Host " fetched" -ForegroundColor Green -NoNewline
Write-Host "  PREMIUM.md" -ForegroundColor White -NoNewline
Write-Host "  (level 4-5 offensive playbook)" -ForegroundColor DarkGray

New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude" -Force | Out-Null

if (Test-Path $ClaudeMd) {
    $content = Get-Content $ClaudeMd -Raw -ErrorAction SilentlyContinue
    if ($content -and $content -notmatch "anti-slop-ui") {
        "`n## Skills`n- Read ``.claude/skills/anti-slop-ui/SKILL.md`` before any frontend work`n- For complex builds, also read ``.claude/skills/anti-slop-ui/BRAIN.md```n- For Level 4-5 builds, also read ``.claude/skills/anti-slop-ui/PREMIUM.md``" | Add-Content $ClaudeMd
        Write-Host "  " -NoNewline
        Write-Host "[5/5]" -ForegroundColor DarkGray -NoNewline
        Write-Host " wired" -ForegroundColor Green -NoNewline
        Write-Host "   ~\.claude\CLAUDE.md" -ForegroundColor White -NoNewline
        Write-Host "  (skill reference added)" -ForegroundColor DarkGray
    } else {
        Write-Host "  " -NoNewline
        Write-Host "[5/5]" -ForegroundColor DarkGray -NoNewline
        Write-Host " wired" -ForegroundColor Green -NoNewline
        Write-Host "   ~\.claude\CLAUDE.md" -ForegroundColor White -NoNewline
        Write-Host "  (already configured)" -ForegroundColor DarkGray
    }
} else {
    "## Skills`n- Read ``.claude/skills/anti-slop-ui/SKILL.md`` before any frontend work`n- For complex builds, also read ``.claude/skills/anti-slop-ui/BRAIN.md```n- For Level 4-5 builds, also read ``.claude/skills/anti-slop-ui/PREMIUM.md``" | Set-Content $ClaudeMd
    Write-Host "  " -NoNewline
    Write-Host "[5/5]" -ForegroundColor DarkGray -NoNewline
    Write-Host " wired" -ForegroundColor Green -NoNewline
    Write-Host "   ~\.claude\CLAUDE.md" -ForegroundColor White -NoNewline
    Write-Host "  (created)" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "  installed." -ForegroundColor White -NoNewline
Write-Host " run " -NoNewline
Write-Host "claude" -ForegroundColor Cyan -NoNewline
Write-Host " in any project, then:"
Write-Host ""
Write-Host "    /anti-slop-ui" -ForegroundColor White -NoNewline
Write-Host "  build a landing page for ..." -ForegroundColor DarkGray
Write-Host ""
Write-Host "  works globally. no per-project setup needed." -ForegroundColor DarkGray
Write-Host ""
