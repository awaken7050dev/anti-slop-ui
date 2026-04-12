#!/bin/bash
# Anti-Slop-UI: Interactive multi-editor installer
#
# Run from anywhere:
#   curl -sL https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.sh | bash
#
# Installs globally. Supports Claude Code, Cursor, and Windsurf.

set -e

REPO="https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main"

R="\033[0m"
DIM="\033[2m"
BOLD="\033[1m"
GREEN="\033[32m"
CYAN="\033[36m"
WHITE="\033[97m"
RED="\033[31m"

clear 2>/dev/null || true
echo ""
echo -e "  ${DIM}───────────────────────────────────────${R}"
echo -e "  ${BOLD}${WHITE}anti-slop-ui${R}"
echo -e "  ${DIM}stop your sites from looking AI-generated${R}"
echo -e "  ${DIM}───────────────────────────────────────${R}"
echo ""

# Detect installed editors
DETECTED=""
[ -d "$HOME/.claude" ] && DETECTED="${DETECTED}claude "
[ -d "$HOME/.cursor" ] && DETECTED="${DETECTED}cursor "
[ -d "$HOME/.windsurf" ] && DETECTED="${DETECTED}windsurf "

if [ -n "$DETECTED" ]; then
  echo -e "  ${DIM}detected:${R} ${GREEN}${DETECTED}${R}"
  echo ""
fi

echo -e "  ${WHITE}Which editor?${R}"
echo ""
echo -e "    ${CYAN}1${R})  Claude Code"
echo -e "    ${CYAN}2${R})  Cursor"
echo -e "    ${CYAN}3${R})  Windsurf"
echo -e "    ${CYAN}4${R})  All installed"
echo ""
read -p "    > " CHOICE < /dev/tty

case "$CHOICE" in
  1) EDITORS="claude" ;;
  2) EDITORS="cursor" ;;
  3) EDITORS="windsurf" ;;
  4)
    EDITORS="$DETECTED"
    if [ -z "$EDITORS" ]; then
      echo ""
      echo -e "  ${RED}no editors detected.${R} pick 1-3 to install manually."
      exit 1
    fi
    ;;
  *)
    echo -e "  ${RED}invalid choice.${R}"
    exit 1
    ;;
esac

echo ""

for EDITOR in $EDITORS; do
  case "$EDITOR" in
    claude)   NAME="Claude Code"; DIR="$HOME/.claude/skills/anti-slop-ui" ;;
    cursor)   NAME="Cursor";     DIR="$HOME/.cursor/skills/anti-slop-ui" ;;
    windsurf) NAME="Windsurf";   DIR="$HOME/.windsurf/skills/anti-slop-ui" ;;
  esac

  echo -e "  ${BOLD}${WHITE}${NAME}${R}"

  mkdir -p "$DIR"
  echo -e "    ${DIM}[1/6]${R} ${GREEN}created${R}  ${DIM}${DIR/$HOME/\~}/${R}"

  STEP=1
  for FILE in SKILL.md BRAIN.md PREMIUM.md MOBILE.md; do
    STEP=$((STEP + 1))
    curl -sL "$REPO/$FILE" -o "$DIR/$FILE"
    case "$FILE" in
      SKILL.md)   DESC="(34 tells, design system, checklists)" ;;
      BRAIN.md)   DESC="(reasoning architecture)" ;;
      PREMIUM.md) DESC="(level 4-5 offensive playbook)" ;;
      MOBILE.md)  DESC="(mobile adaptation pass)" ;;
    esac
    echo -e "    ${DIM}[${STEP}/6]${R} ${GREEN}fetched${R}  ${FILE}  ${DIM}${DESC}${R}"
  done

  case "$EDITOR" in
    claude)
      CONF="$HOME/.claude/CLAUDE.md"
      mkdir -p "$HOME/.claude"
      BLOCK="## Skills
