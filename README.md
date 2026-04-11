# anti-slop-ui

Stop your Claude Code sites from looking AI-generated.

Every AI-built frontend looks the same: purple gradients, pill-shaped cards, Inter font everywhere, "Welcome to [Product]" heroes, em dashes in every sentence. Clients notice. Reddit notices. This Claude Code skill fixes it.

## Install

Run this inside your project folder. It creates `.claude/skills/anti-slop-ui/` and wires the skill into `.claude/CLAUDE.md` so Claude loads it on any frontend task.

**macOS and Linux**

```bash
curl -sL https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.sh | bash
```

**Windows (PowerShell)**

```powershell
irm https://raw.githubusercontent.com/awaken7050dev/anti-slop-ui/main/install.ps1 | iex
```

That is the whole install. Next time you run `claude`, the skill activates automatically.

## What the skill does

Before writing a single line of code, the skill forces three decisions:

1. **Audience.** Executive, developer, consumer, or creative. Each one has a different tolerance for density, color, and motion.
2. **Impression level.** A 1 to 5 scale from Bloomberg Terminal to Apple product page. The level determines type scale, color usage, and how much visual weight is allowed.
3. **Light or dark mode.** Committed upfront, so both states are designed, not retrofitted.

From those answers, Claude picks the design tokens, component patterns, and layout rules that match. It then applies an 18-point filter to eliminate the most common AI tells, and runs a pre-ship checklist before declaring the work done.

## The 18 tells it kills

1. Purple and blue gradient backgrounds
2. Pill-shaped everything
3. Inter with no type hierarchy
4. Symmetric three-card grids
5. Decorative color with no semantic meaning
6. "Welcome to [Product]" hero sections
7. Default shadcn and MUI styling left untouched
8. Pointless bounce animations
9. Consumer-app spacing applied to data views
10. Spinners instead of skeleton loaders
11. Inconsistent spacing between sections
12. Missing data attribution on charts and tables
13. Em dashes in every sentence
14. Unverified marketing copy and fake stats
15. Display fonts on every heading
16. Hero text that breaks on mobile
17. Placeholder images shipped to production
18. iOS Safari `100vh` viewport bugs

Plus real image sourcing guidance (Unsplash, Pexels), code comments that survive compaction, and 26 battle scars collected from real project failures.

## The impression scale

```
1   INVISIBLE      Bloomberg Terminal. Data is the product.
2   RESTRAINED     Stripe Dashboard. Quiet and trustworthy.
3   BALANCED       Notion. Modern SaaS defaults.
4   EXPRESSIVE     Raycast. Memorable and opinionated.
5   SPECTACULAR    Apple product page. Every pixel considered.
```

Pick the wrong level and a dashboard feels like a toy, or a landing page feels like a tax form. The skill ties each level to concrete token values so Claude cannot drift.

## What is in the box

| File       | Size  | Purpose                                                                |
| ---------- | ----- | ---------------------------------------------------------------------- |
| `SKILL.md` | 41 KB | Full design system, 18 tells, tokens, component patterns, checklists, battle scars |
| `BRAIN.md` | 7 KB  | Optional reasoning architecture for larger, multi-page builds          |

Two Markdown files. No runtime, no dependencies, no build step. Stack-agnostic: React, Next.js, Vue, Svelte, plain HTML, Tailwind, vanilla CSS, anything.

## How it works under the hood

1. The installer drops `SKILL.md` and `BRAIN.md` into `.claude/skills/anti-slop-ui/`.
2. It appends a reference to your project's `.claude/CLAUDE.md` so Claude reads the skill before any frontend task.
3. When you ask Claude to build, redesign, or polish a UI, the skill activates, runs the 3-question intake, and applies the matching design system.
4. Before declaring the task done, Claude self-audits against the 18 tells and the pre-ship checklist.

If you already have a `CLAUDE.md`, the installer appends without overwriting. If you do not, it creates one.

## Uninstall

```bash
rm -rf .claude/skills/anti-slop-ui
```

Then remove the `## Skills` block from `.claude/CLAUDE.md`.

## License

MIT. Use it, fork it, ship it.

---

Built by [@awaken7050dev](https://github.com/awaken7050dev).
