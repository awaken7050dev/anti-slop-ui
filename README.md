# Anti-Slop-UI

### Stop your Claude Code sites from looking AI-generated.

Every AI-built site looks the same: purple gradients, pill-shaped cards, Inter font everywhere, em dashes in every sentence, "Welcome to [Product]" heroes. Your clients notice. Reddit notices.

This Claude Code skill fixes it.

---

## Install (one command)

Open terminal **in your project folder**, then run:

**Mac / Linux:**
```bash
curl -sL https://raw.githubusercontent.com/awaken7050/anti-slop-ui/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/awaken7050/anti-slop-ui/main/install.ps1 | iex
```

That's it. Next time you run `claude`, the skill activates on any frontend task.

---

## What It Does

Before writing any code, the skill asks:
1. **Who is the audience?** (executive, developer, consumer, creative)
2. **How impressive should it look?** (1=invisible to 5=spectacular)
3. **Light or dark mode?**

Then it applies the right design system, eliminates 18 specific AI tells, and runs a checklist before declaring anything done.

## The 18 Tells It Kills

1. Purple/blue gradient backgrounds
2. Pill-shaped everything
3. Inter font with no hierarchy
4. Symmetric 3-card grids
5. Decorative color with no meaning
6. "Welcome to [Product]" hero sections
7. Default shadcn/MUI styling
8. Pointless bounce animations
9. Consumer-app spacing on data views
10. Spinners instead of skeletons
11. Inconsistent spacing
12. No data attribution
13. **Em dashes everywhere**
14. Unverified marketing copy
15. Display font on every heading
16. Hero text that breaks on mobile
17. Placeholder images shipped to production
18. iOS Safari 100vh bugs

Plus: real image sourcing (Unsplash/Pexels), compact-surviving code comments, and 26 battle scars from real project failures.

## The Impression Scale

```
1 — INVISIBLE      Bloomberg. Data only.
2 — RESTRAINED     Stripe Dashboard. Clean.
3 — BALANCED       Notion. Modern SaaS.
4 — EXPRESSIVE     Raycast. Memorable.
5 — SPECTACULAR    Apple. Every pixel.
```

## What's In The Box

| File | Size | Purpose |
|------|------|---------|
| `SKILL.md` | 41KB | Design system, 18 tells, tokens, patterns, checklists, battle scars |
| `BRAIN.md` | 7KB | Optional reasoning architecture for complex builds |

Works with any Claude model, any stack, any CSS framework.

---

Built by [@awaken7050](https://github.com/awaken7050)
