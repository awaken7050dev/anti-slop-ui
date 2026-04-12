# PREMIUM.md: The Offensive Playbook (Level 4-5 Only)

**Load this file ONLY when the user selects Level 4 (Expressive) or Level 5 (Spectacular) on the Impression Scale.** For Level 1-3, SKILL.md alone is sufficient. Loading this for a simple dashboard wastes tokens.

This file teaches Claude HOW to create premium visual design, not just what to avoid. Every pattern below is copy-paste ready CSS that produces the "how the fuck did you make this" reaction from experienced engineers.

---

## SECTION A: PREMIUM FONT PAIRINGS

Do NOT pick fonts randomly. Match the pairing to the site's context. Each entry includes the exact Google Fonts import URL. Copy-paste it, don't reconstruct it.

**ANTI-CONVERGENCE RULE:** Never use the same font pairing twice in the same session. If you already used Fraunces + Albert Sans for a previous generation, pick a different pairing for the next one.

### 1. Fraunces + Albert Sans
**Vibe:** Warm editorial, organic, human
**Best for:** Food, luxury, lifestyle, wellness, hospitality
**Why it works:** Fraunces has Wonk and Softness variable axes that create visual interest. Albert Sans is clean without being clinical.
```html
<link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,300..900;1,9..144,300..900&family=Albert+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```
```css
--font-display: 'Fraunces', serif;
--font-body: 'Albert Sans', sans-serif;
```

### 2. Clash Display + Satoshi
**Vibe:** Sharp, confident, modern
**Best for:** SaaS, fintech, dev tools, startups
**Why it works:** Clash Display has aggressive geometry that commands attention. Satoshi is the new Inter: clean but less overused.
Note: These are from fontshare.com (free). Use CDN links from their site or self-host.
```css
--font-display: 'Clash Display', sans-serif;
--font-body: 'Satoshi', sans-serif;
```

### 3. Instrument Serif + Inter
**Vibe:** Quiet luxury, restrained elegance
**Best for:** Portfolio, agency, fashion, high-end services
**Why it works:** Instrument Serif is delicate and refined. Inter as body disappears (which is the point: the serif does the talking).
```html
<link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
```

### 4. Cabinet Grotesk + General Sans
**Vibe:** Studio clean, design-forward
**Best for:** Creative agency, design studio, architecture, art
Note: Both from fontshare.com (free).
```css
--font-display: 'Cabinet Grotesk', sans-serif;
--font-body: 'General Sans', sans-serif;
```

