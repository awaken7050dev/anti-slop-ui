# MOBILE.md: Post-Desktop Adaptation Pass

**MANDATORY MODULE. Read AFTER completing the desktop build.**

This file turns a finished desktop site into a site that works on phones. Not "responsive" in the sense of "it doesn't break." Actually good on a 375px screen held in one hand. The desktop build comes first. This pass comes second. Every rule below assumes you already have a working desktop layout and are now adapting it for mobile.

Token cost: ~12KB. Load when: the SKILL.md checklist item "Mobile adaptation pass complete?" is checked. Skip when: building a component that will never render on mobile (admin-only desktop tools, print layouts).

---

## THE CORE PRINCIPLE

Mobile is not a degraded desktop. It is a different device with different physics: smaller viewport, touch instead of hover, one-handed use, variable network speed, battery constraints. A site that "works on mobile" but feels like a shrunken desktop is a failure. The mobile version should feel like it was designed for a phone first and happened to also work on desktop.

---

## SECTION A: FLUID TYPOGRAPHY

Desktop type scales do not work on mobile. A 72px hero headline that commands attention on a 1440px screen becomes a wall of text on a 375px screen. The fix is not "make it smaller." The fix is a fluid scale that adapts continuously.

### The Fluid Type Scale (clamp pattern)

```css
:root {
  /* Display / Hero */
  --text-display: clamp(2.5rem, 1.5rem + 4vw, 5rem);     /* 40px -> 80px */

  /* H1 */
  --text-h1: clamp(2rem, 1.25rem + 3vw, 3.5rem);          /* 32px -> 56px */

  /* H2 */
  --text-h2: clamp(1.5rem, 1rem + 2vw, 2.5rem);           /* 24px -> 40px */

  /* H3 */
  --text-h3: clamp(1.25rem, 1rem + 1vw, 1.75rem);         /* 20px -> 28px */

  /* Body - barely changes */
  --text-body: clamp(1rem, 0.95rem + 0.25vw, 1.125rem);   /* 16px -> 18px */

  /* Small / Caption */
  --text-small: clamp(0.8125rem, 0.78rem + 0.15vw, 0.875rem); /* 13px -> 14px */
}
```

### Letter-Spacing Scale

Letter-spacing tightens as type size increases. Display text needs negative tracking. Body text needs none.

```css
.text-display { letter-spacing: -0.04em; }
.text-h1      { letter-spacing: -0.03em; }
.text-h2      { letter-spacing: -0.02em; }
.text-h3      { letter-spacing: -0.01em; }
.text-body    { letter-spacing: 0; }
.text-small   { letter-spacing: 0.01em; }
```

### Rules

1. **Never use `vw` alone for font size.** `font-size: 5vw` makes text unreadable at 320px and oversized at 2560px. Always use `clamp(min, preferred, max)` with a rem base.
2. **Body text stays between 16px and 20px on all devices.** Below 16px, mobile browsers auto-zoom on input focus. Above 20px, line lengths get too short on phones.
3. **Enable optical sizing.** Add `font-optical-sizing: auto` on the html element. Fonts with optical sizing axes (most variable fonts) will automatically adjust stroke weight and spacing at different sizes.
4. **`text-wrap: balance` on all headings.** Prevents orphan words (a single word on its own line). Supported in all modern browsers.
5. **Line height decreases as size increases.** Display: 1.1. H1: 1.15. H2: 1.2. H3: 1.3. Body: 1.5-1.6. Tight line height on large text is intentional and correct. Tight line height on body text is unreadable.

---

## SECTION B: FLUID SPACING

Spacing needs to scale fluidly between breakpoints. Fixed padding that looks balanced on desktop creates enormous gutters on mobile, pushing content below the fold.

### The Fluid Space Scale (one-up pairs)

Each step maps to the space between it and the next step up. This creates natural rhythm across breakpoints.

