# Design System Reference

Detailed design tokens, font choices, and layout rules for visual-explainer artifacts. Read this when drafting the CSS for a new explainer. The full CSS from the canonical reference example is in `../examples/reference-example.html` and can be copy-adapted.

## Typography

### Display serif (for headings)

Choose a distinctive serif with character. Variable fonts with stylistic axes (Fraunces SOFT/WONK, Bricolage GRAD) add interest without extra work. Italic variants matter — most headings will italicize one word for typographic rhythm.

Tier 1 (default picks):
- **Fraunces** — variable serif with SOFT and WONK axes, very expressive italic. Excellent for warm/editorial palettes.
- **Instrument Serif** — refined, slightly art-deco. Excellent for sophisticated/luxury palettes.
- **EB Garamond** — classical, restrained. Excellent for academic/historical palettes.

Tier 2 (when Tier 1 doesn't match the topic):
- Playfair Display, Cormorant Garamond, Newsreader, Crimson Pro, Lora.

Avoid: any system serif, Times New Roman, Georgia.

### Body sans (for prose and UI)

Choose a humanist sans with good weight range. Avoid the over-used "neutral" sans of the AI generation.

Tier 1:
- **IBM Plex Sans** — strong character, broad weight range, pairs beautifully with mono sibling.
- **Work Sans** — neutral but warmer than Inter, free, reliable.

Tier 2:
- Inter Tight (only with a strong display serif counterweight)
- Söhne, GT America (if available)
- Manrope, Public Sans

Avoid: **Inter, Roboto, Arial, Helvetica, system-ui** as the default body font. These are the unmistakable fingerprint of generic AI design output. If you find yourself reaching for them, pause and pick something else.

### Mono accent (for stage numbers, tags, technical labels)

- **IBM Plex Mono** — pairs natively with IBM Plex Sans.
- **JetBrains Mono** — strong fallback.
- **Space Mono** — when you want more character.

Mono is used in small sizes (10-12px) for metadata: stage numbers, tags, timestamps, code-like elements, eyebrow labels.

### Type scale

Use a fluid scale with `clamp()` for headings so the artifact reads well on mobile.

```css
/* Hero */
h1 { font-size: clamp(44px, 8vw, 88px); line-height: 0.95; letter-spacing: -0.02em; }

/* Stage titles */
h2 { font-size: clamp(36px, 5vw, 54px); line-height: 1.05; letter-spacing: -0.02em; }

/* Section sub-headers */
h3 { font-size: 22px; line-height: 1.3; }

/* Body */
body { font-size: 16-17px; line-height: 1.65; font-weight: 300; }

/* Mono labels */
.mono-label { font-size: 10-12px; letter-spacing: 0.15-0.2em; text-transform: uppercase; }
```

Use font-weight 300 (Light) for body text in IBM Plex Sans — it's the most legible at body sizes and gives the artifact its editorial feel. Reserve 500 for bolded inline terms and 600 for emphasis labels.

## Color palettes

The key rule: ONE committed direction, not a mishmash. Each palette below has been validated in a real artifact. Pick the one that matches the topic, or design a new one following the same recipe.

### Warm editorial (default, used in the canonical Sprout example)

For organic, human, lifestyle, or product topics.

```css
--paper: #F2EDE2;        /* page background, cream */
--paper-warm: #ECE4D3;   /* alternating section background, deeper cream */
--ink: #1C1814;          /* primary text, near-black with brown undertone */
--ink-soft: #4A413A;     /* secondary text */
--forest: #2D4A2B;       /* primary accent, deep green */
--sage: #8FA68E;         /* tertiary, muted green */
--sage-light: #C7D3C2;   /* light fill */
--terracotta: #C8624A;   /* secondary accent, warm */
--rust: #A04A33;         /* deeper warm */
--gold: #C9A961;         /* highlight, used sparingly */
--line: rgba(28, 24, 20, 0.12);  /* dividers and borders */
```

### Cool technical

For systems, software architecture, or technical processes.

```css
--paper: #F4F2EE;
--paper-warm: #E8E6E0;
--ink: #15171A;
--ink-soft: #3A3F44;
--accent-1: #2B4C6F;     /* deep blue */
--accent-2: #B8543A;     /* burnt orange */
--accent-3: #8A8580;     /* warm gray */
--line: rgba(21, 23, 26, 0.12);
```

### Refined minimal

For sophisticated/luxury topics or executive audiences.

```css
--paper: #FAFAF7;
--paper-warm: #F2F1ED;
--ink: #1A1A18;
--ink-soft: #5C5C58;
--accent-1: #2E2E2E;     /* near-black */
--accent-2: #8B7355;     /* warm taupe */
--accent-3: #BFB8A8;     /* soft sand */
--line: rgba(26, 26, 24, 0.1);
```

### Organic/botanical

For nature, sustainability, biology, or ecology topics.

```css
--paper: #F5F0E6;
--paper-warm: #EAE2D0;
--ink: #2A2620;
--ink-soft: #564E42;
--accent-1: #4A5D3A;     /* moss */
--accent-2: #C7864E;     /* amber */
--accent-3: #8B6F4E;     /* bark */
--line: rgba(42, 38, 32, 0.12);
```

### Avoid

- Purple gradients on white. The single most overused AI color signature.
- Pure white (`#FFFFFF`) backgrounds. Cream or off-white always reads warmer.
- Pure black text. Use deep ink with subtle hue instead.
- Five+ accent colors. Three is the cap.
- Neon or oversaturated palettes for serious topics. They undermine credibility.

## Background texture

Add a paper-grain or noise texture via two layered radial gradients on `body::before`. This costs near-zero performance and immediately differentiates the artifact from default rendered HTML.

```css
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background-image:
    radial-gradient(rgba(28,24,20,0.025) 1px, transparent 1px),
    radial-gradient(rgba(28,24,20,0.015) 1px, transparent 1px);
  background-size: 3px 3px, 7px 7px;
  background-position: 0 0, 1px 2px;
  pointer-events: none;
  z-index: 1;
}
```

Adjust the rgba values to match the ink color of the chosen palette.

## Layout

### Container

```css
.container {
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 24px;
  position: relative;
  z-index: 2;  /* sits above the grain texture */
}
```

### Stage grid

The defining structural choice. Two columns desktop, one column mobile.

```css
.stage-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 64px;
  align-items: start;
}

@media (max-width: 768px) {
  .stage-grid {
    grid-template-columns: 1fr;
    gap: 36px;
  }
}
```

### Section rhythm

Alternate backgrounds for visual cadence. This makes the scroll feel like flipping pages.

```css
.stage { padding: 80px 0; border-bottom: 1px solid var(--line); }
.stage:nth-child(even) { background: var(--paper-warm); }
```

On mobile, reduce padding to 56px to keep scroll time reasonable.

### Visual panel

The container for the per-stage visual snapshot. Should feel slightly elevated.

```css
.visual-panel {
  background: var(--paper);
  border: 1px solid var(--line);
  border-radius: 6px;
  padding: 28px;
  box-shadow: 0 1px 0 rgba(28,24,20,0.04), 0 8px 24px rgba(28,24,20,0.05);
}

/* On alternating sections, swap the background so it doesn't blend */
.stage:nth-child(even) .visual-panel { background: #FAF6EC; }
```

## Micro-typography details that matter

These small choices separate good from great:

- **Letter-spacing**: tighten headings (-0.02em), loosen mono labels (0.15-0.2em).
- **Line-height**: 0.95-1.05 for big display, 1.3-1.4 for sub-heads, 1.65 for body.
- **Italic emphasis word**: one word per heading italicized for typographic rhythm. Choose the word that carries the conceptual weight.
- **Quotation in serif italic**: the stage question reads better in italic serif with a colored left border than in regular sans.
- **Dashed dividers between sub-sections**: `border-top: 1px dashed var(--line)` reads warmer than solid lines for internal dividers.

## Mobile responsiveness

The artifact must read well on a phone. Specifics:

- Stage grid collapses to single column at 768px.
- Container padding shrinks from 24px to 20px.
- Section padding shrinks from 80px to 56px.
- Hero h1 uses clamp() so it scales smoothly.
- Visuals that depend on absolute positioning (overlapping sticky notes, phone mockups) need their internal dimensions reduced.

Test mentally: would this feel pleasant to scroll through on a phone with one thumb? If not, simplify.