### 5. Syne + Geist
**Vibe:** Experimental, techy, future-forward
**Best for:** Web3, crypto, experimental tech, AI products
**Why it works:** Syne has 5 variable axes and an expanding character. Geist (Vercel's font) is technical precision.
```html
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400..800&display=swap" rel="stylesheet">
```
Note: Geist must be self-hosted from vercel.com/font or use `next/font/local`.

### 6. DM Serif Display + DM Sans
**Vibe:** Classic editorial, newspaper-grade
**Best for:** News, publishing, blogs, content platforms, media
```html
<link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,600;1,9..40,400&display=swap" rel="stylesheet">
```

### 7. Playfair Display + Source Sans 3
**Vibe:** High contrast, authoritative, traditional luxury
**Best for:** Legal, finance, luxury brands, wine, real estate
```html
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Source+Sans+3:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

### 8. Space Grotesk (self-paired)
**Vibe:** Geometric, monospace-adjacent, technical
**Best for:** Dev tools, dashboards, data-heavy apps, terminals
**Note:** Space Grotesk is flagged in SKILL.md Tell #3 as overused. It is ONLY allowed at Level 4-5 for developer/technical audience. Do not use for consumer or enterprise sites.
```html
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

### 9. Bricolage Grotesque + Figtree
**Vibe:** Friendly, bold, approachable energy
**Best for:** Consumer apps, community platforms, social, education
```html
<link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,400;12..96,500;12..96,600;12..96,700;12..96,800&family=Figtree:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

### 10. Cormorant + Urbanist
**Vibe:** Luxury meets modern, high sophistication
**Best for:** Hospitality, real estate, wine, premium e-commerce
```html
<link href="https://fonts.googleapis.com/css2?family=Cormorant:ital,wght@0,300..700;1,300..700&family=Urbanist:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

### Typography rendering rule (APPLY TO EVERY SITE):
```css
html {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
}
```
This makes fonts render crisper on macOS. One line, instant premium feel. Non-negotiable.

---

## SECTION B: OKLCH COLOR SYSTEM

AI defaults to blue-purple (hue 200-280). This system generates an entire palette from ONE hue value outside that death zone.

### Banned and safe hue zones:
```
BANNED: 200-280 (blue → purple → violet), where 90% of AI output lands
EXCEPTION: blue hue (200-240) is allowed ONLY if paired with a warm accent (hue 15-80)

SAFE HUES:
  15-40    Terracotta / Coral / Warm rose
  45-80    Gold / Amber / Saffron
  85-120   Lime / Chartreuse / Acid green
  130-170  Forest / Emerald / Teal
  175-195  Deep cyan / Petrol
  285-340  Magenta / Fuchsia / Hot pink
  345-360  Crimson / Cherry / Deep red
```

### Light mode palette generator:
```css
:root {
  --hue: 145; /* ← CHANGE THIS ONE VALUE. Everything else derives from it. */
  
  /* Surfaces */
  --bg-page: oklch(0.97 0.01 var(--hue));
  --bg-card: oklch(1.0 0 var(--hue));          /* pure white cards */
  --bg-elevated: oklch(0.95 0.01 var(--hue));
  
  /* Borders */
  --border: oklch(0.85 0.01 var(--hue) / 0.5);
  --border-subtle: oklch(0.90 0.005 var(--hue) / 0.4);
  
  /* Text */
  --text-primary: oklch(0.15 0.02 var(--hue));
  --text-secondary: oklch(0.40 0.01 var(--hue));
  --text-tertiary: oklch(0.55 0.01 var(--hue));
  
  /* Accent: peak chroma at mid-lightness */
  --accent: oklch(0.55 0.18 var(--hue));
  --accent-hover: oklch(0.48 0.20 var(--hue));
  --accent-subtle: oklch(0.55 0.18 var(--hue) / 0.1);
  
  /* Complementary accent for contrast (opposite hue) */
  --accent-complement: oklch(0.55 0.12 calc(var(--hue) + 180));
}
```

### Dark mode palette generator:
```css
[data-theme="dark"] {
  --bg-page: oklch(0.13 0.02 var(--hue));
  --bg-card: oklch(0.17 0.015 var(--hue));
  --bg-elevated: oklch(0.21 0.01 var(--hue));
  
  --border: oklch(0.25 0.01 var(--hue) / 0.5);
  --border-subtle: oklch(0.22 0.008 var(--hue) / 0.4);
  
  --text-primary: oklch(0.93 0.01 var(--hue));
  --text-secondary: oklch(0.65 0.01 var(--hue));
  --text-tertiary: oklch(0.50 0.01 var(--hue));
  
  --accent: oklch(0.65 0.20 var(--hue));
  --accent-hover: oklch(0.72 0.22 var(--hue));
  --accent-subtle: oklch(0.65 0.20 var(--hue) / 0.15);
  
  /* Glow for hover states: accent color at low opacity */
  --glow: oklch(0.65 0.20 var(--hue) / 0.25);
}
```

### Dark mode specific rules:
- NEVER use `#000000`. Tinted darks only (using the hue value).
- Elevation = lighter surface color, NOT shadows. Shadows don't work on dark backgrounds.
- Text is off-white, never `#ffffff`. Pure white on dark is harsh.
- Decrease font weight slightly (350 instead of 400). White-on-dark text appears optically bolder.
- Set `color-scheme: dark` on `<html>` to style native scrollbars and form controls.
- Accent elements get subtle glow via `box-shadow: 0 0 20px var(--glow)`.

---

## SECTION C: LAYERED SHADOW SYSTEM

Single `box-shadow` = AI tell. Layered shadows simulate real light and create depth that feels physical.

### The standard layered shadow (use for cards, panels):
```css
--shadow-sm:
  0 1px 1px rgba(0,0,0,0.04),
  0 2px 2px rgba(0,0,0,0.04),
  0 4px 4px rgba(0,0,0,0.04);

--shadow-md:
  0 1px 1px rgba(0,0,0,0.035),
  0 2px 2px rgba(0,0,0,0.035),
  0 4px 4px rgba(0,0,0,0.035),
  0 8px 8px rgba(0,0,0,0.035),
  0 16px 16px rgba(0,0,0,0.035);

--shadow-lg:
  0 1px 1px rgba(0,0,0,0.03),
  0 2px 2px rgba(0,0,0,0.03),
  0 4px 4px rgba(0,0,0,0.03),
  0 8px 8px rgba(0,0,0,0.03),
  0 16px 16px rgba(0,0,0,0.03),
  0 32px 32px rgba(0,0,0,0.03);
```

### Color-matched shadows (premium):
Instead of gray shadows, tint them to match the element's color:
```css
/* A blue card should cast a blue-ish shadow, not gray */
.card-accent {
  box-shadow:
    0 2px 4px oklch(0.55 0.18 var(--hue) / 0.1),
    0 4px 8px oklch(0.55 0.18 var(--hue) / 0.08),
    0 8px 16px oklch(0.55 0.18 var(--hue) / 0.06);
}
```

### Shadow rules:
- Light direction is top-left for ALL shadows on the page. Never mix directions.
- Hover state: increase shadow spread by adding another layer, don't just increase blur.
- Cards transition from `--shadow-sm` to `--shadow-md` on hover with `transition: box-shadow 200ms ease-out`.
- Dark mode: replace shadows with border glow (see Section G).

---

## SECTION D: SPRING EASING AND ANIMATION SYSTEM

Browser default easings (`ease`, `ease-in-out`) feel robotic. Spring physics feel natural.

### Three spring presets (from Emil Kowalski's design engineering work):
```css
:root {
  --spring-bounce: cubic-bezier(0.34, 1.56, 0.64, 1);   /* playful overshoot */
  --spring-smooth: cubic-bezier(0.22, 1, 0.36, 1);      /* standard spring */
  --spring-snappy: cubic-bezier(0.16, 1, 0.3, 1);       /* quick + precise */
}
```

### When to use which:
- `--spring-bounce` → Notifications, success states, playful UI (Level 5 only)
- `--spring-smooth` → Page transitions, card entrances, modal opens
- `--spring-snappy` → Dropdowns, tooltips, hover states, responsive UI

### Animation rules:
1. **Entrance = always ease-out** (element decelerates into place, feels natural)
2. **Exit = ease-in** (element accelerates away)
3. **Hover response: instant on, 150ms off.** Never delay hover feedback.
4. **Standard entrance pattern:** `opacity: 0, translateY(8px)` → `opacity: 1, translateY(0)` at 200-300ms
5. **Stagger children at 40ms increments.** Max total stagger duration: 400ms.
6. **Never animate from `scale(0)`.** Minimum starting scale is `0.95`. `scale(0)` looks like the element is spawning from nothing.
7. **Set `transform-origin` to match the trigger location.** Dropdown from a button? Origin is the button's position, not the dropdown's center.
8. **Skip entrance animations for high-frequency interactions.** Command palettes, autocomplete, tooltips after the first one should appear instantly.
9. **Duration guide:** Micro (hover, toggle) = 80-150ms. Standard (dropdown, panel) = 200-300ms. Large (modal, page) = 300-500ms. Hero (landing page reveal) = 500-800ms max.

### Staggered reveal pattern (CSS-only):
```css
.stagger-item {
  opacity: 0;
  transform: translateY(8px);
  animation: stagger-in 300ms var(--spring-smooth) forwards;
}
.stagger-item:nth-child(1) { animation-delay: 0ms; }
.stagger-item:nth-child(2) { animation-delay: 40ms; }
.stagger-item:nth-child(3) { animation-delay: 80ms; }
.stagger-item:nth-child(4) { animation-delay: 120ms; }
.stagger-item:nth-child(5) { animation-delay: 160ms; }
/* Max 10 items or 400ms total delay */

@keyframes stagger-in {
  to { opacity: 1; transform: translateY(0); }
}
```

---

## SECTION E: NOISE AND GRAIN TEXTURE

Adds organic warmth, prevents gradient banding, creates depth. One pseudo-element turns flat backgrounds into tactile surfaces.

### The noise overlay (copy-paste ready):
```css
.with-noise::before {
  content: '';
  position: absolute;
  inset: 0;
  background: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.65' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
  mix-blend-mode: soft-light;
  opacity: 0.08;
  pointer-events: none;
  z-index: 1;
}
.with-noise { position: relative; }
.with-noise > * { position: relative; z-index: 2; }
```

### Parameters:
- `baseFrequency`: 0.5-0.8 for subtle grain. Below 0.5 = cloudy blobs. Above 0.8 = TV static.
- `numOctaves`: 2-4. Higher = more detail but more render cost.
- `opacity`: **0.05-0.12** for light mode, **0.03-0.08** for dark mode. Above 0.15 looks dirty.
- `mix-blend-mode`: `soft-light` for smooth results. `overlay` for grittier texture.

### When to use:
- Hero section backgrounds (especially over gradients)
- Dark mode page backgrounds (prevents flat-screen feeling)
- Behind glassmorphism elements (gives the blur something to work with)
- Large solid color sections that feel too flat

### When NOT to use:
- Over text-heavy content (reduces readability)
- On small elements (invisible at small scale)
- On images (they already have natural texture)

---

## SECTION F: GLASSMORPHISM (DONE RIGHT)

AI does glassmorphism wrong 90% of the time: semi-transparent boxes on flat backgrounds that look like frosted placeholder cards. Premium glassmorphism requires rich content BEHIND the glass.

### The recipe:
```css
.glass {
  background: rgba(255, 255, 255, 0.08);    /* very subtle base */
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);       /* Safari */
  border: 1px solid rgba(255, 255, 255, 0.12);
  border-radius: 12px;
  box-shadow: 
    0 4px 16px rgba(0, 0, 0, 0.08),
    inset 0 1px 0 rgba(255, 255, 255, 0.1); /* top highlight */
}
```

### Light mode variant:
```css
.glass-light {
  background: rgba(255, 255, 255, 0.65);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 255, 255, 0.5);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.06);
}
```

### Rules:
- **Blur sweet spot: 8-15px.** Below 5px = too transparent. Above 20px = too opaque.
- **Maximum 2-3 glass elements per viewport.** Performance drops fast.
- **Glass ONLY works over visually rich backgrounds.** A gradient, an image, a pattern, animated content. Glass over a flat color = semi-transparent card = AI slop.
- **Add `@supports (backdrop-filter: blur())` fallback:** solid semi-transparent background for Firefox versions that don't support it.
- **USE for:** Floating navbars, modals over content, notification toasts, sidebar over map/visual content.
- **DON'T USE for:** Regular cards on flat pages, text-heavy panels, entire page layouts.

---

## SECTION G: BORDER GLOW SYSTEM (DARK MODE)

This single technique is responsible for ~50% of the "premium dark mode" feeling on Linear, Raycast, and Vercel.

### Gradient border (the card appears to emit light):
```css
.glow-card {
  border: 1px solid transparent;
  background: 
    linear-gradient(var(--bg-card), var(--bg-card)) padding-box,
    linear-gradient(135deg, 
      oklch(0.65 0.15 var(--hue) / 0.3), 
      transparent 50%
    ) border-box;
  border-radius: 12px;
  transition: all 200ms var(--spring-snappy);
}

/* Hover: border glows brighter */
.glow-card:hover {
  background: 
    linear-gradient(var(--bg-card), var(--bg-card)) padding-box,
    linear-gradient(135deg, 
      oklch(0.65 0.15 var(--hue) / 0.5), 
      transparent 60%
    ) border-box;
  box-shadow: 0 0 20px oklch(0.65 0.15 var(--hue) / 0.15);
}
```

### Focus ring (for inputs, buttons):
```css
.glow-focus:focus-visible {
  outline: none;
  box-shadow: 
    0 0 0 2px var(--bg-card),
    0 0 0 4px var(--accent),
    0 0 16px oklch(0.65 0.15 var(--hue) / 0.2);
}
```

### When to use:
- Dark mode cards and panels (replaces shadows which don't work on dark backgrounds)
- Featured/highlighted cards (the "recommended" plan on a pricing page)
- Interactive elements on dark backgrounds
- Hero section floating elements

---

## SECTION H: MICRO-INTERACTION RECIPES

These are the tiny details that compound into "feels premium." Each is 2-5 lines of CSS.

### Button press:
```css
.btn {
  transition: all 120ms var(--spring-snappy);
}
.btn:active {
  transform: scale(0.97);
  box-shadow: var(--shadow-sm); /* reduced from --shadow-md */
}
```

### Input focus glow:
```css
.input {
  border: 1px solid var(--border);
  transition: all 150ms ease-out;
}
.input:focus {
  border-color: var(--accent);
  box-shadow: 0 0 0 3px var(--accent-subtle);
  outline: none;
}
```

### Card hover lift:
```css
.card {
  transition: all 200ms var(--spring-smooth);
}
.card:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
}
```

### Link underline slide-in:
```css
.link {
  position: relative;
  text-decoration: none;
}
.link::after {
  content: '';
  position: absolute;
  bottom: -1px;
  left: 0;
  width: 100%;
  height: 1px;
  background: currentColor;
  transform: scaleX(0);
  transform-origin: left;
  transition: transform 200ms var(--spring-smooth);
}
.link:hover::after {
  transform: scaleX(1);
}
```

### Toggle switch with spring:
```css
.toggle-knob {
  transition: transform 250ms var(--spring-bounce);
}
.toggle[data-state="checked"] .toggle-knob {
  transform: translateX(20px);
}
```

### Tab indicator slide:
```css
.tab-indicator {
  transition: all 250ms var(--spring-smooth);
  /* Position/width set dynamically via JS to match active tab */
}
```

---

## SECTION I: HERO MOMENT RECIPES

Every Level 4-5 site needs ONE memorable visual moment. Claude picks the most appropriate one based on site context. Don't use more than one per site.

### 1. Animated gradient background (Stripe-style):
```css
.gradient-bg {
  background: linear-gradient(
    -45deg,
    oklch(0.55 0.18 var(--hue)),
    oklch(0.60 0.15 calc(var(--hue) + 40)),
    oklch(0.50 0.20 calc(var(--hue) + 80)),
    oklch(0.58 0.16 calc(var(--hue) - 30))
  );
  background-size: 400% 400%;
  animation: gradient-shift 12s ease infinite;
}
@keyframes gradient-shift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}
```

### 2. Text reveal with clip-path:
```css
.reveal-text {
  clip-path: inset(0 100% 0 0);
  animation: text-reveal 800ms var(--spring-smooth) forwards;
}
@keyframes text-reveal {
  to { clip-path: inset(0 0 0 0); }
}
/* Stagger words: .word:nth-child(2) { animation-delay: 100ms } etc. */
```

### 3. Gradient text fill:
```css
.gradient-text {
  background: linear-gradient(135deg, var(--accent), var(--accent-complement));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
```

### 4. Floating elements with subtle oscillation:
```css
.float {
  animation: float 6s ease-in-out infinite;
}
.float:nth-child(2) { animation-delay: -2s; }
.float:nth-child(3) { animation-delay: -4s; }

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-12px); }
}
```

### 5. Parallax depth (CSS-only, 3 layers):
```css
.parallax-container {
  height: 100vh;
  overflow-y: auto;
  perspective: 1px;
}
.layer-back {
  transform: translateZ(-2px) scale(3);
  z-index: 1;
}
.layer-mid {
  transform: translateZ(-1px) scale(2);
  z-index: 2;
}
.layer-front {
  transform: translateZ(0);
  z-index: 3;
}
```

### 6. Interactive dot grid background:
```css
.dot-grid {
  background-image: radial-gradient(circle, var(--border) 1px, transparent 1px);
  background-size: 24px 24px;
}
/* Combine with a radial gradient mask for spotlight effect: */
.dot-grid-spotlight {
  background-image: radial-gradient(circle, var(--border) 1px, transparent 1px);
  background-size: 24px 24px;
  mask-image: radial-gradient(ellipse 50% 50% at 50% 50%, black, transparent);
}
```

### 7. Headline that crosses the product image (situational):

Not mandatory. Use when the hero has a real product photo AND the composition supports it. Depends on product, aspect ratio, and the feel you want. When it IS the right call, aim for intentional ~50% overlap: zero touch reads as generic templating, 100% cover reads as a mistake, the middle is where taste lives. Editorial sites (B&O, Dior, Loewe) compose the whole hero as one canvas. Side-by-side flex columns with a gap is the Bootstrap default every AI site falls into and reads as "content column + image column" instead of one designed image.

**Add `white-space: nowrap` on the display headline FIRST, before tuning anything else.** It is a failsafe, not an afterthought. A display headline must never wrap mid-phrase during iteration ("between / notes." is unforgivable). Add the failsafe, then tune letter-spacing, font-size, and margins with the safety net in place.

```css
.hero {
  position: relative;
  min-height: 90vh;
}
.hero__headline {
  /* Escape the content column so the last line can reach the product */
  width: max-content;
  max-width: none;
  white-space: nowrap;                 /* failsafe FIRST */
  font-size: clamp(3.25rem, 9.4vw, 10rem);
  line-height: 0.95;
  position: relative;
  z-index: 2;                          /* sit above the product */
}
.hero__product {
  position: absolute;
  right: -6%;                          /* bleed off right edge */
  bottom: 0;
  width: 58%;
  z-index: 1;
}
```

**Do NOT:**
- Cap the headline with a content-column `max-width` (e.g. `820px`). That traps it inside its column and kills the overlap.
- Shrink `font-size` to fix a wrap issue. Smaller type stops reaching far enough to touch the product, and the overlap dies. Use the `nowrap` failsafe or rewrite the line instead.
- Stack headline and product in two flex columns with a `gap`. That valley is dead space and reads as templated.
- Trust static/PIL font metrics to predict overlap. Variable-font browser rendering differs from what any offline library computes. Measure with `getBoundingClientRect` in-browser and iterate visually. Art direction is iterative by nature.

**The rule when overlap is the right call:** headline and product share the same pixels, with ~50% intentional intersection. Never a visible gutter between them.

### Background performance note (pairs with Tell #33):

When you delete a `filter: blur(100px)` blob background per Tell #33, reach for inline SVG with path `d` updates in `requestAnimationFrame` instead. SVG path morphing is WAY cheaper on the GPU than CSS `filter: blur()`, which forces a full-layer repaint every frame. A 40-point polyline animated in rAF runs smoothly on low-end laptops where a blurred gradient chokes. Bonus: SVG can carry product meaning (contour lines for audio, waveforms for music, orbit lines for astronomy, isobars for weather) that a blurred blob never can.

---

## SECTION J: SVG DECORATION PATTERNS

Claude can generate inline SVGs. Use them for visual interest without external images.

### Blob shape (organic, non-geometric):
```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg" style="position:absolute;opacity:0.1;pointer-events:none;">
  <path fill="var(--accent)" d="M45.3,-62.5C57.9,-53.4,66.8,-38.6,71.2,-22.6C75.7,-6.5,75.8,10.8,69.6,25.5C63.4,40.2,50.8,52.3,36.7,60.1C22.6,67.9,7,71.4,-9.4,70.6C-25.9,69.8,-43.1,64.7,-55.2,53.8C-67.3,42.9,-74.2,26.2,-75.5,9.1C-76.8,-7.9,-72.4,-25.2,-62.4,-37.5C-52.4,-49.8,-36.8,-57.1,-21.6,-64.8C-6.4,-72.5,8.4,-80.6,22.5,-78.2C36.7,-75.8,50.2,-62.8,45.3,-62.5Z" transform="translate(100 100)" />
</svg>
```

### Geometric grid pattern (section background):
```css
.geo-grid {
  background-image: 
    linear-gradient(var(--border-subtle) 1px, transparent 1px),
    linear-gradient(90deg, var(--border-subtle) 1px, transparent 1px);
  background-size: 40px 40px;
}
```

### Abstract line divider between sections:
```html
<svg width="100%" height="2" style="display:block;">
  <line x1="0" y1="1" x2="100%" y2="1" stroke="url(#fade)" stroke-width="1"/>
  <defs>
    <linearGradient id="fade" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="var(--border)" stop-opacity="0"/>
      <stop offset="50%" stop-color="var(--border)" stop-opacity="1"/>
      <stop offset="100%" stop-color="var(--border)" stop-opacity="0"/>
    </linearGradient>
  </defs>
</svg>
```

---

## SECTION K: CURSOR ENHANCEMENT (Level 5 ONLY)

Cursor effects ADD to a complete design. The page MUST look finished without any cursor movement. Test by not moving your mouse for 10 seconds. If the page feels empty, the design is broken.

### Spotlight/flashlight effect:
```css
.cursor-spotlight {
  cursor: none; /* hide default cursor */
  position: relative;
}
/* Restore cursor on interactive elements */
.cursor-spotlight a,
.cursor-spotlight button,
.cursor-spotlight input,
.cursor-spotlight [role="button"] {
  cursor: pointer;
}

.cursor-glow {
  position: fixed;
  width: 300px;
  height: 300px;
  border-radius: 50%;
  background: radial-gradient(circle, var(--accent-subtle), transparent 70%);
  pointer-events: none;
  transform: translate(-50%, -50%);
  z-index: 0;
  transition: opacity 300ms ease;
}
```
```javascript
// JS to follow cursor
const glow = document.querySelector('.cursor-glow');
document.addEventListener('mousemove', (e) => {
  glow.style.left = e.clientX + 'px';
  glow.style.top = e.clientY + 'px';
});
```

### RULES:
- **Disable at ≤ 960px breakpoint.** No cursor effects on tablets/mobile.
- **Use `@media (pointer: coarse)` to detect touch devices** and disable.
- **The background underneath must be visually complete:** gradient, noise texture, pattern, or solid color. The cursor glow is ENHANCEMENT, not the background itself.
- **Opacity of glow: 0.05-0.15.** Above 0.2 is distracting.
- **Restore `cursor: pointer` on all interactive elements** so users know what's clickable.

### STATE TRANSITION RULE (applies to ALL rAF loops, not just cursor effects):

In any `requestAnimationFrame` loop, NEVER boolean-toggle a value that affects visual output. If a state change happens in a single frame and it is visible, it will read as a glitch. Every state transition must be interpolated toward a target, not assigned directly. This same rule also kills cursor-effect discontinuities: any hard sign-flip (`y < cy ? -bump : bump`) at a specific coordinate creates a visible seam right where the user is looking. Replace sign flips with smooth directional falloff (see "smooth parting" below).

**The principle:** target values are discrete, current values are continuous, and the render loop ONLY reads current values. Boolean flags (`isActive`, `isHovered`) and event listeners write to `target*` variables only. They never directly affect output.

```js
// BAD: boolean toggle causes a one-frame snap on pointerleave.
let cursorActive = false;
hero.addEventListener('pointerleave', () => { cursorActive = false; });

const frame = (t) => {
  const k = cursorActive ? 0.22 : 0;   // snaps 0.22 -> 0 in one frame
  // ...push calculation uses k...
};

// GOOD: target/current split, smooth fade on pointerleave.
const K_ACTIVE = 0.22;
let currentK = 0, targetK = 0;
hero.addEventListener('pointerleave', () => { targetK = 0; });
hero.addEventListener('pointermove',  () => { targetK = K_ACTIVE; });

const frame = (t) => {
  currentK += (targetK - currentK) * 0.06;   // ~20 frames to settle
  const k = currentK;
  // ...push calculation uses smoothed k...
};
```

**Smooth parting (no sign-flip discontinuity):** when a cursor "pushes" elements away (contour lines, particles, grid points), never use `y < cy ? -bump : bump`. The direction snaps at the cursor line and reads as a glitch. Use `ddy * falloff * k` instead. The signed distance from the cursor (`ddy`) carries the direction naturally, falloff is exactly 0 at the cursor, and the push grows smoothly with distance. No seam.

```js
// BAD: hard sign flip at y = cy creates a visible horizontal seam.
const bump = strength * Math.exp(-(ddx * ddx) / (2 * sigmaX * sigmaX)
                                 -(ddy * ddy) / (2 * sigmaY * sigmaY));
y += (y < cy ? -bump : bump);

// GOOD: signed falloff, zero at cursor, grows smoothly outward.
const falloff = Math.exp(-(ddx * ddx) / (2 * sigmaX * sigmaX)
                         -(ddy * ddy) / (2 * sigmaY * sigmaY));
y += ddy * falloff * k;
```

**Checklist for every interactive rAF animation:**
1. What values does the render loop read each frame? (positions, strengths, colors, opacities, rotations.)
2. For each one, is it assigned directly anywhere, or always lerped toward a target?
3. If assigned directly, can that assignment happen mid-interaction? If yes, it is a snap waiting to happen. Convert to `current += (target - current) * rate`.
4. Event listeners write to `target*` variables only. Never to `current*` variables.
5. Every boolean that gates rendering (`isActive`, `isHovered`, `isVisible`) gets a corresponding interpolated scalar (`activeAmount`, `hoveredAmount`, `visibleAmount`) that the render loop actually reads.

**The meta-rule:** if a human can perceive a single frame of your animation, that frame is a bug. 60fps means each frame is ~16ms. Anything that completes in one frame is imperceptible in the middle of motion but catastrophic at the edges. That is exactly where you will see a snap.

---

## SECTION L: SCROLL-TRIGGERED ANIMATIONS

### CSS-only (Chrome 116+, no JS):
```css
.scroll-reveal {
  opacity: 0;
  transform: translateY(30px);
  animation: scroll-in linear both;
  animation-timeline: view();
  animation-range: entry 0% entry 100%;
}
@keyframes scroll-in {
  to { 
    opacity: 1; 
    transform: translateY(0); 
  }
}
```

### Cross-browser fallback (IntersectionObserver):
```javascript
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.15 });

document.querySelectorAll('.scroll-reveal').forEach(el => observer.observe(el));
```
```css
.scroll-reveal {
  opacity: 0;
  transform: translateY(30px);
  transition: all 500ms var(--spring-smooth);
}
.scroll-reveal.visible {
  opacity: 1;
  transform: translateY(0);
}
/* Stagger siblings */
.scroll-reveal.visible:nth-child(2) { transition-delay: 80ms; }
.scroll-reveal.visible:nth-child(3) { transition-delay: 160ms; }
```

### Rules:
- Use CSS-only for Chrome users (90%+ of dev audience). Include the JS fallback for Safari/Firefox.
- `animation-range: entry 0% entry 100%` means animation plays as element enters viewport from bottom.
- Only reveal elements ONCE. Don't re-hide on scroll-up (remove IntersectionObserver after first trigger).
- Keep scroll animations SUBTLE. `translateY(30px)` max. No `translateX`, no `rotate`, no `scale` on scroll. It feels like PowerPoint.

---

## CONCEPTUAL BACKGROUND BANK

Every Level 4-5 hero background must pass the Conceptual Grounding Test: "this exists because [product reason]." The problem: if this skill gives ONE example (contour lines for audio), Claude will reuse that same example every single time. The bank below provides 6-8 pre-validated conceptual mappings per product category so Claude picks a DIFFERENT one each build.

### Product Category Mappings

**Audio/Headphones:** contour topography (frequency response curves), cymatics patterns (sound made visible in sand/water), waveform spectrograms, vinyl groove macro texture, acoustic room reflection rays, standing wave interference patterns, speaker cone cross-section rings, studio mixing board fader lines

**Finance/Fintech:** candlestick abstraction (price movement), ledger grid patterns (structured data), vault door radial lines (security), currency watermark micro-patterns, ticker tape streams, bond yield curves as landscape, balance sheet tree diagrams

**Developer Tools:** AST node trees (code structure), diff heatmaps (change visualization), terminal scanline patterns, dependency graph constellations, git branch timelines, stack frame layers, syntax token color bands

**Health/Wellness:** cellular structure patterns (biology), heartbeat rhythm lines, molecular bond networks, dermatome body maps, circadian wave cycles, anatomical cross-section layers

**E-commerce/Retail:** packaging unbox sequences (product reveal), fabric weave textures, supply chain route maps, barcode/QR abstract grids, shelf planogram layouts, material swatch gradients

**Climate/Energy:** isobar weather maps, solar panel cell grids, wind flow streamlines, geological strata layers, tidal pattern curves, carbon cycle loop diagrams

### Concept Seed Generator

```python
# Run this at the start of any Level 4-5 build.
import random

CONCEPT_BANK = {
    "audio_headphones": [
        "contour topography (frequency curves)",
        "cymatics patterns (sound in sand/water)",
        "waveform spectrograms",
        "vinyl groove macro texture",
        "acoustic room reflection rays",
        "standing wave interference patterns",
        "speaker cone cross-section rings",
        "studio mixing board fader lines",
    ],
    "finance_fintech": [
        "candlestick abstraction (price movement)",
        "ledger grid patterns (structured data)",
        "vault door radial lines (security)",
        "currency watermark micro-patterns",
        "ticker tape streams",
        "bond yield curves as landscape",
        "balance sheet tree diagrams",
    ],
    "developer_tools": [
        "AST node trees (code structure)",
        "diff heatmaps (change visualization)",
        "terminal scanline patterns",
        "dependency graph constellations",
        "git branch timelines",
        "stack frame layers",
        "syntax token color bands",
    ],
    "health_wellness": [
        "cellular structure patterns (biology)",
        "heartbeat rhythm lines",
        "molecular bond networks",
        "dermatome body maps",
        "circadian wave cycles",
        "anatomical cross-section layers",
    ],
    "ecommerce_retail": [
        "packaging unbox sequences (product reveal)",
        "fabric weave textures",
        "supply chain route maps",
        "barcode/QR abstract grids",
        "shelf planogram layouts",
        "material swatch gradients",
    ],
    "climate_energy": [
        "isobar weather maps",
        "solar panel cell grids",
        "wind flow streamlines",
        "geological strata layers",
        "tidal pattern curves",
        "carbon cycle loop diagrams",
    ],
}

# Hue range: 0-360, but skip the 200-280 banned zone (the AI-purple trap).
SAFE_HUES = list(range(0, 200)) + list(range(281, 361))

def generate_seed(category=None):
    if category is None:
        category = random.choice(list(CONCEPT_BANK.keys()))
    elif category not in CONCEPT_BANK:
        print(f"Unknown category '{category}'. Available: {list(CONCEPT_BANK.keys())}")
        return

    concept = random.choice(CONCEPT_BANK[category])
    hue = random.choice(SAFE_HUES)
    font_pairing_index = random.randint(1, 10)

    print(f"Category:      {category}")
    print(f"Concept:       {concept}")
    print(f"Base hue:      {hue} (OKLCH)")
    print(f"Font pairing:  #{font_pairing_index} (see Section A)")

generate_seed()  # Pass a category string to target a specific product type.
```

### Rules for Using the Bank

- All entries in the bank are pre-validated as argumentative. They pass the Conceptual Grounding Test by design: every mapping ties back to the product domain, not to decoration.
- Claude MUST pick a different concept than its last generation for the same product category. Repeating the same concept across consecutive builds defeats the purpose of the bank.
- If Claude genuinely cannot find a good fit from the bank for an unusual product, it may pause and ask the user which direction to take. This is not recommended for standard builds but is acceptable for edge cases where the product does not fit any listed category.
- The bank is a starting point, not a ceiling. Claude can invent NEW conceptual mappings as long as they pass the grounding test. If a new mapping is strong, it earns a place in the bank.

---

## ANTI-CONVERGENCE CHECKLIST (run after every Level 4-5 build)

Even with these patterns, Claude may converge on a new "premium default." Check:

- [ ] Did I use a different font pairing than my last generation?
- [ ] Is the hue outside 200-280? (Or blue paired with warm accent?)
- [ ] Are shadows layered (3+ layers), not single?
- [ ] Do animations use spring curves, not browser defaults?
- [ ] Is there noise/grain on at least one background section?
- [ ] Does the hero have ONE memorable moment (not three)?
- [ ] Do micro-interactions exist on buttons, inputs, and cards?
- [ ] Does the page look complete WITHOUT cursor movement?
- [ ] Is `-webkit-font-smoothing: antialiased` set?
- [ ] Does `prefers-reduced-motion` disable all animations?
- [ ] Is my hero background concept different from my last generation for this product category?
- [ ] Did I run the concept seed generator before starting?