```css
:root {
  --space-3xs: clamp(0.25rem, 0.2rem + 0.15vw, 0.3125rem);   /* 4px -> 5px */
  --space-2xs: clamp(0.5rem, 0.4rem + 0.25vw, 0.625rem);     /* 8px -> 10px */
  --space-xs:  clamp(0.75rem, 0.6rem + 0.5vw, 1rem);         /* 12px -> 16px */
  --space-s:   clamp(1rem, 0.8rem + 0.75vw, 1.5rem);         /* 16px -> 24px */
  --space-m:   clamp(1.5rem, 1.2rem + 1.25vw, 2.25rem);      /* 24px -> 36px */
  --space-l:   clamp(2rem, 1.5rem + 2vw, 3rem);              /* 32px -> 48px */
  --space-xl:  clamp(3rem, 2rem + 3.5vw, 4.5rem);            /* 48px -> 72px */
  --space-2xl: clamp(4rem, 2.5rem + 5vw, 6rem);              /* 64px -> 96px */
}
```

### Rules

1. **Section padding uses `--space-xl` or `--space-2xl`.** These compress automatically on mobile.
2. **Component internal padding uses `--space-xs` to `--space-m`.** Cards, buttons, inputs.
3. **Never mix fluid and fixed spacing in the same layout.** If section gaps are fluid, card gaps must be fluid too. Mixing creates visual dissonance where some things adapt and others don't.
4. **Container max-width with fluid padding:**
```css
.container {
  width: 100%;
  max-width: 1200px;
  margin-inline: auto;
  padding-inline: var(--space-s); /* 16px on mobile, 24px on desktop */
}
```

---

## SECTION C: GRID ADAPTATION

### The Responsive Grid Pattern

