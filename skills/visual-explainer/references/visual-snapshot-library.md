# Visual Snapshot Library

A catalog of visual representations to use as the per-stage example snapshot. Each pattern is mapped to the type of concept it expresses naturally. Match the snapshot to the stage, not the other way around.

The cardinal rule: **NEVER use the same snapshot pattern in two stages of the same explainer.** Each stage gets its own native visual idiom.

## Table of contents

1. Sticky notes (ideation, qualitative data, voice-of-customer)
2. Bar chart with caption (research, sizing, trends)
3. Competitor or option matrix (landscape, alternatives)
4. Scoped item list (prioritization, MVP, in/out decisions)
5. Phone wireframes with flow arrow (design, UX)
6. Commit log (engineering, build, change history)
7. Test checklist (validation, QA, audit, criteria)
8. App store card (launch, release, public-facing)
9. Analytics dashboard with growth curve (results, traction, metrics)
10. Org chart or hierarchy (structure, taxonomy, roles)
11. Flow diagram with nodes and arrows (process, system, dependency)
12. Timeline or Gantt strip (schedule, sequence, milestones)
13. Quote card with attribution (testimony, principle, manifesto)
14. Map with pinned locations (geography, distribution, coverage)
15. Layered stack diagram (defense in depth, OSI layers, abstraction)
16. Polaroid or photo card (snapshot in time, memory, archive)
17. Receipt or ledger (transaction, cost, exchange)
18. Letter or memo (announcement, decision, formal communication)

## Snapshot patterns

### 1. Sticky notes (ideation, qualitative data)

When the stage is about gathering raw input from people, frame the example as 3 sticky notes with slight rotation, overlap, and pastel backgrounds. Use italic serif for the quote and small mono for attribution.

```html
<div class="sticky-stack">
  <div class="sticky sticky-1">
    "Quote from a user."
    <span class="sticky-attrib">— Name, age</span>
  </div>
  <div class="sticky sticky-2">...</div>
  <div class="sticky sticky-3">...</div>
</div>
```

CSS essentials: `position: absolute` for stack, `transform: rotate(-4deg)` etc for each, `box-shadow: 0 6px 14px rgba(0,0,0,0.12)`, pastel backgrounds (`#F5E6A8`, `#F2C49B`, `#D4E1B8`).

### 2. Bar chart with caption (research, sizing, trends)

Inline CSS bars sized with `height: X%`. Highlight one bar in the primary accent color to draw the eye. Always include a one-line caption in italic serif beneath.

```html
<div class="mini-chart">
  <div class="bar" style="height:40%"><div class="bar-label">2019</div></div>
  <div class="bar highlight" style="height:100%"><div class="bar-label">2023</div></div>
</div>
<div class="chart-title">Caption explaining what's being measured.</div>
```

### 3. Competitor or option matrix

A vertical list with the option name on the left and a short mono-font tag on the right (the differentiator or weakness). Dashed dividers between rows.

```html
<div class="competitor-row">
  <span class="comp-name">Option name</span>
  <span class="comp-tag">key trait</span>
</div>
```

### 4. Scoped item list (MVP, prioritization, in/out)

Rows with a colored left border indicating tier (in/maybe/out) and a small uppercase tag in matching color. Out-of-scope items get strikethrough and 0.6 opacity.

```html
<div class="scope-row in">
  <span class="scope-tag">MVP</span>
  <span>Feature description</span>
</div>
<div class="scope-row maybe">
  <span class="scope-tag maybe">V2</span>
  <span>Nice-to-have feature</span>
</div>
<div class="scope-row out">
  <span class="scope-tag out">CUT</span>
  <span>Out-of-scope feature</span>
</div>
```

Colors: in = forest green, maybe = gold, out = terracotta.

### 5. Phone wireframes with flow arrow

Two or three minimalist phone outlines with rectangular content blocks and an arrow between them. Use the ink color for phone frames and notch.

```html
<div class="phone-row">
  <div class="phone">
    <div class="phone-notch"></div>
    <div class="phone-line dark"></div>
    <div class="phone-block green"></div>
    <div class="phone-line short"></div>
  </div>
  <div class="phone-arrow">→</div>
  <div class="phone">...</div>
</div>
```

Phone dimensions: ~130px x 240px desktop, ~110px x 200px mobile.

### 6. Commit log

Mono-font list of git-like commit entries with a colored type tag (feat/fix/chore), hash, message, and relative timestamp.

```html
<div class="commit">
  <span class="commit-hash">a3f1c</span>
  <span class="commit-msg"><span class="commit-type feat">feat</span>scaffold project</span>
  <span class="commit-time">3w ago</span>
</div>
```

Excellent for: engineering, building, change tracking, version history, evolution.

### 7. Test checklist

Rows with a checkbox icon (filled green for pass, filled terracotta for fail), description, and small uppercase status tag.

```html
<div class="test-row">
  <div class="test-check pass">✓</div>
  <span>Test description</span>
  <span class="test-status pass">PASS</span>
</div>
```

