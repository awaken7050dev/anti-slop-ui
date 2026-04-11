#!/bin/bash
# Anti-Slop-UI: one-command installer
#
# HOW TO USE:
# 1. cd into your project folder
# 2. Run: curl -sL https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.sh | bash
#
# WHAT IT DOES:
# - Creates .claude/skills/anti-slop-ui/ in your project
# - Downloads SKILL.md and BRAIN.md into it
# - Adds the skill reference to your .claude/CLAUDE.md
# - That's it. Next time you run "claude", the skill is active.

set -e

REPO="https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main"
DIR=".claude/skills/anti-slop-ui"

echo ""
echo "  Installing anti-slop-ui v1.0"
echo "  Stop your sites from looking AI-generated"
echo ""

# Create skill directory
mkdir -p "$DIR"
echo "  [1/4] Created $DIR"

# Download skill files
curl -sL "$REPO/SKILL.md" -o "$DIR/SKILL.md"
echo "  [2/4] Downloaded SKILL.md"

curl -sL "$REPO/BRAIN.md" -o "$DIR/BRAIN.md"
echo "  [3/4] Downloaded BRAIN.md"

# Wire up CLAUDE.md
mkdir -p .claude
if [ -f ".claude/CLAUDE.md" ]; then
  if ! grep -q "anti-slop-ui" ".claude/CLAUDE.md"; then
    printf "\n## Skills\n- Read \`.claude/skills/anti-slop-ui/SKILL.md\` before any frontend work\n- For complex builds, also read \`.claude/skills/anti-slop-ui/BRAIN.md\`\n" >> ".claude/CLAUDE.md"
    echo "  [4/4] Added skill reference to existing CLAUDE.md"
  else
    echo "  [4/4] CLAUDE.md already references anti-slop-ui (skipped)"
  fi
else
  printf "## Skills\n- Read \`.claude/skills/anti-slop-ui/SKILL.md\` before any frontend work\n- For complex builds, also read \`.claude/skills/anti-slop-ui/BRAIN.md\`\n" > ".claude/CLAUDE.md"
  echo "  [4/4] Created CLAUDE.md with skill reference"
fi

echo ""
echo "  Done! Run 'claude' in this project to start building."
echo ""
