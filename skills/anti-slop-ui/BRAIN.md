# BRAIN.md: Reasoning Architecture for Frontend Engineering

**OPTIONAL MODULE. Load this for complex multi-page builds, not quick components.**

This file teaches Claude HOW TO THINK about frontend work, not just what to build. It prevents the pattern where AI generates plausible-looking code that falls apart on real devices, with real data, under real scrutiny.

Token cost: ~8KB. Load when: building a full site, redesigning an existing app, or any project with more than 3 pages. Skip when: building a single component, fixing a bug, or making a quick change.

---

## The 6-Step Protocol (Run for EVERY non-trivial decision)

### 1. Decompose Before Building
Break the task into atomic subtasks BEFORE touching code. "Build a dashboard" is not atomic. "Build the sidebar nav with 5 items, active state indicator, and collapse behavior" is atomic.

Write the subtask list. If you can't list the subtasks, you don't understand the task. Go back and ask questions.

### 2. Generate Alternatives Before Committing
For every design or architectural decision, generate AT LEAST 2 approaches. Force a third even if the first two feel obvious.

Example: "How should the mobile nav work?"
- Option A: Hamburger menu with slide-out drawer. Pros: familiar. Cons: hides navigation, extra tap.
- Option B: Bottom tab bar. Pros: always visible, thumb-friendly. Cons: limits to 5 items.
- Option C: Collapsible top bar that shrinks on scroll. Pros: saves space dynamically. Cons: complex implementation.

Pick one with explicit reasoning: "I chose B because the app has exactly 4 main sections and mobile users need zero-tap access."

### 3. Pre-Mortem Before Implementing
Ask three questions BEFORE writing code:
- "What could go wrong with this approach?" (iOS Safari viewport bugs, font loading flash, hydration mismatch)
- "What assumption am I making that might be false?" (image URLs exist, API returns data, user has JavaScript enabled)
- "What device/browser edge case am I ignoring?" (375px width, 120% zoom, right-to-left language, slow 3G)

If you can't think of at least one risk, you haven't thought hard enough.

### 4. Verify in the Browser, Not the Code
"It compiles" is NOT verification. "It compiles AND I opened it in a browser AND the output matches the design on desktop AND tablet AND mobile" is verification.

