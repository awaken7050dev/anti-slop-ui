# anti-slop-ui

An AI skill that eliminates the AI-generated look from any frontend. Purple gradients, pill-shaped cards, Inter font, "Welcome to [Product]" heroes, em dashes in every sentence. You know the look. This kills it. Works with Claude Code, Cursor, and Windsurf.

## Before and after

![Before: default Claude output for Lumina headphones](before.png)
![After: same brief with anti-slop-ui applied](after.png)

Same brand brief. Same model. The only difference is the skill.

**Before.** Decorative dash before an uppercase eyebrow label. Italic accent on one word of a generic tagline. Product buried inside an abstract orbital graphic instead of shown directly. Specs exist but are vague and buried in body copy. No price on the CTA.

**After.** Product photo bleeds off the edge as the hero. Spec copy is concrete: 40 mm beryllium-coated driver, 28 dB active silence, 48 hours per charge, batches of 500, ships from Copenhagen. Price on the CTA. Plain section marker (`01 / Lumina One`), uniform wordmark, asymmetric layout.

## Install

**Claude Code (recommended)**

```
/plugin marketplace add awaken7050dev/anti-slop-ui
/plugin install anti-slop-ui@anti-slop-ui
```

Two commands. The skill registers as `/anti-slop-ui` and activates on frontend tasks automatically.

**Cursor, Windsurf, or manual install**

The shell installer auto-detects your editors and asks which to configure.

macOS and Linux:

```bash
curl -sL https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.sh | bash
```

Windows (PowerShell):

```powershell
irm https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.ps1 | iex
```

Supports **Claude Code**, **Cursor**, and **Windsurf**. One install. Works globally. No per-project setup needed.

## Use it

**Claude Code** -- run it as a slash command:

```
/anti-slop-ui build a landing page for a SaaS analytics tool
/anti-slop-ui redesign the dashboard to look professional
/anti-slop-ui this portfolio looks generic, polish it
```

That triggers the intake questions (audience, impression level, mode, stack, logo, pages), then builds. It self-audits against the 34 tells before declaring the work done. The skill also activates passively on frontend tasks via the CLAUDE.md reference.

**Cursor** -- the skill activates automatically when you work on frontend files (`.tsx`, `.jsx`, `.html`, `.css`, `.vue`, `.svelte`, `.astro`). No slash command needed. The `.mdc` rule file triggers it.

**Windsurf** -- same automatic activation on frontend files via the global rules directory.

## What the skill does

Before writing a single line of code, the skill forces three decisions:

1. **Audience.** Executive, developer, consumer, or creative. Each one has a different tolerance for density, color, and motion.
2. **Impression level.** A 1 to 5 scale from data terminal to product showcase. The level determines type scale, color usage, and how much visual weight is allowed.
3. **Light or dark mode.** Committed upfront, so both states are designed, not retrofitted.

From those answers, the AI picks the design tokens, component patterns, and layout rules that match. It then applies a 34-point filter to eliminate the most common AI tells, and runs a pre-ship checklist before declaring the work done.

## What it kills

Thirty-four specific AI tells, grouped into four families:

- **Visual defaults.** Generic gradients, pill-shaped everything, component libraries shipped untouched.
- **Typography mistakes.** Display fonts on every heading, Inter with no hierarchy, hero text that breaks on mobile.
- **Layout giveaways.** Symmetric three-card grids, consumer-app spacing on dashboards, motion that adds nothing.
- **Content slop.** Em dashes in every sentence, unverified marketing copy, placeholder images in production.

The full list, the enforcement rules, a pre-ship checklist, and twenty-six battle scars from real projects live inside the skill.

## The impression scale

```
1   INVISIBLE      Data terminal. Information is the product.
2   RESTRAINED     Professional dashboard. Quiet and trustworthy.
3   BALANCED       Modern SaaS. The good default.
4   EXPRESSIVE     Design-forward tool. Memorable and opinionated.
5   SPECTACULAR    Product showcase. Every pixel considered.
```

Pick the wrong level and a dashboard feels like a toy, or a landing page feels like a tax form. The skill ties each level to concrete token values so the AI cannot drift.

## What is in the box

| File         | Size  | Purpose                                                                |
| ------------ | ----- | ---------------------------------------------------------------------- |
| `SKILL.md`   | 60 KB | Full design system, 34 tells, tokens, component patterns, checklists, battle scars |
| `BRAIN.md`   | 7 KB  | Optional reasoning architecture for larger, multi-page builds          |
| `PREMIUM.md` | 25 KB | Level 4-5 offensive playbook: font pairings, OKLCH palettes, layered shadows, spring easing, noise textures, glassmorphism, border glow, micro-interactions, hero recipes |
| `MOBILE.md`  | 12 KB | Post-desktop mobile adaptation pass: fluid type, touch targets, safe areas, scroll-snap, animation performance |

Four Markdown files. No runtime, no dependencies, no build step. Stack-agnostic: React, Next.js, Vue, Svelte, plain HTML, Tailwind, vanilla CSS, anything.

## How it works under the hood

1. **Claude Code plugin:** Install from the marketplace. The plugin system handles file placement and activation. Invoke with `/anti-slop-ui [optional prompt]` or let it trigger passively on frontend tasks.
2. **Cursor/Windsurf:** The shell installer drops the four skill files into the appropriate global skills directory and wires a rule file for automatic activation on frontend files.
4. For Level 4-5 builds, the AI loads `PREMIUM.md` on demand for the full offensive playbook. Lower impression levels skip it to save tokens.
5. After the desktop build is complete, the AI reads `MOBILE.md` and runs a mobile adaptation pass: fluid typography, touch targets, safe areas, animation performance, responsive images.
6. Before declaring the task done, the AI self-audits against the 34 tells and the pre-ship checklist.

Existing config files are appended to, never overwritten.

## Uninstall

Remove the skill directory for your editor:

```bash
# Claude Code
rm -rf ~/.claude/skills/anti-slop-ui
# then remove the "## Skills" block from ~/.claude/CLAUDE.md

# Cursor
rm -rf ~/.cursor/skills/anti-slop-ui ~/.cursor/rules/anti-slop-ui.mdc

# Windsurf
rm -rf ~/.windsurf/skills/anti-slop-ui ~/.windsurf/rules/anti-slop-ui.md
```

## License

MIT. Use it, fork it, ship it.

---

Built by [@awaken7050dev](https://github.com/awaken7050dev).