- Read \`.claude/skills/anti-slop-ui/SKILL.md\` before any frontend work
- For complex builds, also read \`.claude/skills/anti-slop-ui/BRAIN.md\`
- For Level 4-5 builds, also read \`.claude/skills/anti-slop-ui/PREMIUM.md\`
- After completing any frontend build, read \`.claude/skills/anti-slop-ui/MOBILE.md\` for the mobile adaptation pass"
      if [ -f "$CONF" ]; then
        if ! grep -q "anti-slop-ui" "$CONF"; then
          printf "\n%s\n" "$BLOCK" >> "$CONF"
          echo -e "    ${DIM}[6/6]${R} ${GREEN}wired${R}   ${DIM}~/.claude/CLAUDE.md${R}  ${DIM}(skill reference added)${R}"
        else
          echo -e "    ${DIM}[6/6]${R} ${GREEN}wired${R}   ${DIM}~/.claude/CLAUDE.md${R}  ${DIM}(already configured)${R}"
        fi
      else
        printf "%s\n" "$BLOCK" > "$CONF"
        echo -e "    ${DIM}[6/6]${R} ${GREEN}wired${R}   ${DIM}~/.claude/CLAUDE.md${R}  ${DIM}(created)${R}"
      fi
      ;;
    cursor)
      RULES_DIR="$HOME/.cursor/rules"
      mkdir -p "$RULES_DIR"
      cat > "$RULES_DIR/anti-slop-ui.mdc" << 'CURSOREOF'
---
description: Eliminate AI-generated aesthetic from any frontend. Applies to all frontend files.
globs: ["**/*.tsx", "**/*.jsx", "**/*.html", "**/*.css", "**/*.vue", "**/*.svelte", "**/*.astro"]
alwaysApply: false
---

# Anti-Slop-UI

Before any frontend work, read these skill files:

- Read `~/.cursor/skills/anti-slop-ui/SKILL.md` for the full design system (34 tells, tokens, component patterns, checklists)
- For complex multi-page builds, also read `~/.cursor/skills/anti-slop-ui/BRAIN.md` (reasoning architecture)
- For Level 4-5 (Expressive/Spectacular) builds, also read `~/.cursor/skills/anti-slop-ui/PREMIUM.md` (offensive playbook)
- After completing the desktop build, read `~/.cursor/skills/anti-slop-ui/MOBILE.md` (mobile adaptation pass)
CURSOREOF
      echo -e "    ${DIM}[6/6]${R} ${GREEN}wired${R}   ${DIM}~/.cursor/rules/anti-slop-ui.mdc${R}  ${DIM}(rule created)${R}"
      ;;
    windsurf)
      RULES_DIR="$HOME/.windsurf/rules"
      mkdir -p "$RULES_DIR"
      cat > "$RULES_DIR/anti-slop-ui.md" << 'WINDEOF'
# Anti-Slop-UI

Before any frontend work, read these skill files:

- Read `~/.windsurf/skills/anti-slop-ui/SKILL.md` for the full design system (34 tells, tokens, component patterns, checklists)
- For complex multi-page builds, also read `~/.windsurf/skills/anti-slop-ui/BRAIN.md` (reasoning architecture)
- For Level 4-5 (Expressive/Spectacular) builds, also read `~/.windsurf/skills/anti-slop-ui/PREMIUM.md` (offensive playbook)
- After completing the desktop build, read `~/.windsurf/skills/anti-slop-ui/MOBILE.md` (mobile adaptation pass)
WINDEOF
      echo -e "    ${DIM}[6/6]${R} ${GREEN}wired${R}   ${DIM}~/.windsurf/rules/anti-slop-ui.md${R}  ${DIM}(rule created)${R}"
      ;;
  esac

  echo ""
done

echo -e "  ${BOLD}${WHITE}installed.${R} open your editor, then:"
echo ""
for EDITOR in $EDITORS; do
  case "$EDITOR" in
    claude)   echo -e "    ${CYAN}Claude Code${R}  ${WHITE}/anti-slop-ui${R}  ${DIM}build a landing page for ...${R}" ;;
    cursor)   echo -e "    ${CYAN}Cursor${R}       ${DIM}activates on frontend files automatically${R}" ;;
    windsurf) echo -e "    ${CYAN}Windsurf${R}     ${DIM}activates on frontend files automatically${R}" ;;
  esac
done
echo ""
echo -e "  ${DIM}works globally. no per-project setup needed.${R}"
echo ""