One rule handles most layouts without media queries:

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(100%, 300px), 1fr));
  gap: var(--space-m);
}
```

`min(100%, 300px)` prevents items from overflowing on narrow screens. At 375px, items go full-width. At 768px, two columns. At 1200px+, three or four columns. No media queries needed.

### Breakpoint Guidance (when media queries ARE needed)

```
< 640px:   1 column. Full-width everything. Stack vertically.
640-1024:  2 columns. Side-by-side where it makes sense.
> 1024:    3+ columns. Full desktop layout.
```

### Rules

1. **DOM order = mobile reading order.** On mobile, elements stack in DOM order. If "Sign Up" needs to be above "Features" on mobile, it must come first in the HTML. Do not rely on CSS `order` to fix reading sequence on mobile.
2. **Asymmetric desktop layouts stack naturally.** A 60/40 split layout (content + sidebar) should stack to full-width content above full-width sidebar on mobile. Never leave a 40%-width sidebar on a phone screen.
3. **Feature grids collapse gracefully.** A 3-column feature grid (icon + title + description) on desktop should become a 1-column stack on mobile. The icon can sit inline with the title instead of above it to save vertical space.
4. **Tables become cards on mobile.** Data tables wider than 4 columns should transform into card-based layouts on mobile. Each row becomes a card with label-value pairs stacked vertically.

---

## SECTION D: TOUCH INTERACTION

### Touch Targets

Minimum sizes (non-negotiable):
- **Apple HIG:** 44x44pt (actual standard for iOS)
- **Material Design:** 48x48dp (Android)
- **WCAG 2.2 Level AAA:** 44x44 CSS px

The practical rule: every tappable element must be at least **44px** in both dimensions. This includes the padding, not just the visible element. A 16px text link is fine if its tap area (with padding) is 44px tall.

```css
.tap-target {
  min-height: 44px;
  min-width: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

### Hover Replacement

Desktop hover states do not exist on touch devices. Content that is only visible on hover is invisible on mobile.

**The gating pattern:**

```css
/* Mobile-first: active state for touch feedback */
.interactive:active {
  transform: scale(0.97);
  opacity: 0.8;
}

/* Desktop-only: hover enhancement */
@media (hover: hover) and (pointer: fine) {
  .interactive:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }
  .interactive:active {
    transform: translateY(0);
  }
}

/* Keyboard: always visible */
.interactive:focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 2px;
}
```

### Rules

1. **Never gate content behind hover.** If a card shows extra info on hover (a description, a link, action buttons), that content must be visible by default on mobile. Use `@media (hover: hover) and (pointer: fine)` to wrap hover-only behavior.
2. **Use `:active` for mobile tap feedback, not `:hover`.** On mobile, `:hover` is sticky (it stays after tapping). `:active` fires only during the press. A subtle `scale(0.97)` or `opacity(0.8)` on `:active` gives instant feedback.
3. **Always include `:focus-visible` for keyboard users.** Separate from hover and active. A visible outline (2px solid, offset 2px) on focus-visible. Never `outline: none` without a replacement.
4. **Cursor effects must degrade to nothing.** If the desktop has a custom cursor, glowing orb, or parallax on mouse position, mobile gets none of it. The page must look complete without any cursor interaction (Tell #26 in SKILL.md).

---

## SECTION E: NAVIGATION

### Mobile Nav Patterns (by item count)

**3-5 items: Bottom tab bar.** Always visible, thumb-friendly, no hidden navigation. Each tab is an icon + label. Active state uses color or a subtle indicator.

```css
.bottom-tabs {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: space-around;
  align-items: center;
  height: 56px;
  padding-bottom: env(safe-area-inset-bottom);
  background: var(--surface);
  border-top: 1px solid var(--border);
  z-index: 50;
}
```

**6+ items: Bottom sheet.** A drawer that slides up from the bottom, not a hamburger that slides from the side. Bottom sheets are more natural on mobile because the trigger is at the bottom of the screen (thumb reach).

**Avoid hamburger menus unless there are 10+ items.** Hamburger menus hide navigation. Users forget what's behind them. If you must use one, keep the most important 3-4 items visible and put the rest in the menu.

### Rules

1. **Bottom nav must account for safe areas.** Add `padding-bottom: env(safe-area-inset-bottom)` to prevent the nav from being hidden behind the home indicator on modern iPhones.
2. **Active tab state must be obvious.** Not just a color change on the icon. Use filled vs outlined icon, a background pill, or a top indicator bar.
3. **Never put the primary action inside a hidden menu.** If "Create New" or "Add to Cart" is the most important action, it gets a floating action button or a persistent bottom bar, not a menu item.

---

## SECTION F: SAFE AREAS

Modern phones have notches, dynamic islands, rounded corners, and home indicators that eat into the viewport. Ignoring safe areas means content gets clipped.

### Setup

Add to the HTML `<head>`:
```html
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
```

`viewport-fit=cover` tells the browser to extend the page into the safe area. Without it, `env(safe-area-inset-*)` returns 0.

### The Pattern

```css
.container {
  padding-left: max(16px, env(safe-area-inset-left));
  padding-right: max(16px, env(safe-area-inset-right));
}

.bottom-bar {
  padding-bottom: max(12px, env(safe-area-inset-bottom));
}
```

`max()` ensures you always have at least your design's minimum padding, even on devices without notches.

### Rules

1. **Full-width backgrounds are fine.** Safe area padding goes on the content, not the background. A hero image can bleed into the notch area. Text and buttons cannot.
2. **Bottom fixed elements always need safe area padding.** Bottom tabs, CTAs pinned to the bottom, cookie banners. All need `padding-bottom: max(Xpx, env(safe-area-inset-bottom))`.
3. **Landscape mode doubles the problem.** In landscape, `safe-area-inset-left` and `safe-area-inset-right` become significant on notched phones. Always use `max()` on both sides.

---

## SECTION G: HERO ADAPTATION

### Mobile Hero Layout

Desktop heroes with side-by-side text + image layouts must stack on mobile. The universal mobile pattern: **text above, image below.**

```css
.hero {
  display: flex;
  flex-direction: column;
  gap: var(--space-m);
}

@media (min-width: 768px) {
  .hero {
    flex-direction: row;
    align-items: center;
  }
}
```

### Rules

1. **Hero image goes below hero text on mobile.** Users need to see the headline and CTA before scrolling. The product image reinforces the message but doesn't replace it.
2. **Hero CTAs must be above the fold on mobile.** If the user has to scroll past a full-screen image to find the "Buy Now" button, the mobile layout is wrong. Text + CTA first, image second.
3. **Full-bleed hero images need art direction.** A wide landscape hero cropped to a phone screen loses the subject. Use the `<picture>` element with different crops for different breakpoints:
```html
<picture>
  <source media="(max-width: 640px)" srcset="hero-mobile.avif" type="image/avif">
  <source media="(max-width: 640px)" srcset="hero-mobile.webp" type="image/webp">
  <source srcset="hero-desktop.avif" type="image/avif">
  <source srcset="hero-desktop.webp" type="image/webp">
  <img src="hero-desktop.jpg" alt="..." loading="eager" fetchpriority="high">
</picture>
```
4. **Never lazy-load the hero image.** The hero is above the fold. Use `loading="eager"` (or omit the attribute, since eager is default) and `fetchpriority="high"`.
5. **Reduce hero whitespace on mobile.** Desktop hero sections often have 120-160px of vertical padding. On mobile, this pushes the content off-screen. Use fluid spacing: `padding-block: var(--space-xl)` which compresses to 48px on mobile.

---

## SECTION H: ANIMATION PERFORMANCE

Mobile devices have less GPU power, less RAM, and battery constraints. Animations that feel smooth on a MacBook Pro stutter on a mid-range Android.

### Mobile Animation Rules

1. **Shorter durations.** Desktop: 300-500ms. Mobile: 200-300ms. Mobile users are closer to the screen and more sensitive to delay.
2. **Tighter staggers.** Desktop stagger between items: 60-100ms. Mobile: 30-50ms. Long staggers on mobile feel sluggish.
3. **GPU-only properties.** Only animate `transform` and `opacity`. Never animate `width`, `height`, `top`, `left`, `margin`, `padding`, `border-radius`, `box-shadow`, or `background-color`. These trigger layout or paint and will stutter.
4. **`will-change` budget.** Maximum 3-5 elements with `will-change` on screen at once. Each `will-change` creates a new compositor layer that costs GPU memory. Too many = jank or crash on low-end devices.
5. **Respect reduced motion.** Not optional. This is an accessibility requirement.

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

### Hardware Detection (Level 4-5 only)

For sites with heavy animation (Level 4-5), detect device capability and reduce fidelity on low-end hardware:

```javascript
const isLowEnd = navigator.hardwareConcurrency <= 4
  || navigator.deviceMemory <= 4
  || window.matchMedia('(prefers-reduced-motion: reduce)').matches;

if (isLowEnd) {
  document.documentElement.classList.add('reduce-motion');
}
```

```css
.reduce-motion .animated-element {
  animation: none;
  transition-duration: 0.1s;
}
```

---

## SECTION I: GLASSMORPHISM AND SHADOWS ON MOBILE

### Glassmorphism (blur + transparency)

Desktop glassmorphism with `backdrop-filter: blur(20px)` is expensive on mobile GPUs. It causes visible stutter on scroll, especially in Safari.

**Safe blur range on mobile: 8-12px.** Above 12px, performance degrades noticeably on mid-range devices.

```css
.glass {
  background: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  transform: translate3d(0, 0, 0); /* Force GPU layer in Safari */
}
```

### Rules

1. **Maximum 3-5 glass elements visible on screen at once.** Each blurred element is a separate compositing layer.
2. **Always include `transform: translate3d(0, 0, 0)` on glass elements.** This forces Safari to use GPU compositing. Without it, Safari may fall back to CPU rendering and stutter.
3. **Provide a solid fallback.** If glass is too expensive, degrade to a solid semi-transparent background:
```css
@supports not (backdrop-filter: blur(10px)) {
  .glass {
    background: rgba(255, 255, 255, 0.92);
  }
}
```

### Shadows on Mobile

Desktop layered shadows (3-5 layers for realistic depth) are expensive on mobile. Simplify.

```css
/* Desktop: 5-layer realistic shadow */
@media (hover: hover) and (pointer: fine) {
  .card {
    box-shadow:
      0 0.5px 0.6px rgba(0,0,0,0.02),
      0 1.2px 1.4px rgba(0,0,0,0.03),
      0 2.3px 2.7px rgba(0,0,0,0.04),
      0 4.1px 4.8px rgba(0,0,0,0.05),
      0 8px 12px rgba(0,0,0,0.06);
  }
}

/* Mobile: 2-layer simplified shadow */
@media (hover: none) or (pointer: coarse) {
  .card {
    box-shadow:
      0 1px 3px rgba(0,0,0,0.08),
      0 4px 12px rgba(0,0,0,0.06);
  }
}
```

**Never animate `box-shadow` on mobile.** If a card needs to "lift" on press, animate `transform: translateY(-2px)` instead and keep the shadow static.

---

## SECTION J: RESPONSIVE IMAGES

### The Modern Image Stack

Always serve the smallest image the device actually needs. Mobile users on cellular networks should not download a 2400px hero image.

```html
<picture>
  <source
    srcset="image-400.avif 400w, image-800.avif 800w, image-1200.avif 1200w"
    sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
    type="image/avif">
  <source
    srcset="image-400.webp 400w, image-800.webp 800w, image-1200.webp 1200w"
    sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
    type="image/webp">
  <img
    src="image-800.jpg"
    alt="..."
    loading="lazy"
    decoding="async"
    width="800"
    height="600">
</picture>
```

### Rules

1. **Format priority: AVIF > WebP > JPEG.** AVIF is ~50% smaller than JPEG at similar quality. WebP is ~25-30% smaller. Use `<picture>` with `<source type="">` for automatic format selection.
2. **Always set `width` and `height` on `<img>`.** This lets the browser calculate aspect ratio before the image loads, preventing layout shift (CLS).
3. **`loading="lazy"` on everything below the fold.** `loading="eager"` (or omit) on above-the-fold images. `fetchpriority="high"` on the hero image.
4. **Use `sizes` attribute.** Without it, the browser assumes the image is 100vw and downloads the largest source. With `sizes`, it picks the right resolution.
5. **Art direction for mobile crops.** A landscape photo that works at 1200px becomes a sliver on a 375px phone. Use separate crops optimized for mobile aspect ratios through `<source media="(max-width: 640px)">`.

---

## SECTION K: VIEWPORT UNITS

### The Three Viewport Heights

```
svh = Small Viewport Height (browser chrome VISIBLE - address bar + bottom bar showing)
dvh = Dynamic Viewport Height (changes as browser chrome hides/shows)
lvh = Large Viewport Height (browser chrome HIDDEN - after scroll, bars retracted)
```

### Rules

1. **Use `svh` for hero sections.** `100svh` ensures the hero fits within the visible area even with the address bar showing. Content is never hidden behind the browser chrome.
2. **Use `dvh` only for overlays and modals.** Overlays need to fill the current visible area, which changes as the browser chrome hides.
3. **Never use `vh` on mobile.** `100vh` equals `100lvh` on iOS Safari, which means the bottom of your hero is hidden behind the address bar on first load. This is the iOS Safari address bar jiggle (Tell #18).
4. **Use `min-height`, not `height`.** `min-height: 100svh` lets content overflow if it's taller than the screen. `height: 100svh` clips it.

---

## SECTION L: SCROLL-SNAP CAROUSELS

For horizontal content (feature cards, testimonials, image galleries), use CSS scroll-snap instead of a JavaScript carousel library. Lighter, smoother, native momentum scrolling.

```css
.carousel {
  display: flex;
  gap: var(--space-s);
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none; /* Firefox */
  padding-inline: var(--space-s);
}

.carousel::-webkit-scrollbar {
  display: none;
}

.carousel-item {
  flex: 0 0 85%;
  scroll-snap-align: center;
}
```

### Rules

1. **85% width with center snap.** This creates a "peek" effect where the next card is partially visible, signaling horizontal scrollability.
2. **Hide the scrollbar.** Native scrollbars on touch carousels are ugly and redundant. The peek is the scrollability indicator.
3. **Add page indicators for short carousels (3-5 items).** Small dots below the carousel showing current position. Not needed for longer lists.
4. **Never force horizontal scroll on content that could stack.** Carousels are for homogeneous items (cards, images, testimonials). Feature descriptions, pricing tiers, and comparison content should stack vertically on mobile.

---

## SECTION M: LANDSCAPE AND FOLDABLE DEVICES

### Landscape Mode

Many mobile users rotate to landscape. If the layout breaks, it's a bug.

```css
@media (max-height: 500px) and (orientation: landscape) {
  .hero {
    min-height: auto;
    padding-block: var(--space-m);
  }

  .bottom-tabs {
    height: 44px;
  }

  .hero-image {
    max-height: 50vh;
  }
}
```

### Foldable Devices (emerging)

Samsung Galaxy Fold and similar devices have a "fold" in the middle of the screen. CSS can detect it:

```css
@media (horizontal-viewport-segments: 2) {
  .content {
    column-gap: env(viewport-segment-width 0 0);
  }
}
```

For now, the practical rule: test your layout at 280px wide (Galaxy Fold outer screen) and make sure nothing breaks. You do not need to optimize for foldables, but you cannot break on them.

---

## THE MOBILE ADAPTATION CHECKLIST

Run this after completing the desktop build and applying all adaptations above.

### Layout

- [ ] **Fluid type scale using `clamp()` on all text sizes?** (No fixed px that stays the same on mobile and desktop)
- [ ] **Fluid spacing scale using `clamp()` on all gaps, padding, margins?**
- [ ] **Grid collapses to 1 column below 640px?**
- [ ] **No horizontal overflow at 375px?** (Check every section. Scroll right = broken.)
- [ ] **DOM order matches mobile reading order?** (Don't rely on CSS `order` for mobile layout)
- [ ] **Tables transform to cards on mobile?** (Or horizontal scroll with sticky first column)

### Touch

- [ ] **All tap targets at least 44px?** (Buttons, links, inputs, checkboxes, toggles)
- [ ] **Hover content visible by default on mobile?** (Nothing hidden behind `:hover`)
- [ ] **`:active` feedback on all interactive elements?** (Subtle scale or opacity change on press)
- [ ] **`:focus-visible` outline on all interactive elements?** (Keyboard accessibility)
- [ ] **`@media (hover: hover) and (pointer: fine)` gates all hover effects?**

### Navigation

- [ ] **Primary nav is reachable with thumb?** (Bottom of screen, not top-left hamburger)
- [ ] **Safe area insets applied to bottom-fixed elements?** (`padding-bottom: max(Xpx, env(safe-area-inset-bottom))`)
- [ ] **`viewport-fit=cover` in meta tag?**

### Performance

- [ ] **Animations use only `transform` and `opacity`?** (No `width`, `height`, `box-shadow`, `background-color` animations)
- [ ] **`will-change` on 5 or fewer elements on screen?**
- [ ] **`prefers-reduced-motion` kills all animation?**
- [ ] **Glass/blur elements limited to 3-5 on screen?** (Each is a compositor layer)
- [ ] **Blur radius 12px or less on glass elements?**
- [ ] **Shadows simplified to 2 layers on mobile?**

### Images

- [ ] **`<picture>` with AVIF > WebP > JPEG sources?**
- [ ] **`sizes` attribute set on responsive images?**
- [ ] **Hero image: `loading="eager"` + `fetchpriority="high"`?**
- [ ] **Below-fold images: `loading="lazy"` + `decoding="async"`?**
- [ ] **All `<img>` have `width` and `height` attributes?** (Prevents layout shift)
- [ ] **Mobile-specific image crops for landscape photos?** (Art direction via `<source media>`)

### Viewport

- [ ] **`svh` instead of `vh` for hero sections?**
- [ ] **`min-height` instead of `height` on viewport-sized sections?**
- [ ] **Layout tested at 375px (iPhone SE), 390px (iPhone 14), 412px (Pixel)?**
- [ ] **Layout tested in landscape mode?** (Rotate and check nothing breaks)
- [ ] **Layout tested at 280px?** (Galaxy Fold outer screen edge case)

### Final Test

- [ ] **Load the site on a real phone.** (Not Chrome DevTools responsive mode. A real phone in your hand.)
- [ ] **Scroll through every section.** (Is anything cut off, overflowing, or overlapping?)
- [ ] **Tap every button and link.** (Are targets big enough? Does feedback feel instant?)
- [ ] **Test on slow network.** (Chrome DevTools > Network > Slow 3G. Does the page feel usable within 3 seconds?)
- [ ] **Does the mobile version feel like it was designed for a phone?** (Not a shrunken desktop. A phone-first experience.)
