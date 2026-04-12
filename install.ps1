# Anti-Slop-UI: Interactive multi-editor installer (Windows)
#
# Run from anywhere:
#   irm https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.ps1 | iex
#
# Installs globally. Supports Claude Code, Cursor, and Windsurf.

$ErrorActionPreference = "Stop"
$Repo = "https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main"
$H = $env:USERPROFILE

Clear-Host
Write-Host ""
Write-Host "  -----------------------------------------------" -ForegroundColor DarkGray
Write-Host "  anti-slop-ui" -ForegroundColor White
Write-Host "  stop your sites from looking AI-generated" -ForegroundColor DarkGray
Write-Host "  -----------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

# Detect installed editors
$Detected = @()
if (Test-Path "$H\.claude") { $Detected += "claude" }
if (Test-Path "$H\.cursor") { $Detected += "cursor" }
if (Test-Path "$H\.windsurf") { $Detected += "windsurf" }

if ($Detected.Count -gt 0) {
    Write-Host "  detected: " -ForegroundColor DarkGray -NoNewline
    Write-Host ($Detected -join ", ") -ForegroundColor Green
    Write-Host ""
}

Write-Host "  Which editor?" -ForegroundColor White
Write-Host ""
Write-Host "    1)  Claude Code" -ForegroundColor White
Write-Host "    2)  Cursor" -ForegroundColor White
Write-Host "    3)  Windsurf" -ForegroundColor White
Write-Host "    4)  All installed" -ForegroundColor White
Write-Host ""
$Choice = Read-Host "    >"

switch ($Choice) {
    "1" { $Editors = @("claude") }
    "2" { $Editors = @("cursor") }
    "3" { $Editors = @("windsurf") }
    "4" {
        if ($Detected.Count -eq 0) {
            Write-Host "  no editors detected. pick 1-3 to install manually." -ForegroundColor Red
            exit 1
        }
        $Editors = $Detected
    }
    default {
        Write-Host "  invalid choice." -ForegroundColor Red
        exit 1
    }
}

Write-Host ""

$Files = @(
    @{ Name = "SKILL.md";   Desc = "(34 tells, design system, checklists)" },
    @{ Name = "BRAIN.md";   Desc = "(reasoning architecture)" },
    @{ Name = "PREMIUM.md"; Desc = "(level 4-5 offensive playbook)" },
    @{ Name = "MOBILE.md";  Desc = "(mobile adaptation pass)" }
)