For frontend specifically:
- Open the page in an actual browser
- Test at 375px (iPhone SE), 768px (iPad), 1280px (laptop), 1920px (desktop)
- Test with real data (not placeholder text that's the perfect length)
- Test with empty data (what happens when the API returns nothing?)
- Test with broken data (what happens when an image URL 404s?)

### 5. Mechanical Self-Check (NOT taste-based introspection)
After building, run grep-able checks on your own output. Do not ask yourself "does this look good" (you cannot answer that from inside the loop). Ask:
- Is every color in the output either a token reference or from the Level palette? (grep for hex/rgb literals)
- Does every animation have a `prefers-reduced-motion` guard?
- Does every image have alt text and a description comment?
- Is spacing a multiple of the base unit (4px or 8px)? (scan for odd pixel values)
- Is every nav `href` either a real path, an anchor, or removed? (grep for `href="#"` and `href=""`)
- Has the em dash scan been run? (grep for `—`)

Mechanical tests pass or fail. Taste tests always "pass" because the builder cannot see their own output clearly.

### 6. Backward Verify Against the Request
After completing a feature, pretend you never saw the original request. Look at what you built and describe what it does. Then compare against what was actually asked for.

- Anything in the request but not in the build = missed requirement (fix immediately)
- Anything in the build but not in the request = scope creep (justify or remove)

---

## Interpreting User Rejection: Category vs Tweak

When the user rejects something ("feels weird," "not it," "something's off," "not quite"), that is usually a category diagnosis, not a tweak request. Before iterating on the same approach, stop and ask: **are they telling me to tune the current knobs, or to change instruments entirely?**

- **Tweak rejection** means "the idea is right, the execution needs adjustment." Change font size, spacing, color value, animation timing.
- **Category rejection** means "you are in the wrong neighborhood entirely." Change the instrument: drop the gradient and use a solid color, drop the blob and use a contour, drop the hero image and use typography.

**Heuristics for spotting category rejection:**
- If you have already tried two variations of the same idea and the user is still rejecting, that is the signal to switch categories. Do NOT try a third tweak. The user is pointing at the neighborhood, not the house.
- Vague taste-based language ("feels AI," "too much," "weird vibe," "something's off") is almost always category-level. The user can see something you cannot see from inside the loop.
- Specific mechanical language ("too big," "move it left," "lighter blue") is tweak-level. Execute the tweak directly.
- When in doubt, ASK: "Do you want me to tune this, or try a different direction entirely?" One question saves three failed iterations.

**The collaborator's edge:** a human reviewer has a category-level view you do not have while building. When they reject something, your first question should be "wrong execution, or wrong category?" Not "what tweak do they want?" The tweak assumption burns iterations. The category question costs one sentence.

---

## Decision Logging

For multi-page builds, log significant design decisions so you don't second-guess them later or make contradictory choices across pages.

Format:
```
## [Date] [Decision]
Chose: [What you picked]
Over: [What you rejected and why]
Because: [The reasoning]
Risk: [What could prove this wrong]
```

Example:
```
## 2026-04-10 Mobile Navigation
Chose: Bottom tab bar with 4 items
Over: Hamburger menu (hides nav, extra tap) and collapsible top bar (complex, buggy on Safari)
Because: Only 4 main sections, all equally important, thumb-friendly
Risk: If we add a 5th section later, we need to redesign
```

---

## Failure Capture

When something goes wrong (a bug, a wrong assumption, a client complaint), don't just fix it. Capture the lesson so the same mistake never happens again.

1. What happened? (e.g., "Hero text was 3 lines on iPhone 12 but 2 lines in Chrome responsive mode")
2. Root cause? (e.g., "Chrome responsive mode uses different font rendering than iOS Safari, affecting line breaks")
3. The rule to prevent it: (e.g., "ALWAYS test hero text on a real iPhone, not just responsive mode. Emulators lie about text rendering.")
4. Add the rule to the anti-slop checklist or battle scars section.

Every mistake should make you permanently better. If you make the same mistake twice, the learning loop is broken.

---

## Anti-Patterns to Watch For

These are the specific ways AI-driven frontend work goes wrong. Check for them during the self-critique step:

- **Cargo-culting:** Copying a Tailwind pattern from a tutorial without understanding why it works in that context. "This dashboard tutorial used grid-cols-3 so I will too" but your content doesn't fit 3 columns.

- **Premature responsiveness:** Making every component responsive before verifying it works at desktop width. Get ONE breakpoint perfect first, then adapt.

- **Spec drift:** Implementing what you THINK looks good instead of what was specified. If the user said "blue accent" and you used purple because it "felt right," that's spec drift.

- **Desktop tunnel vision:** Building for 1280px+ and treating mobile as an afterthought. 60%+ of web traffic is mobile. Design mobile-first or at minimum mobile-equal.

- **The "it works in dev" trap:** Dev mode with hot reload, fresh cache, and localhost speed hides real-world issues. Slow fonts, API latency, image loading delays, CDN cache behavior.

- **Animation addiction:** Adding motion because it's fun to code, not because it serves the user. Every animation should answer: "what STATE CHANGE does this communicate?"

- **Screenshot-driven development:** Making it look good in a screenshot without testing interaction states. Hover, focus, active, disabled, loading, error, empty.

---

## Drift Check (Every 3 Completed Pages)

For multi-page builds, the biggest risk is tokens drifting between pages. Do not check "does it feel cohesive" (taste); check mechanically:
1. Open the first page and latest page side by side. Is the header the same height? Same background? Same nav styling?
2. Is the body font size identical across both? (Inspect element, not eyeball.)
3. Is the spacing scale the same? (Do both pages use 8px increments, or did one drift to 10/12/14?)
4. Are the button styles identical? (Same height, padding, radius, color.)

If any of these diverge, pick one source of truth (usually the first page) and fix the later ones. Do NOT try to remember "what Level were we at" halfway through; read STEP 2 of SKILL.md again to verify.
