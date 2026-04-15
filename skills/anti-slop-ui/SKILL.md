---
name: anti-slop-ui
description: Eliminate AI-generated aesthetic ("vibe coded") from any website or web application. Use this skill whenever building, redesigning, or polishing any frontend (websites, dashboards, SaaS apps, landing pages, portfolios, admin panels, or any web UI). Triggers on phrases like "make it not look AI generated", "make it look professional", "polish the UI", "redesign", "it looks generic", "it looks vibe coded", "make it production-ready", or any request to improve visual quality of a web interface. Also triggers when building any new frontend from scratch to prevent vibe-coding from the start. Works with React, Next.js, Vue, Svelte, HTML/CSS, Tailwind, or any frontend stack.
---

# Anti-Vibe-Code: The Professional Frontend Engineering Skill

This skill prevents AI-generated code from looking AI-generated. It was battle-tested across real projects demoed to senior consultants, executives, and institutional leadership: audiences who evaluate software credibility in under 3 seconds.

The core insight: **vibe-coded sites all look the same because AI models converge on the same defaults.** This skill breaks that convergence by forcing intentional design decisions before any code is written.

---

## STEP 0: UNDERSTAND THE CONTEXT (MANDATORY, DO THIS FIRST)

Before writing ANY frontend code, gather context. **Present these as interactive selectable options, NOT as a wall of text.** Use Claude Code's plan mode, `todowrite` with choices, or any interactive question UI available. The user should be able to TAP/CLICK their answer, not type a paragraph.

If the user's prompt already implies answers (e.g., "build me a dashboard for our analytics team" → audience is Developer/Internal, Impression Scale is 2-3), infer what you can and only ask what's ambiguous.

### Present these questions with selectable options:

**Q1: Who will use this?**
Options: `Enterprise/Executive` | `Developer/Technical` | `Consumer/General` | `Creative/Portfolio` | `Internal Tool`