foreach ($Editor in $Editors) {
    switch ($Editor) {
        "claude"   { $Name = "Claude Code"; $Dir = "$H\.claude\skills\anti-slop-ui" }
        "cursor"   { $Name = "Cursor";      $Dir = "$H\.cursor\skills\anti-slop-ui" }
        "windsurf" { $Name = "Windsurf";    $Dir = "$H\.windsurf\skills\anti-slop-ui" }
    }

    Write-Host "  $Name" -ForegroundColor White
    Write-Host ""

    # [1/6] Create directory
    New-Item -ItemType Directory -Path $Dir -Force | Out-Null
    $ShortDir = $Dir.Replace($H, "~")
    Write-Host "    " -NoNewline
    Write-Host "[1/6]" -ForegroundColor DarkGray -NoNewline
    Write-Host " created" -ForegroundColor Green -NoNewline
    Write-Host "  $ShortDir\" -ForegroundColor DarkGray

    # [2/6] - [5/6] Download files
    $Step = 1
    foreach ($F in $Files) {
        $Step++
        Invoke-WebRequest -Uri "$Repo/$($F.Name)" -OutFile "$Dir\$($F.Name)" -UseBasicParsing
        Write-Host "    " -NoNewline
        Write-Host "[$Step/6]" -ForegroundColor DarkGray -NoNewline
        Write-Host " fetched" -ForegroundColor Green -NoNewline
        Write-Host "  $($F.Name)" -ForegroundColor White -NoNewline
        Write-Host "  $($F.Desc)" -ForegroundColor DarkGray
    }

    # [6/6] Wire up config
    switch ($Editor) {
        "claude" {
            $Conf = "$H\.claude\CLAUDE.md"
            New-Item -ItemType Directory -Path "$H\.claude" -Force | Out-Null
            $Block = "## Skills`n- Read ``.claude/skills/anti-slop-ui/SKILL.md`` before any frontend work`n- For complex builds, also read ``.claude/skills/anti-slop-ui/BRAIN.md```n- For Level 4-5 builds, also read ``.claude/skills/anti-slop-ui/PREMIUM.md```n- After completing any frontend build, read ``.claude/skills/anti-slop-ui/MOBILE.md`` for the mobile adaptation pass"
            if (Test-Path $Conf) {
                $content = Get-Content $Conf -Raw -ErrorAction SilentlyContinue
                if ($content -and $content -notmatch "anti-slop-ui") {
                    "`n$Block" | Add-Content $Conf
                    Write-Host "    " -NoNewline
                    Write-Host "[6/6]" -ForegroundColor DarkGray -NoNewline
                    Write-Host " wired" -ForegroundColor Green -NoNewline
                    Write-Host "   ~/.claude/CLAUDE.md" -ForegroundColor White -NoNewline
                    Write-Host "  (skill reference added)" -ForegroundColor DarkGray
                } else {
                    Write-Host "    " -NoNewline
                    Write-Host "[6/6]" -ForegroundColor DarkGray -NoNewline
                    Write-Host " wired" -ForegroundColor Green -NoNewline
                    Write-Host "   ~/.claude/CLAUDE.md" -ForegroundColor White -NoNewline
                    Write-Host "  (already configured)" -ForegroundColor DarkGray
                }
            } else {
                $Block | Set-Content $Conf
                Write-Host "    " -NoNewline
                Write-Host "[6/6]" -ForegroundColor DarkGray -NoNewline
                Write-Host " wired" -ForegroundColor Green -NoNewline
                Write-Host "   ~/.claude/CLAUDE.md" -ForegroundColor White -NoNewline
                Write-Host "  (created)" -ForegroundColor DarkGray
            }
        }
        "cursor" {
            $RulesDir = "$H\.cursor\rules"
            New-Item -ItemType Directory -Path $RulesDir -Force | Out-Null
            $RuleContent = @"
---
description: Eliminate AI-generated aesthetic from any frontend. Applies to all frontend files.
globs: ["**/*.tsx", "**/*.jsx", "**/*.html", "**/*.css", "**/*.vue", "**/*.svelte", "**/*.astro"]
alwaysApply: false
---

# Anti-Slop-UI

Before any frontend work, read these skill files:

- Read ``~/.cursor/skills/anti-slop-ui/SKILL.md`` for the full design system (34 tells, tokens, component patterns, checklists)
- For complex multi-page builds, also read ``~/.cursor/skills/anti-slop-ui/BRAIN.md`` (reasoning architecture)
- For Level 4-5 (Expressive/Spectacular) builds, also read ``~/.cursor/skills/anti-slop-ui/PREMIUM.md`` (offensive playbook)
- After completing the desktop build, read ``~/.cursor/skills/anti-slop-ui/MOBILE.md`` (mobile adaptation pass)
"@
            $RuleContent | Set-Content "$RulesDir\anti-slop-ui.mdc" -Encoding UTF8
            Write-Host "    " -NoNewline
            Write-Host "[6/6]" -ForegroundColor DarkGray -NoNewline
            Write-Host " wired" -ForegroundColor Green -NoNewline
            Write-Host "   ~/.cursor/rules/anti-slop-ui.mdc" -ForegroundColor White -NoNewline
            Write-Host "  (rule created)" -ForegroundColor DarkGray
        }
        "windsurf" {
            $RulesDir = "$H\.windsurf\rules"
            New-Item -ItemType Directory -Path $RulesDir -Force | Out-Null
            $RuleContent = @"
# Anti-Slop-UI

Before any frontend work, read these skill files:

- Read ``~/.windsurf/skills/anti-slop-ui/SKILL.md`` for the full design system (34 tells, tokens, component patterns, checklists)
- For complex multi-page builds, also read ``~/.windsurf/skills/anti-slop-ui/BRAIN.md`` (reasoning architecture)
- For Level 4-5 (Expressive/Spectacular) builds, also read ``~/.windsurf/skills/anti-slop-ui/PREMIUM.md`` (offensive playbook)
- After completing the desktop build, read ``~/.windsurf/skills/anti-slop-ui/MOBILE.md`` (mobile adaptation pass)
"@
            $RuleContent | Set-Content "$RulesDir\anti-slop-ui.md" -Encoding UTF8
            Write-Host "    " -NoNewline
            Write-Host "[6/6]" -ForegroundColor DarkGray -NoNewline
            Write-Host " wired" -ForegroundColor Green -NoNewline
            Write-Host "   ~/.windsurf/rules/anti-slop-ui.md" -ForegroundColor White -NoNewline
            Write-Host "  (rule created)" -ForegroundColor DarkGray
        }
    }

    Write-Host ""
}

Write-Host "  installed." -ForegroundColor White -NoNewline
Write-Host " open your editor, then:"
Write-Host ""
foreach ($Editor in $Editors) {
    switch ($Editor) {
        "claude" {
            Write-Host "    Claude Code" -ForegroundColor Cyan -NoNewline
            Write-Host "  /anti-slop-ui" -ForegroundColor White -NoNewline
            Write-Host "  build a landing page for ..." -ForegroundColor DarkGray
        }
        "cursor" {
            Write-Host "    Cursor" -ForegroundColor Cyan -NoNewline
            Write-Host "       activates on frontend files automatically" -ForegroundColor DarkGray
        }
        "windsurf" {
            Write-Host "    Windsurf" -ForegroundColor Cyan -NoNewline
            Write-Host "     activates on frontend files automatically" -ForegroundColor DarkGray
        }
    }
}
Write-Host ""
Write-Host "  works globally. no per-project setup needed." -ForegroundColor DarkGray
Write-Host ""
