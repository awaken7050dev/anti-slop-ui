#!/bin/bash
# Anti-Slop-UI: one-command installer
#
# Run from anywhere:
#   curl -sL https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.sh | bash
#
# Installs to ~/.claude/skills/anti-slop-ui/ (global, works in every project)

set -e

REPO="https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main"
DIR="$HOME/.claude/skills/anti-slop-ui"
CLAUDE_MD="$HOME/.claude/CLAUDE.md"

# Colors
R="\033[0m"
DIM="\033[2m"
BOLD="\033[1m"
GREEN="\033[32m"
CYAN="\033[36m"
WHITE="\033[97m"

clear 2>/dev/null || true
echo ""
echo -e "  ${DIM}───────────────────────────────────────${R}"
echo -e "  ${BOLD}${WHITE}anti-slop-ui${R}"
echo -e "  ${DIM}stop your sites from looking AI-generated${R}"
echo -e "  ${DIM}───────────────────────────────────────${R}"
echo ""

# Create skill directory
mkdir -p "$DIR"
echo -e "  ${DIM}[1/5]${R} ${GREEN}created${R}  ${DIM}~/.claude/skills/anti-slop-ui/${R}"

# Download skill files
curl -sL "$REPO/SKILL.md" -o "$DIR/SKILL.md"
echo -e "  ${DIM}[2/5]${R} ${GREEN}fetched${R}  SKILL.md  ${DIM}(33 tells, design system, checklists)${R}"

curl -sL "$REPO/BRAIN.md" -o "$DIR/BRAIN.md"
echo -e "  ${DIM}[3/5]${R} ${GREEN}fetched${R}  BRAIN.md  ${DIM}(reasoning architecture)${R}"

curl -sL "$REPO/PREMIUM.md" -o "$DIR/PREMIUM.md"
echo -e "  ${DIM}[4/5]${R} ${GREEN}fetched${R}  PREMIUM.md  ${DIM}(level 4-5 offensive playbook)${R}"

# Wire up global CLAUDE.md
mkdir -p "$HOME/.claude"
if [ -f "$CLAUDE_MD" ]; then
  if ! grep -q "anti-slop-ui" "$CLAUDE_MD"; then
    printf "\n## Skills\n- Read \`.claude/skills/anti-slop-ui/SKILL.md\` before any frontend work\n- For complex builds, also read \`.claude/skills/anti-slop-ui/BRAIN.md\`\n- For Level 4-5 builds, also read \`.claude/skills/anti-slop-ui/PREMIUM.md\`\n" >> "$CLAUDE_MD"
    echo -e "  ${DIM}[5/5]${R} ${GREEN}wired${R}   ~/.claude/CLAUDE.md  ${DIM}(skill reference added)${R}"
  else
    echo -e "  ${DIM}[5/5]${R} ${GREEN}wired${R}   ~/.claude/CLAUDE.md  ${DIM}(already configured)${R}"
  fi
else
  printf "## Skills\n- Read \`.claude/skills/anti-slop-ui/SKILL.md\` before any frontend work\n- For complex builds, also read \`.claude/skills/anti-slop-ui/BRAIN.md\`\n- For Level 4-5 builds, also read \`.claude/skills/anti-slop-ui/PREMIUM.md\`\n" > "$CLAUDE_MD"
  echo -e "  ${DIM}[5/5]${R} ${GREEN}wired${R}   ~/.claude/CLAUDE.md  ${DIM}(created)${R}"
fi

echo ""
echo -e "  ${BOLD}${WHITE}installed.${R} run ${CYAN}claude${R} in any project, then:"
echo ""
echo -e "    ${WHITE}/anti-slop-ui${R}  ${DIM}build a landing page for ...${R}"
echo ""
echo -e "  ${DIM}works globally. no per-project setup needed.${R}"
echo ""
