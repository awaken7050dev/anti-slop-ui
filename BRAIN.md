# BRAIN.md — Reasoning Architecture for Frontend Engineering

**OPTIONAL MODULE — Load this for complex multi-page builds, not quick components.**

This file teaches Claude HOW TO THINK about frontend work, not just what to build. It prevents the pattern where AI generates plausible-looking code that falls apart on real devices, with real data, under real scrutiny.

Token cost: ~8KB. Load when: building a full site, redesigning an existing app, or any project with more than 3 pages. Skip when: building a single component, fixing a bug, or making a quick change.

---

## The 6-Step Protocol (Run for EVERY non-trivial decision)

### 1. Decompose Before Building
Break the task into atomic subtasks BEFORE touching code. "Build a dashboard" is not atomic. "Build the sidebar nav with 5 items, active state indicator, and collapse behavior" is atomic.

Write the subtask list. If you can't list the subtasks, you don't understand the task. Go back and ask questions.

### 2. Generate Alternatives Before Committing
For every design or architectural decision, generate AT LEAST 2 approaches. Force a third even if the first two feel obvious.

Example - "How should the mobile nav work?"
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

### 5. Self-Critique With Three Personas
After building, review through three hostile lenses:

**The Designer:** "Is the spacing consistent? Is the typography hierarchy clear? Does every color have meaning? Would I be embarrassed showing this to a design-minded person?"

**The Mobile User:** "Can I reach the CTA with my thumb? Does the text overflow on a small screen? Is the touch target at least 44px? Does the page feel fast on a phone?"

**The Skeptic:** "Does this look AI-generated? What's the first thing someone would criticize? If I showed this on Reddit, would people roast it?"

Fix anything any of them would flag.

### 6. Backward Verify Against the Request
After completing a feature, pretend you never saw the original request. Look at what you built and describe what it does. Then compare against what was actually asked for.

- Anything in the request but not in the build = missed requirement (fix immediately)
- Anything in the build but not in the request = scope creep (justify or remove)

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

---

## Failure Capture

When something goes wrong (a bug, a wrong assumption, a client complaint), don't just fix it. Capture the lesson so the same mistake never happens again.

1. What happened?
2. Root cause?
3. The rule to prevent it
4. Add the rule to the anti-slop checklist or battle scars section.

Every mistake should make you permanently better. If you make the same mistake twice, the learning loop is broken.

---

## Anti-Patterns to Watch For

- **Cargo-culting:** Copying a Tailwind pattern from a tutorial without understanding why it works in that context.
- **Premature responsiveness:** Making every component responsive before verifying it works at desktop width. Get ONE breakpoint perfect first, then adapt.
- **Spec drift:** Implementing what you THINK looks good instead of what was specified.
- **Desktop tunnel vision:** Building for 1280px+ and treating mobile as an afterthought. 60%+ of web traffic is mobile.
- **The "it works in dev" trap:** Dev mode hides real-world issues. Slow fonts, API latency, image loading delays.
- **Animation addiction:** Adding motion because it's fun to code, not because it serves the user.
- **Screenshot-driven development:** Making it look good in a screenshot without testing interaction states.

---

## Periodic Reflection (Every 3 Completed Pages/Components)

Stop and ask:
1. Am I still following the Impression Scale level we set at the start? Or have I drifted?
2. Is the spacing consistent across everything I've built so far?
3. Am I using the same component patterns everywhere, or has my approach drifted?
4. What's the riskiest remaining work?
5. If I showed everything built so far to the target audience, would they see a cohesive product or a patchwork?