Quick reference (don't show this to user, use it internally):
- Enterprise → clean, restrained, light mode, exportable, institutional trust
- Developer → dense, keyboard-driven, dark OK, monospace, command-palette UX
- Consumer → friendly, spacious, rounded, mobile-first, approachable
- Creative → bold, distinctive, editorial, rule-breaking, portfolio-grade
- Internal → functional, boring, fast, zero learning curve, admin-panel density

**Q2: Visual energy level?**
Options: `1 Invisible` | `2 Restrained` | `3 Balanced` | `4 Expressive` | `5 Spectacular`

Quick reference (don't show this to user):
- 1 = Data terminal. Information density is the product. Zero decoration.
- 2 = Professional dashboard. Clean hierarchy. Institutional trust.
- 3 = Modern SaaS. The good default. Balanced polish.
- 4 = Design-forward tool. Memorable and opinionated.
- 5 = Product showcase. Every pixel considered. Editorial craft.

**Q3: Light or dark?**
Options: `Light mode` | `Dark mode` | `Both`

Default if user doesn't care: Light for Enterprise/Consumer, Dark for Developer, match the vibe for Creative.

**Q4: Stack?**
Options: `React/Next.js` | `Vue` | `Svelte` | `Plain HTML/CSS` | `Other`

If the project already has a framework, skip this question entirely.

**Q5: Do you have a logo or icon?**
Options: `Yes, I'll provide it` | `No, just use text` | `Generate one for me`

If "No" → use a plain text wordmark (brand name in a distinctive font weight). NEVER create a letter-in-a-rounded-square placeholder.
If "Yes" → ask for the file path or URL before building the header/nav.

**Q6: How many pages?**
Options: `Single page (sections)` | `Multi-page (2-5 pages)` | `Full site (5+ pages)`

This determines nav strategy:
- Single page → nav links scroll to sections on the same page (`#pricing`, `#features`). Do NOT add links to pages that don't exist.
- Multi-page → build all pages. Every nav link must work. Ask which pages they want.
- Full site → plan the sitemap first, build page by page.

**CRITICAL: Never put a nav link that goes nowhere.** If you're building one page, only include nav items that link to sections ON that page. Dead links feel broken.

### After gathering answers, state your plan in ONE sentence:
"Building a [Level X] [light/dark] [framework] interface for [audience]. Design tokens loaded."

### For Level 4-5 ONLY. Pitch One Ambitious Idea Before Building

If the user chose Level 4 or 5, you likely have a creative idea that could take the site from good to memorable. **Pitch it in one sentence before building.** Don't explain the implementation. Just describe the user-facing effect.

Examples:
- "What if the pricing cards do a subtle flip animation when you toggle monthly/yearly?"
- "What if the hero has a live counter showing real-time signups?"
- "What if the feature grid reveals items as you scroll, with each row sliding in from alternating sides?"
- "What if the background subtly shifts color temperature as you scroll down the page?"

Frame it as: "I have an idea that could make this stand out: [idea]. Want me to go for it, or should I keep it clean?"

If the user says yes, build it. If no, proceed with standard Level 4 patterns. If they don't respond, just build with whatever context you have. Don't stall.

### Context Check

If the prompt is vague and you need more context to build well, offer BOTH options in the same message:
"I could ask a few more questions to nail this, or I can just run with what I have. Which do you prefer?"

Never stall the user with 10 questions. Either ask the critical ones via interactive options (Step 0) or just build.

Then proceed to Step 1. Do NOT explain the full design system to the user. Just build.

---

## STEP 1: ELIMINATE THE UNIVERSAL TELLS OF VIBE-CODED SITES

These are the patterns that make ANY site instantly recognizable as AI-generated. Every single one must be eliminated regardless of the Impression Scale level.

### Before applying any of the rules below: The Conceptual Grounding Test

Every element on the page must finish this sentence: "This exists because [product/user reason]." If you cannot finish the sentence, delete the element. Gradients, blobs, aurora lights, floating particles, decorative shapes, filler marquees, and stock hero sections all fail this test by default. Visuals must ARGUE for the product, not decorate around it. Decoration with no argument is the root of every tell in this list. If you are picking visuals from a vibe menu ("warm lighting," "aurora blobs," "glassmorphism feels premium") without a reason tied to the product, you are building slop. Stop, pitch the idea in one sentence, get approval, then build.

**A simple background is always valid.** A flat dark surface, a subtle noise texture, or a single muted gradient can be the right choice at any impression level. Not every site needs a clever conceptual background. If the product speaks for itself (especially physical products with strong photography), a quiet background that stays out of the way is often better than a decorative one.

If you DO choose a decorative or illustrative background, it must pass this test: "What is the ONE physical or functional trait unique to THIS specific product?" The background must be derived from that trait. It must be obvious to someone who knows the product and nonsensical to someone who doesn't. Do NOT borrow visual motifs from other industries. And if a simple background would serve the page better, choose that instead.

### The Tells of Vibe Code (and their fixes)

**1. Purple/blue gradient backgrounds**
THE #1 tell. Every AI defaults to indigo-to-purple or blue-to-cyan gradients because they dominate training data.
- FIX: Use solid colors. If you must use a gradient, make it subtle and unusual. Warm tones, single-hue gradients (light gray to slightly lighter gray), or radial ambient glows.

**2. Excessive border-radius (everything is a pill)**
AI loves `rounded-xl` and `rounded-full` on everything. Cards, buttons, inputs, images.
- FIX: Pick ONE border-radius and use it consistently. For professional tools: 0px on data containers, 4-6px on buttons. For consumer apps: 8px on cards, 6px on buttons. Never use `rounded-full` on cards.

**3. Generic font stacks (Inter, Roboto, Poppins on everything)**
Inter is the new Arial. It is everywhere because every AI suggests it. Same for Roboto, Poppins, and Space Grotesk.
- FIX: At Level 1-2 (institutional), Inter is acceptable as body text with `tabular-nums` and proper weight hierarchy (400 body, 500 labels, 600 headings). At Level 3+, Inter alone is a tell. Pick a distinctive display font (Satoshi, Cabinet Grotesk, General Sans, Clash Display, Instrument Serif, Fraunces) and pair it with a clean body font. The key is PAIRING, not picking one font for everything.

**4. Symmetric card grids with identical padding**
The classic "3 cards in a row with the same padding, same height, same border-radius" layout.
- FIX: Vary card sizes. Use asymmetric grids. Make the hero card wider. Break the grid with a full-width element. If cards MUST be uniform (data tables), make them denser than the AI default. Tighter padding, more data per card.

**5. Decorative color with no meaning**
AI scatters colors randomly. A blue card here, a green badge there, purple accent on the sidebar. None of it means anything.
- FIX: Every color must have semantic meaning. Green = positive/success. Red = negative/danger. Blue = interactive/accent. Amber = warning. Gray = neutral. If you can't explain why something is colored, make it gray.

**6. Stock hero sections with centered text**
"Welcome to [Product Name]" + a one-line description + a big CTA button. This screams "landing page template."
- FIX: If you need a hero, make it do something. Show real data. Show a live preview. Show an interactive element. Or remove it entirely. Tools don't need heroes.

**7. Default component library styling**
Unmodified shadcn, Material UI, or Ant Design components are instantly recognizable.
- FIX: Override at minimum: colors, border-radius, padding, font-size, and hover states. If using shadcn, override the CSS variables AND adjust component density. The defaults are designed to look "fine". You need them to look "yours."

**8. Animations that serve no purpose**
Bounce effects, elastic springs, spinning loaders, parallax scroll, elements flying in from the sides.
- FIX: Match animation to Impression Scale. Level 1-2: hover states only (75-120ms). Level 3: add page transitions (200ms fade). Level 4-5: add staggered reveals and purposeful motion. RULE: if removing the animation changes nothing about comprehension, remove it.

**9. Too much whitespace in data views**
AI defaults to generous padding because consumer apps dominate training data. Enterprise and tool UIs need density.
- FIX: For tools/dashboards: `py-1.5 px-2` for table cells (not `py-3 px-4`). For consumer: current padding is probably fine, but audit for wasted space above the fold.

**10. No loading states (or generic spinners)**
Missing loading states is amateur. Using a spinner instead of a skeleton is lazy.
- FIX: Every data view needs a skeleton that matches the final layout shape. Synchronized shimmer animation via `background-attachment: fixed`. Never show a generic spinner.

**11. Inconsistent spacing**
This is the #1 subconscious trust-killer. Seniors can't articulate it, but they FEEL it. "something looks off about this."
- FIX: Use a spacing scale and stick to it: 4px base (4, 8, 12, 16, 20, 24, 32, 48). Every margin, padding, and gap must be a multiple of 4. Audit spacing between sections. They should be consistent or intentionally varied, never accidental.

**12. No data attribution or timestamps**
For any app showing data, missing "Source: [X]" and "Updated: [date]" labels signal amateur hour.
- FIX: Add a small footer or badge showing data source and freshness. This is especially critical for dashboards, analytics, and any data-driven interface.

**13. Em dashes everywhere (—)**
THE single most obvious sign that AI wrote the copy. Every LLM is addicted to em dashes. Real copywriters almost never use them. One em dash on a page is suspicious. Three is a conviction.
- FIX: After generating ANY text content, run a final scan: replace every `—` with a period, comma, or rewritten sentence. Zero em dashes in client-facing copy. This is non-negotiable. Add this as the LAST step before declaring any page done.

**14. Cocky unverified marketing copy**
AI generates confident claims nobody checked: "We sell out daily." "Trusted by thousands." "The #1 solution." If the client can't prove it, the copy is a liability.
- FIX: Every claim must be verifiable or removed. Replace superlatives with specifics. "Fresh daily" not "The best in town." If there's no data, use descriptive language instead of performance claims.

**15. Display font on EVERY heading**
AI puts the fancy display font on h1 through h6. Display fonts are designed for LARGE sizes. At 14px they look broken.
- FIX: Display/serif fonts on h1 and h2 ONLY. Everything h3 and below uses the body font at different weights/sizes.

**16. Hero text that breaks on mobile**
AI designs for desktop-width text and never checks mobile. A 2-line hero becomes 4 lines on iPhone. A single word orphans onto its own line ("gone."). The descender on "y" or "g" gets clipped by tight line-height.
- FIX: Test EVERY hero on real devices (not just responsive mode). Set `line-height` high enough for descenders (minimum 1.2 for display text). Use `text-wrap: balance` on headings to prevent orphan words. If the hero is more than 2 lines on mobile, reduce font size.

**17. Missing images deployed to production**
AI writes `<img src="/hero.jpg">` with no fallback, no loading state, and no check that the image exists. Site goes live with broken images.
- FIX: Every image element needs: (1) the actual file committed to the repo or a verified URL, (2) a background-color fallback matching the design, (3) `loading="lazy"` on below-fold images, (4) correct `aspect-ratio` set in CSS so layout doesn't shift. NEVER deploy without visually confirming every image loads.

**18. IOS Safari viewport hell**
`100vh` causes the address bar jiggle on iOS Safari. Content jumps when the browser chrome appears/disappears.
- FIX: Use `100dvh` (dynamic viewport height) for full-screen layouts. Test on a REAL iPhone, not just Chrome DevTools responsive mode. The emulator lies about Safari behavior.

**19. Floating pill badges with colored dots ("● PRICING", "✨ FEATURES", "🚀 NEW")**
THE signature move of AI landing pages. A small rounded pill with a pulsing/static dot and an all-caps label floating above a section heading. Real marketing sites almost never do this. It's filler that adds zero information.
- FIX: Delete them entirely. The section heading ("Pricing") is enough. If you need a section label, use a plain uppercase text label without the pill, without the dot, without the border. If there's a blinking/pulsing dot next to ANY text on the page, remove it immediately.

**20. Placeholder logos (letter in a rounded square)**
AI generates a fake logo by putting the first letter of the brand name in a rounded square with a dark background. Every single time. The "M" in a box, the "A" in a circle. Nobody is fooled by this.
- FIX: **Ask the user if they have a logo/icon BEFORE building.** If yes, use it. If no, use plain text for the brand name with a distinctive font weight or color. A clean wordmark ("Metrix" in 600-weight Inter) looks 10x more professional than a fake letter-in-a-box logo. NEVER generate a placeholder icon unless explicitly asked to.

**21. No animation on state changes (toggle/tab switches just swap text)**
AI builds a monthly/yearly toggle that changes the price numbers but nothing else moves. The user clicks, text swaps silently, and they're not sure anything happened. Real sites re-trigger card animations, fade numbers in/out, or slide values to signal "something changed."
- FIX: When content changes from a toggle, tab, or filter: (1) numbers should animate/count to the new value, or at minimum fade out→in with a 150ms transition, (2) if cards had entrance animations, replay them on content switch, (3) add a subtle scale pulse (1.0 → 1.02 → 1.0, 200ms) on the changed elements. The toggle itself should have a smooth sliding indicator, not a hard swap.

**22. Header nav not visually centered on the page**
AI centers nav links within their flex container, but doesn't account for the logo width on the left vs the CTA buttons on the right. Result: the nav LOOKS off-center even though it's technically centered in its container.
- FIX: Use `position: absolute` + `left: 50%; transform: translateX(-50%)` on the nav links container so it's centered relative to the PAGE, not relative to the remaining flex space. Or use a 3-column grid: `grid-template-columns: 1fr auto 1fr` with logo left-aligned, nav centered, CTAs right-aligned.

**23. Dead nav links that go nowhere**
AI generates a full nav bar with "Product", "Customers", "Docs", "Changelog" links that point to `#` or `/product` pages that don't exist. User clicks, nothing happens. This feels broken and dishonest. Worse than having no nav at all.
- FIX: Every link in the nav MUST do one of three things: (1) link to a real page that exists, (2) scroll to a section on the current page using anchor links (`#pricing`, `#features`), or (3) not be there at all. If you're building a single page, remove nav items that would need separate pages. If the user wants multi-page, build the pages or ask first. NEVER ship a nav link that goes nowhere.

**24. Abstract graphics that don't read as what they represent**
AI loves generating "cool" abstract visuals (orbital rings, particle systems, mesh gradients) that are supposed to represent the product but do not. A speaker driver becomes a solar system. A data pipeline becomes a lava lamp.
- FIX: Mechanical test: name the graphic with a concrete noun in one sentence ("this is a waveform of sound pressure over time", "this is a blueprint grid"). If the only nouns you can use are abstract (energy, flow, connection, synergy, journey), delete and try again. Concrete noun passes. Abstract noun fails. If you can't produce a concrete noun at all, use a product photo or labeled diagram instead.

**25. Marquee/ticker banners as filler**
The infinite scrolling text marquee ("Feature 1 • Feature 2 • Feature 3...") became a vibe-code cliché in 2024-2025. Every AI landing page has one. It's used because it's cheap visual polish that fills space between sections, not because it serves the content. Real premium sites that use marquees do it for client logos or press mentions, NOT for feature lists.
- FIX: If your feature list has fewer than 8 items, use a static grid or list. Marquees are only justified for: (1) client logo strips showing 10+ logos, (2) press mention tickers, (3) live data feeds. If you can't justify why the content needs to MOVE, make it static.

**26. Cursor-dependent design that breaks on mobile**
AI builds atmospheric effects (glowing orb following cursor, parallax on mouse position, particle systems reacting to hover) that make the desktop experience feel premium but leave mobile users with a flat, empty page. If removing the cursor makes the page feel broken, the design is broken.
- FIX: Design the page WITHOUT any cursor interaction first. It must look complete as a static page. Cursor effects are enhancement only: the "with cursor" version should be better, but the "without cursor" version must not look empty or incomplete. Test by loading on mobile (or just not moving your mouse for 10 seconds).

**27. Viewport units that prevent browser zoom**
AI locks hero height to `100dvh`, headline size to `clamp(56px, 9.2vw, 152px)`, and containers to `max-height: calc(100dvh - 280px)`. When the user zooms out (Ctrl+minus), viewport units rescale with zoom level. The layout resists the zoom instead of shrinking. The design gets BIGGER relative to everything else. This is an accessibility failure for low-vision users.
- FIX: Use `rem` for type sizing, not `vw`. Let hero sections flow with content height instead of locking to `dvh`. Reserve viewport units for full-screen landing heroes only, and even then, set them as `min-height: 100dvh` not `height: 100dvh` so content can overflow if zoomed.

**28. Theatrical cosplay elements masquerading as UI chrome**
AI sees a themed concept (military, cyberpunk, retro, noir, defense) and tries to reinforce it by dressing the browser chrome in costume. A defense-themed site gets a "CLASSIFIED · TIER III ACCESS · AUTHORIZED PERSONNEL ONLY" strip above the nav. A cyberpunk site gets "SYSTEM.LOG // 2087.11.02 :: CONNECTION SECURE" in the footer. A retro site gets a fake CRT scanline overlay and a fake "CH 01" TV channel indicator. Most real companies in those industries do not do this. The theme belongs in the typography, palette, copy tone, photography, and product language. The browser chrome (nav, banners, headers, footers, cookie notices) usually stays realistic.
- FIX: Default: themed props OFF on UI chrome. Typography, copy tone, color palette, and photography carry the theme. If you want to add a themed UI element (scanline, fake classified strip, terminal log), first justify it in one sentence tied to the product: "This exists because the product IS a [genuine retro CRT emulator / actual classified ops tool]." Generic "it fits the vibe" is not a justification. A subtle scanline on a product that emulates a CRT is fine; a fake CLASSIFIED banner on a marketing site for a SaaS app is not.

**29. Eccentric Unicode glyphs as section markers for fake institutional credibility**
AI reaches for unusual Unicode characters (§, ¶, ※, ◆, ∞, ☰, ◎, ⟡, ❖) as section markers because they "feel" sophisticated or institutional. The most common offender is the section sign § in front of numbered sections: `§01 / DIVISIONS`, `§02 / CAPABILITIES`, `§03 / APPROACH`. To a typography nerd it reads as "legal document, government report, academic paper." To a normal visitor it looks weird and affected, like the site is cosplaying a textbook instead of communicating. Real companies use plain numbers (`01`, `02`) or plain words (`Section 1`, `Overview`, `Approach`).
- FIX: Section markers are `01`, `02`, `03` or `Section 1`, `Overview`, `Approach`. Never use §, ¶, ※, ◆, ∞, ☰, ◎, or other eccentric glyphs as markers. If you're tempted to reach for one, you're designing a prop, not a label. The only acceptable special characters in a section label are the period or slash as separators (for example, `01 / Divisions` or `Section 1. Overview`).

**30. Decorative horizontal dashes and lines before uppercase eyebrow labels**
The AI move: a small horizontal line, pipe, or dash sitting to the left of a tracked uppercase label (`— ESTABLISHED BREMEN`, `|| OVERVIEW`, `▸ FEATURES`), often implemented as `<span class="line"></span>` or a `::before` pseudo-element with `content: "—"`. Every vibe-coded landing page has this. It is cheap visual polish that "frames" the label. Real editorial and SaaS sites almost never do it. A tracked, uppercase, mono-font label already signals "this is a label" through typography alone. Adding a dash or a line next to it is belt-and-suspenders design: redundant, decorative, and instantly recognizable as AI.
- FIX: Delete the horizontal line, the dash prefix, the pseudo-element, and any `::before { content: "—" }` decoration. The label stands on its own. If it needs more visual separation from the content below it, add vertical margin, not a horizontal prop. Test: cover the dash or line with your finger and see if the label still looks like a label. It will, because letter-spacing and case are already doing the work. The dash was never needed.

**31. Header that hides and reveals on scroll**
AI builds headers that start invisible and slide down when the user scrolls, or disappear on scroll-down and reappear on scroll-up. This creates a jarring "now you see me" effect. Real premium sites keep the header permanently visible with a semi-transparent blurred background so content scrolls naturally behind it.
- FIX: Header should be `position: fixed` with `backdrop-filter: blur(12px)` and a semi-transparent background (`rgba(0,0,0,0.6)` for dark, `rgba(255,255,255,0.8)` for light). Always visible. Never hide the header entirely on scroll. The blur lets page content pass behind it without visual clutter.

**32. Random accent styling on wordmark letters**
AI loves to italicize or color one random letter in a text-only brand wordmark ("Lumin*a*", "Met*r*ix") for "visual interest." No real brand does this unless it is part of their actual designed logo. It looks like a typo or a broken font weight.
- FIX: Text-only wordmarks should use uniform styling. Same weight, same style, same color for every letter. If the user wants a distinctive wordmark, vary the FONT or WEIGHT of the entire word, not individual letters. Only apply per-letter styling if the user explicitly requests it or provides a logo that uses it.

**33. Filter-blur morphing blob backgrounds**
The 2024-2025 AI signature move: `filter: blur(100px)` (or higher) applied to saturated radial gradients, combined with morphing `border-radius: 60% 40% 30% 70%` "blobs," often animated. Every prompt-engineered landing page has this. Tell #1 is about the color; this is about the TECHNIQUE. Aurora blobs, lavender blobs, amber blobs, teal blobs are the same category regardless of hue.
- FIX: Default: blurred blobs OFF. Simple backgrounds (flat tinted dark, noise texture, single muted gradient) are the anti-slop choice. If you still want an ambient blurred gradient (some real sites do ship these well), it must pass both of: (a) the Conceptual Grounding Test (the shape/hue ties to a product trait, not decoration), AND (b) motion is subtle or absent (no morphing `border-radius` blob animations). Saturated hues + 100px+ blur + morphing animation is the combination that reads as slop. Miss any one of those ingredients and the technique can work.

**34. Desktop-only design shipped without mobile adaptation**
The site looks polished at 1440px but falls apart on a phone: horizontal overflow, unreadable text, untappable buttons, hero images that push the CTA below the fold, hover-dependent interactions that vanish on touch devices. AI builds for the preview window width (desktop) and never tests on a real phone. A site that 60%+ of visitors cannot use comfortably is not a finished site.
- FIX: After completing the desktop build, run a mobile adaptation pass using MOBILE.md. Check every section at 375px. Tap every button. Scroll through every page. If the mobile version feels like a shrunken desktop instead of a phone-designed experience, it is not done.

---

## STEP 2: APPLY LEVEL-SPECIFIC DESIGN SYSTEM

Based on the Impression Scale from Step 0, apply these specific rules:

### Level 1-2: Institutional / Professional

**Color palette:**
```css
--background: #F8F9FA;      /* cool gray page */
--surface: #FFFFFF;          /* white cards */
--elevated: #F4F5F7;         /* hover/active */
--border: rgba(0,0,0,0.10);  /* subtle borders */
--text-primary: #1A1D23;
--text-secondary: #5E6368;
--text-tertiary: #8C9196;
--accent: #2D72D2;           /* institutional blue */
--success: #238551;
--warning: #D97706;
--danger: #CD4246;
```

**Typography:** Inter 14px base, JetBrains Mono for numbers with `font-variant-numeric: tabular-nums`. Weight hierarchy: 400 (body), 500 (labels), 600 (headings). Max heading size: 18px.

**Spacing:** 4px grid. Table cells: `py-1.5 px-2`. Card padding: `p-3`. Section gaps: 16-24px.

**Borders:** 1px `rgba(0,0,0,0.10)`. No border-radius on data containers. 4-6px on buttons.

**Shadows:** Minimal. `0 1px 2px rgba(0,0,0,0.04)` for cards. No shadows on hover (use background color change instead).

**Animations:** Hover states only (120ms). Optional: skeleton loading shimmer. No page transitions, no staggered rows unless the builder explicitly wants visual craft (bump to Level 3).

**Right-align all numbers. Format professionally: $1.2M not $1234567. Use tabular-nums for column alignment.**

### Level 3: Modern SaaS (The Default)

Start with Level 2 tokens, then add:
- Border-radius: 8px on cards, 6px on buttons, 4px on inputs
- Shadows: multi-layer (`0 1px 3px rgba(0,0,0,0.04), 0 4px 8px rgba(0,0,0,0.04)`)
- Page transitions: opacity fade 200ms
- Row/list stagger: 40-60ms per item, max 400ms total
- Typography: 16px base, allow display sizes up to 32px
- Spacing: 8px grid base. More breathing room.

### Level 4-5: Expressive / Spectacular

**For Level 4-5 builds, load PREMIUM.md.** It contains the full offensive playbook: 10 curated font pairings with CDN links, OKLCH color palette generator, layered shadow system, spring easing presets, noise/grain textures, glassmorphism recipes, border glow system, micro-interaction patterns, hero moment recipes, SVG decorations, cursor enhancements, and scroll-triggered animations.

Start with Level 3 tokens, then apply PREMIUM.md patterns on top. The anti-slop-ui rules from Steps 1-10 still apply at Level 4-5. PREMIUM.md adds craft, it doesn't override safety.

---

## STEP 3: COMPONENT PATTERNS BY LEVEL

### Data Tables

**Level 1-2 (Institutional):**
```
Header: bg-gray-50, 11px uppercase mono, tracking-wider
Rows: 36-40px height, divide-y, hover:bg-gray-50
Numbers: right-aligned, mono, tabular-nums
Cell padding: py-1.5 px-2
Negative: red text. Positive: green text.
No alternating row colors unless table is very wide.
```

**Level 3 (Modern SaaS):**
```
Header: bg-gray-50, 12px medium weight, tracking-normal
Rows: 44-48px height, divide-y, hover:bg-gray-50, rounded-lg on hover
Numbers: right-aligned, tabular-nums
Cell padding: py-2 px-3
Subtle row transition: 100ms background color
```

**Level 4-5 (Expressive):**
```
Custom header with accent underline or gradient
Rows with staggered entrance animation (40ms each)
Hover: slight scale(1.005) + shadow elevation
Numbers in distinctive mono font
Optional: inline sparkline charts in number columns
```

### Cards

**Level 1-2:** `bg-white border border-gray-200 shadow-none p-3`
**Level 3:** `bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow p-4`
**Level 4-5:** `bg-white/80 backdrop-blur rounded-xl shadow-lg hover:translate-y-[-2px] p-5` with entrance animation

### Buttons

**Level 1-2:** `bg-blue-600 text-white rounded-md h-7 px-2 text-xs hover:bg-blue-700 transition-colors duration-100`
**Level 3:** `bg-blue-600 text-white rounded-lg h-9 px-4 text-sm hover:bg-blue-700 shadow-sm transition-all duration-150`
**Level 4-5:** Custom with press animation, gradient background, glow on hover, or border animation

### Loading States

**ALL levels:** Skeleton screens that match the final layout. Never a spinner. Synchronized shimmer via:
```css
.skeleton {
  background: linear-gradient(90deg, var(--elevated) 25%, var(--surface) 50%, var(--elevated) 75%);
  background-size: 200% 100%;
  background-attachment: fixed; /* synchronizes all skeletons */
  animation: shimmer 1.5s ease-in-out infinite;
}
@keyframes shimmer {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
```

---

## STEP 4: THE ANTI-SLOP CHECKLIST

Run this checklist before declaring any frontend work done. If ANY check fails, fix it before moving on.

### Universal Checks (all levels)

The 34 Tells above ARE the checklist for slop. Do not re-run them here. These checks cover items NOT derivable from the Tells.

- [ ] **Every visual element passes the Conceptual Grounding Test?** (For every background, shape, animation, and decoration: can you finish "this exists because [product reason]"? If no, delete.)
- [ ] **Mechanical scans run on the output?** Grep the codebase for:
   - `—` (em dash): zero in client-facing text
   - `from-\w+-\d+ to-\w+-\d+` (Tailwind gradient): none purple/blue
   - `rounded-full` on containers: zero
   - `console.log`: zero in production
   - `href="#"` or `href=""`: zero (dead nav links)
   - `Welcome to` in hero copy: zero
- [ ] **`prefers-reduced-motion` respected?** All animations wrapped in the media query.
- [ ] **All colors from CSS variables / design tokens?** No hardcoded hex or rgb in components.
- [ ] **All images have alt text AND a description comment upstairs?** ("Image: barista pouring latte in white cup" above the tag.)
- [ ] **Every empty state has a message + action?** (No blank screens.)
- [ ] **Landmark comments at every major section?** (Hero, Nav, Content, Footer marked for post-compaction navigation.)
- [ ] **Component files have a purpose comment at top?** (What it renders, where used, data deps.)
- [ ] **`-webkit-font-smoothing: antialiased` set on html?** One line, instant premium text rendering.
- [ ] **Mobile adaptation pass complete?** (Read MOBILE.md. Test at 375px, 390px, 412px on a real phone. Tap every button. Scroll every section.)

### Level 1-2 Additional Checks

- [ ] **Zero border-radius on data containers?** (Cards, panels, tables = sharp edges)
- [ ] **All numbers in monospace font with tabular-nums?**
- [ ] **Numbers right-aligned, text left-aligned?**
- [ ] **Cell padding ≤ py-2 px-3?** (Data density, not consumer spacing)
- [ ] **No text larger than 18-20px?** (Except report cover pages)
- [ ] **Data attribution visible?** (Source label + timestamp on data views)
- [ ] **Hover transitions ≤ 120ms?** (Faster = more professional)
- [ ] **No animations beyond hover states?** (Unless explicitly requested)
- [ ] **Passes the "PowerPoint screenshot test"?** (Would it look native in a corporate slide deck?)

### Level 4-5 Additional Checks (requires PREMIUM.md)

- [ ] **Font pairing from PREMIUM.md curated list?** (Not Inter, not Roboto, not Poppins)
- [ ] **OKLCH hue outside 200-280?** (Or blue paired with warm accent?)
- [ ] **Shadows are layered (3+ layers)?** (Not single box-shadow)
- [ ] **Spring easing curves used?** (Not browser default ease/ease-in-out)
- [ ] **At least one "hero moment" exists?** (One memorable visual. Not three)
- [ ] **Micro-interactions on buttons, inputs, cards?** (Press, focus glow, hover lift)
- [ ] **Noise/grain texture on at least one background section?**
- [ ] **Background is not a flat solid color?** (Gradient, texture, pattern, or layered depth)
- [ ] **Font pairing matches this specific brand's personality?** (Not the first option in the list)
- [ ] **Page looks complete WITHOUT cursor movement?** (Test by not moving mouse for 10s)

---

## STEP 5: DARK MODE vs LIGHT MODE EXECUTION

### Light Mode Palette (Institutional / Consumer)
```css
--bg-page: #F8F9FA;        /* NOT pure white — too harsh */
--bg-card: #FFFFFF;         /* pure white for elevation contrast */
--bg-hover: #F4F5F7;
--border: rgba(0,0,0,0.10); /* transparent borders feel embedded */
--text-1: #1A1D23;          /* ~15:1 contrast */
--text-2: #5E6368;          /* ~5.5:1 contrast */
--text-3: #8C9196;          /* tertiary */
--shadow-sm: 0 1px 2px rgba(0,0,0,0.04);
--shadow-md: 0 1px 3px rgba(0,0,0,0.04), 0 4px 8px rgba(0,0,0,0.04);
```

### Dark Mode Palette (Developer / Creative)
```css
--bg-page: #0A0A0F;        /* near-black with slight blue */
--bg-card: #12121A;         /* cards slightly lighter */
--bg-hover: #1A1A28;
--border: rgba(255,255,255,0.08);
--text-1: #E4E4E7;
--text-2: #71717A;
--text-3: #3F3F46;
--shadow-sm: 0 1px 2px rgba(0,0,0,0.3);
--shadow-md: 0 4px 12px rgba(0,0,0,0.25);
```

### The Rule: **NEVER mix light and dark palettes randomly.** Pick one. Commit. If building theme switching, implement it properly with CSS variables, never with conditional classes scattered across components.

---

## STEP 6: FONTS THAT AREN'T VIBE CODE

### For Level 1-2 (Professional)
- **Body:** Inter (common, but at this level "invisible" is the goal). Use weights 400/500/600, `tabular-nums` on numbers, no decorative variants.
- **Numbers/Data:** JetBrains Mono with `font-variant-numeric: tabular-nums lining-nums`
- **Alternative body:** Geist (less common than Inter, same quality, self-host from the open-source repo)

### For Level 3 (Modern SaaS)
- **Display:** Satoshi, General Sans, or Plus Jakarta Sans (Inter alone is a tell at this level)
- **Body:** A lighter weight of the display font, or a paired clean sans
- **Mono:** JetBrains Mono, Fira Code, or Berkeley Mono

### For Level 4-5 (Distinctive)
- **Display:** Clash Display, Cabinet Grotesk, Instrument Serif, Fraunces, Playfair Display
- **Body:** Satoshi, General Sans, Switzer
- **Accent:** A handwriting or experimental font for callouts (use very sparingly)

### Loading fonts without layout shift:
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
```
For self-hosted (better performance): use `@font-face` with `font-display: swap` and `woff2` format.

---

## STEP 7: WHAT GOOD LOOKS LIKE BY LEVEL

Study shipped products, not design showcases. Design galleries reward novelty. Shipped products reward usability.

### Level 1-2: What to study
- Financial data terminals: density, color restraint, monospace typography, tabular alignment
- Enterprise analytics dashboards: light mode data density, institutional feel, export-ready layouts
- Payment platform dashboards: clean hierarchy, restrained palette, subtle hover states
- Open-source design systems from financial institutions: component patterns, accessibility compliance

### Level 3: What to study
- Project management tools with strong dark mode: polish, animation timing, transition choreography
- Note-taking and collaboration apps: light mode, subtle shadows, clean spacing, content-first
- Developer platform dashboards: type system discipline, data table patterns, monospace integration
- Keyboard-first productivity tools: command palette UX, shortcut-driven interaction

### Level 4-5: What to study
- Payment platform marketing sites: animation choreography, gradient execution at scale
- Developer tool marketing sites: editorial layout, scroll-triggered animations, asymmetric grids
- Collaboration SDK sites: interactive demos embedded in marketing, personality in UI copy
- Transactional email platforms: dark mode with restraint, distinctive typography, minimal but bold

---

## COMMON PITFALLS AND SAVES

### "The client says it looks too plain"
They mean it lacks visual hierarchy, not that it needs gradients. Fix: add ONE accent color more boldly, increase heading size contrast, add a subtle page entrance animation. Don't add decoration. Add emphasis.

### "It looks like every other dashboard"
Fix: Change ONE thing dramatically. A distinctive sidebar design. An unusual chart style. A custom loading animation. You don't need to change everything. One memorable element breaks the pattern.

### "Dark mode looks hackerish"
Fix: Warm up the dark palette. Use `#0A0A0F` (slight blue) not `#000000` (pure black). Use slightly warmer grays for text. Add very subtle warm-toned accent colors.

### "The animations feel janky"
Fix: Use `ease-out` for entrances (decelerating = natural). Use `ease-in` for exits only. Duration: 100-150ms for micro (hover), 200-300ms for page transitions, 800ms max for hero animations. No bounce. No elastic. No overshoot in professional contexts.

### "It looks good on my screen but terrible in the demo"
Fix: Test on a projector or external monitor. Light mode handles ambient light better. Increase contrast ratios. Avoid thin fonts (< 400 weight) and very small text (< 12px) for projected content. Always have a backup plan (screenshots as PDF).

---

## PROMPT-TO-LEVEL INFERENCE

When the user's prompt is vague, infer the Level from language cues without asking:
- "enterprise / professional / institutional / serious" → Level 2
- "dashboard / SaaS / internal tool / just make a [app]" → Level 3
- "modern / polished / impressive / designed" → Level 4
- "amazing / stunning / spectacular / product showcase / award-winning" → Level 5
- "data terminal / trading / quant / information-dense" → Level 1

Once Level is set, STEP 2 and STEP 3 above are the source of truth for tokens and components. Do not re-derive them.

---

## STEP 8: THE FINAL SCAN (MANDATORY, RUN AFTER EVERYTHING ELSE)

After the site is "done," run this scan before showing it to anyone. This catches the things that slip through design review because they're copy/content issues, not design issues. For verification depth (how many breakpoints to test, etc.), follow BRAIN.md.

### Em Dash Elimination Pass
```
Search the ENTIRE codebase for: —
Replace every instance with appropriate punctuation:
  - If connecting two clauses → use a period or semicolon
  - If setting off a phrase → use commas or parentheses  
  - If indicating a range → use "to" (e.g., "9 to 5" not "9—5")
  - If none of the above → rewrite the sentence

ZERO em dashes should remain in any user-facing text.
This includes: headings, body copy, button text, tooltips, 
error messages, placeholder text, meta descriptions, alt text.
```

### Copy Audit
- Search for "the best", "the #1", "trusted by", "world-class", "cutting-edge", "revolutionary", "game-changing". Delete or replace with specifics
- Search for exclamation marks. Maximum 1 per page, and only if the context genuinely warrants excitement
- Read every heading aloud. If it sounds like a LinkedIn post, rewrite it
- Check that no placeholder text remains ("Lorem ipsum", "Your tagline here", "Description goes here")

### Visual Audit (do this in the BROWSER, not in code)
- Screenshot every page at 1280px, 768px, and 375px width
- Check: does any text overflow its container?
- Check: does any image have wrong aspect ratio (stretched/squished)?
- Check: are there any alignment inconsistencies between adjacent elements?
- Check: does the hero look the same on your screen as on a different device?

### The 3-Second Test
Open the site fresh (clear cache, incognito). Look at it for exactly 3 seconds, then look away. Write down what you remember. If you remember "it was dark with blue accents" or "there were gradient cards". It's vibe-coded. If you remember the CONTENT or the DATA. You've succeeded.

---

## BATTLE SCARS (why some rules look paranoid)

Four representative failures from real projects, each caught in a browser AFTER the code looked "done":

1. **Emulator lied about mobile.** Hero text rendered as 2 lines in Chrome responsive mode, 3 lines on an actual iPhone 12. The descender on "y" was clipped by tight line-height. Rule created: test on a real device, set min line-height 1.2 on display text.
2. **Hero deployed with broken images.** `<img src="/hero.jpg">` with no fallback, no loading state, no check the file existed. Rule created: Tell #17, verify every image loads in the browser before ship.
3. **Third stat dropped to a new line at 768px.** Desktop and mobile both looked fine; tablet (iPad portrait) broke the row. Rule created: test at 768px specifically as a breakpoint, not just 360/1280.
4. **Animation fired before background image loaded.** Text appeared over a blank page for 200ms. Rule created: sequence animations behind asset load, not wall-clock time.

**The meta-lesson:** code review is not visual review. If you built it, you cannot see its flaws. Open the browser, on real devices, with fresh eyes. 3-second first impression is the test that matters.

---

## STEP 9: IMAGE SOURCING (NO PLACEHOLDERS, NO WATERMARKS)

A site with gray placeholder boxes or watermarked stock photos is INSTANTLY identifiable as unfinished/vibe-coded. Real sites have real images.

### Free, No-Watermark Image Sources

**For backgrounds, heroes, and atmospheric shots:**
- **Unsplash** (unsplash.com). High quality, free, no attribution required. Use the API or direct URLs: `https://images.unsplash.com/photo-[ID]?w=1200&q=80`
- **Pexels** (pexels.com). Similar quality, free, no attribution required
- **Pixabay** (pixabay.com). Free, no attribution, wider variety including illustrations

**For UI icons:**
- **Lucide** (lucide.dev). Clean, consistent SVG icons. `npm install lucide-react`
- **Heroicons** (heroicons.com). Tailwind's official icon set
- **Phosphor** (phosphoricons.com). Flexible weight system
- NEVER use emoji as icons in professional interfaces

**For product/business photos:**
- ALWAYS use the client's REAL photos if available
- If no real photos: use Unsplash/Pexels with SPECIFIC search terms (not "business meeting". Search "coffee shop interior kuala lumpur" or "office building malaysia")
- NEVER use obviously American stock photos for non-US businesses
- **For product hero shots (Level 4-5):** search for "product name cutout", "product name PNG isolated", or "product name product shot on black/white". Product images floating on the page without a visible background look 10x more premium.

### Product Image Background Removal

The best product images float on the page without a studio backdrop. When you find the perfect product image but it has a background, REMOVE it rather than settling for a worse transparent image.

**PREFERRED: Remove the background with rembg (Claude Code can run this):**
```bash
pip install rembg --break-system-packages
rembg i input.jpg output.png
```
One command. Strips the background, outputs a transparent PNG. Use this whenever a product hero image has a background that clashes with the page.

Works well for: electronics, headphones, laptops, watches, shoes, bags, bottles, furniture, and any solid object with clear edges.

Skip rembg for: portraits with hair, transparent or glass objects, smoke, fabric with fuzzy edges. For these, search for a pre-cut image or use mix-blend-mode instead.

**CSS FALLBACK: mix-blend-mode (when rembg is not available):**

On dark page backgrounds, make dark image backgrounds disappear:
```css
.product-image { mix-blend-mode: multiply; }
```

On light page backgrounds, make white image backgrounds disappear:
```css
.product-image { mix-blend-mode: screen; }
```
Note: mix-blend-mode is imperfect. It affects the entire image, not just the background. Colors shift. Use rembg when possible.

**Image search terms for product shots:**
- "isolated" or "cutout" or "product shot" for clean images
- "on black" for dark-themed sites (black background blends naturally)
- "on white" for light-themed sites
- Avoid: "lifestyle", "in use", "on desk" when you want a clean hero

### How Claude Code Should Handle Images

When building a site, Claude should:
1. **Identify every place an image is needed** (hero, about section, team, products, backgrounds)
2. **Search for real images** using Unsplash/Pexels URLs with descriptive queries matching the actual business
3. **Use direct URLs with size parameters**. `?w=800&q=80` for content images, `?w=1920&q=80` for heroes
4. **Set proper CSS**. `object-fit: cover`, explicit `aspect-ratio`, `loading="lazy"` on below-fold images
5. **Add a background-color fallback** that matches the image's dominant tone (so layout doesn't flash white while loading)
6. **VERIFY every image URL loads** before declaring the page done

### Image Anti-Patterns
- Gray boxes with "Image placeholder" text. NEVER ship this
- Watermarked stock photos. Check that the source is actually free
- Images that don't match the business (American office for a Malaysian company)
- All images the same aspect ratio when they shouldn't be (hero should be wide, team photos should be square)
- No `alt` text on images. Accessibility and SEO failure
- Images not optimized (serving a 4000px image in a 400px container)
- Colored ambient glow or radial gradient behind product images. The product should sit directly on the page background with no artificial lighting effects. Glow behind a product looks like a gaming peripheral ad, not a premium brand. If the product needs to "pop," use contrast with the page background color, not a colored shadow.

---

## STEP 10: CODE COMMENTS AND NAMING (COMPACT SURVIVAL)

Claude Code sessions get compacted. The AI loses context and has to re-read code to understand what it built earlier. Without comments, it's blind. Without descriptive names, a user saying "change the chair image" becomes an impossible scavenger hunt through `img-x8fj2k.png`.

This section ensures code survives compaction AND stays navigable for humans.

### File and Asset Naming

**NEVER use random hashes or abbreviations for user-visible assets:**
```
BAD:  hero-bg.png, img1.jpg, photo-xj29dk.png, bg2.webp
GOOD: coffee-shop-interior-main.jpg, team-photo-founders.jpg, hero-kuala-lumpur-skyline.webp
```

**Name images by what they SHOW, not where they GO:**
```
BAD:  homepage-section-2.jpg (meaningless if layout changes)
GOOD: barista-pouring-latte.jpg (always findable by description)
```

**CSS/component files. Name by function:**
```
BAD:  styles2.css, Component1.tsx, utils.ts
GOOD: hero-section.css, pricing-table.tsx, format-currency.ts
```

### Landmark Comments (Section Markers)

Add landmark comments at every major section boundary. These are what Claude reads after compaction to rebuild its mental map of the file.

```html
<!-- ============================================
     HERO SECTION
     Full-width hero with KL skyline background image
     and main CTA "Get Started" button
     ============================================ -->

<!-- ============================================
     MENU GRID  
     3-column grid of food items with prices
     Images: hand-pulled-noodles.jpg, nasi-lemak-platter.jpg, etc.
     ============================================ -->

<!-- ============================================
     TESTIMONIALS CAROUSEL
     3 customer quotes, auto-rotating every 5s
     ============================================ -->
```

For React/JSX:
```tsx
{/* ==========================================
    PORTFOLIO HOLDINGS TABLE
    14 PNB companies with ticker, price, stake %
    Data source: ghost-quotes.ts (cached yfinance)
    ========================================== */}

{/* ==========================================
    STATE DIVERGENCE MAP
    MapLibre choropleth of Malaysian states
    Green=healthy, Amber=slowing, Red=stressed
    Click state → detail panel on right
    ========================================== */}
```

### Image Description Comments

**Every image element MUST have a comment describing what the image actually shows.** This is the #1 thing that saves time after compaction or when a user asks "change that photo."

```html
<!-- Image: wooden cafe interior with exposed brick, warm lighting, 3 tables visible -->
<img src="/images/cafe-interior-warm.jpg" alt="Brew Lab interior" />

<!-- Image: close-up of latte art in white ceramic cup on wooden counter -->
<img src="/images/latte-art-closeup.jpg" alt="Signature latte" />

<!-- Image: aerial view of Kuala Lumpur skyline at sunset, KLCC towers prominent -->
<img 
  src="https://images.unsplash.com/photo-1596422846543-75c6fc197f07?w=1920&q=80" 
  alt="Kuala Lumpur skyline"
/>
```

For background images in CSS:
```css
/* Background: dark roasted coffee beans filling the frame, slightly out of focus */
.hero {
  background-image: url('/images/coffee-beans-dark-roast.jpg');
}
```

### Component Purpose Comments

At the top of every component file, add a 2-3 line comment explaining:
1. What it renders
2. Where it's used
3. What data it depends on

```tsx
/**
 * PricingTable — displays 3 pricing tiers (Starter/Pro/Enterprise)
 * Used on: /pricing page, embedded in /homepage section 4
 * Data: hardcoded in PLANS array below
 */
export function PricingTable() { ... }

/**
 * MacroStrip — horizontal row of 6 economic indicators (OPR, CPI, GDP, etc.)
 * Used on: /dashboard (top), /portfolio (top)
 * Data: passed via props from parent page's server fetch
 */
export function MacroStrip({ indicators }: Props) { ... }
```

### What NOT to Comment

Don't poison the codebase with noise comments:

```tsx
// BAD — stating the obvious
const [isOpen, setIsOpen] = useState(false); // state for whether it's open
return <div className="flex">; // flex container

// BAD — commenting out old code instead of deleting it
// const oldFunction = () => { ... }
// TODO: maybe use this later?

// GOOD — explaining WHY, not WHAT
const STAGGER_DELAY = 60; // 60ms between rows, max 600ms total per DESIGN_SYSTEM.md
const OPR = 2.75; // BNM held rate at MPC March 5, 2026 — verify before demo
```

### The Compact Survival Test

Before declaring a file done, imagine Claude Code gets compacted and has to re-read this file cold. Ask:
1. Can it tell what each section does from the landmark comments alone?
2. Can it find "the image with the chair" from the image description comments?
3. Can it understand why a specific value was chosen from the WHY comments?
4. Can it identify the component's purpose from the top-of-file comment?

If ANY answer is no, add the missing comment. 30 seconds of commenting now saves 5 minutes of confusion after compaction.

---

## FILE PRECEDENCE

If guidance conflicts across files:
- **SKILL.md wins** for visual decisions (tokens, Tells, components, copy rules).
- **BRAIN.md wins** for process decisions (how to decompose, verify, handle rejection).
- **PREMIUM.md** extends SKILL.md for Level 4-5; never contradicts it.
- **MOBILE.md** runs AFTER desktop is complete; never overrides desktop tokens, only adapts them.