Excellent for: validation, QA, audit findings, criteria evaluation, readiness assessment.

### 8. App store card

Centered card with: rounded app icon (use linear-gradient + emoji), app name in display serif, italic tagline, star rating with count, install button in mono font, then 1-2 italic review quotes below a dashed divider.

```html
<div class="store-card">
  <div class="app-icon">🌱</div>
  <div class="app-name">App Name</div>
  <div class="app-tagline">Tagline in italic serif.</div>
  <div class="stars">★ ★ ★ ★ ☆ <span>4.6 · 312 ratings</span></div>
  <a class="install-btn">INSTALL</a>
  <div class="reviews">
    <div class="review">"Review quote."</div>
  </div>
</div>
```

Excellent for: launches, releases, customer-facing reveals, productization moments.

### 9. Analytics dashboard with growth curve

SVG line chart with gradient fill underneath (showing growth), followed by 2-3 metric rows. Each row: label on left, large serif number on right with a small mono delta tag.

```html
<svg class="growth-svg" viewBox="0 0 300 80" preserveAspectRatio="none">
  <path d="M0,70 Q40,65 60,55 T120,40 T180,28 T240,15 T300,8 L300,80 L0,80 Z" fill="url(#grad)"/>
  <path d="M0,70 Q40,65 60,55 T120,40 T180,28 T240,15 T300,8" stroke="#2D4A2B" stroke-width="2" fill="none"/>
</svg>
<div class="metric-row">
  <span class="metric-label">Monthly active users</span>
  <span><span class="metric-value">12.4k</span><span class="metric-delta">+38% MoM</span></span>
</div>
```

Excellent for: results, traction, post-launch reality, iteration data.

### 10. Org chart or hierarchy

SVG with nodes (circles or rects) connected by lines. Root at top, branches below. Use the primary accent for the root node and lighter fill for leaves.

Excellent for: org structure, taxonomy, decision trees, reporting lines, categorical breakdowns.

### 11. Flow diagram with nodes and arrows

SVG with labeled nodes and directional arrows. Use `<marker>` for arrowheads. Mono font inside nodes for small labels. Highlight the active or central node in the primary accent.

The closing loop diagram from the canonical Sprout example is the canonical instance of this pattern.

Excellent for: processes, systems, dependencies, lifecycles (especially for the closing synthesis).

### 12. Timeline or Gantt strip

Horizontal bars representing tasks or phases along a timeline. Each bar in a different shade of the palette. Optional vertical "today" indicator. Labels in mono font.

Excellent for: schedules, roadmaps, project phases, historical context.

### 13. Quote card with attribution

A single large pull-quote in italic display serif, with attribution below in mono caps. Optionally a small dingbat above (`✦`, `❖`, `§`).

Excellent for: principles, manifestos, founding quotes, definitions, framing.

### 14. Map with pinned locations

Simplified SVG map outline (country, city, neighborhood) with dots marking key locations. Each dot has a small label tag. Use the muted tertiary color for the map outline and the primary accent for dots.

Excellent for: geography, distribution, coverage, market expansion, locations.

### 15. Layered stack diagram

Horizontal bands stacked vertically, each labeled. Use a gradient of palette colors from bottom (foundation) to top (surface). Excellent for layered concepts.

Excellent for: defense in depth, abstraction layers, OSI stack, hierarchy of needs.

### 16. Polaroid or photo card

White-bordered frame with a colored block or SVG illustration inside, and a handwritten-feel italic caption below.

Excellent for: a moment frozen in time, before/after snapshots, archival moments, memory.

### 17. Receipt or ledger

A narrow column styled like a thermal receipt: mono font, alignment of label-and-amount rows, dashed divider, total line at bottom.

Excellent for: cost breakdowns, exchanges, transactions, value accounting.

### 18. Letter or memo

A typed letter format with date, recipient, body in serif, and signature line in italic. Excellent for formal announcements or decisions.

Excellent for: announcements, decisions, formal communications, manifestos.

## How to choose

Walk through each stage and ask: "What artifact would naturally exist at this moment in the example's life?" The right snapshot is usually obvious once you ask the question. A discovery stage produces interview notes, not a chart. A launch stage produces an announcement, not a wireframe. A testing stage produces a checklist, not a quote.

If two adjacent stages would naturally produce the same snapshot type, you have an opportunity: either re-decompose the stages (they may not be sufficiently distinct), or push one of the snapshots toward a sibling pattern (e.g., commit log → file diff, or checklist → audit report).

## Inventing new snapshots

The 18 patterns above are not exhaustive. If your topic calls for a snapshot pattern not listed here, invent one — just keep the principles in mind:

- It should feel like a natural artifact of that stage's work, not a generic visualization
- It should fit in roughly the same visual footprint as the others (about 280-400px tall)
- It should use the established color palette without introducing new accent colors
- It should use the typography system (serif for headings/quotes, sans for body, mono for technical labels)
- It should work on mobile when the grid collapses to single column
