---
name: visual-explainer
description: This skill should be used when the user asks to "explain," "teach," "walk me through," "help me understand," "break down," or "visualize" something multi-step, when they self-identify as a visual learner, or when they ask for an explainer, primer, field guide, deep-dive, or learning artifact. Also use proactively when the natural answer to a question would be a long-form conceptual explanation the user is likely to read once and refer back to. Produces editorial-grade, scrollable HTML visual explainers that thread a single concrete example through every stage of a multi-step concept (process, lifecycle, framework, journey, mental model, taxonomy, decision tree, or layered topic). Do NOT use for short factual answers, code generation, or single-screen reference cards.
---

# Visual Explainer

A skill for producing the kind of explainer artifact that makes a visual learner say "now I get it" in one pass. This is not a generic doc template. It's a specific aesthetic-and-pedagogical recipe that has been validated on real users and is intentionally designed to avoid the generic, slop-feeling output that comes from defaulting to bullet points, system fonts, and purple gradients.

## The core principle

A great visual explainer rests on one structural insight: **the reader is not learning N separate ideas, they are watching one example travel through N stages.** Continuity of example is more valuable than variety of example. Every section reinforces a single mental thread, so by the end the reader has both the abstract framework AND a concrete instance fully developed in parallel.

If you only remember one rule from this skill: pick ONE example, and develop it through every single section. Never introduce a second example just because it would illustrate a particular point better. Resist that urge. Continuity wins.

## When the form fits

This format shines for:

- Lifecycles, processes, workflows (product dev, hiring, deal flow, incident response)
- Mental models and frameworks (SWOT, OODA loop, Cynefin, decision trees)
- Layered taxonomies (defense in depth, stages of a market, levels of autonomy)
- Conceptual journeys (how a packet travels the internet, how a bill becomes law)
- "How something works" explanations with 4 to 10 logical stages

It does NOT fit:

- Short factual Q&A
- Reference cards or cheat sheets the user will scan, not read
- Anything fewer than 4 stages (overhead exceeds payoff)
- Anything more than 10 stages (reader fatigue, mobile scroll becomes punishment)

## The recipe

Follow this sequence. Each step is load-bearing.

### Step 1: Identify the stages

Distill the topic into 4 to 10 sequential, named stages. Each stage must:

- Have a one-or-two-word name (a verb or short noun phrase, NOT a sentence)
- Sit at roughly the same level of abstraction as its siblings
- Logically precede the next stage in a way the reader can follow

If two adjacent stages overlap heavily, merge them. If one stage feels twice as big as the others, split it. Spend real time here — bad stage decomposition cannot be saved by good visual design downstream.

### Step 2: Choose the threading example

Pick ONE concrete example that will live through every stage. The example must:

- Be **universally relatable**: most readers should grasp it without domain knowledge. A plant care app, a coffee shop opening, a bicycle being built. Not a credit derivatives desk or a Kubernetes cluster, unless that's explicitly the audience.
- Be **visually rich**: it should generate different-looking artifacts at different stages (a sticky note at stage 1, a wireframe at stage 4, an app store listing at stage 7). If your example produces the same kind of visual snapshot at every stage, switch examples.
- Be **emotionally neutral or warm**: avoid topics that risk distracting the reader with their own feelings about the example. No layoffs, no medical diagnoses, no political campaigns unless that IS the topic.
- Have **clear evolution**: a real before-and-after at every stage. The example should look meaningfully different at stage 8 than at stage 1.

Give the example a proper noun (a name like "Sprout" or "Bramble Coffee"). Named examples land harder than generic ones.

### Step 3: For each stage, design a concept-then-example block

Every stage follows the same outer structure but the inner content varies. The repetition gives the reader rhythm; the variation keeps them engaged.

The block structure:

1. **Stage number** in mono font, small, with a horizontal rule. ("STAGE 03 ———")
2. **Stage title** in display serif, with one word italicized for typographic interest. ("Define *the MVP*")
3. **Guiding question** in italic serif with a colored left border. The single most important question this stage answers. ("What is the smallest thing we could ship that proves the idea?")
4. **Explanation** as 2 short paragraphs of prose, total ~100-130 words. Bold the key terms within prose. No bullet points within paragraphs.
5. **Key activities** as 3-5 small mono-font tags. ("user interviews", "competitor analysis")
6. **Visual snapshot** showing the example AT THIS STAGE. Custom per stage — never reuse the same visual template.

### Step 4: Design custom visual snapshots per stage

This is where most explainers fail. They use the same chart or icon for every section, and the reader's eye glazes over. Each stage gets its own native visual representation. Use the snapshot library below as a starter palette and add new ones as needed.

See `references/visual-snapshot-library.md` for the catalog of patterns by concept type and the HTML/CSS/SVG implementations.

### Step 5: Write a closing synthesis

The artifact ends with a section that recontextualizes the linear journey. The most powerful version reveals that what looked like a line was actually a loop, a tree, a spiral, or some other shape. The reader should finish thinking "oh, it's not what I thought it was" — that's the moment the model snaps into place.

This is also a good place for an interactive thought exercise: "Now pick something you actually use and try to imagine its journey through these stages." Active recall cements the learning.

## Per-section template (HTML structure)

Use this skeleton for each stage section. Aesthetic details live in `references/design-system.md`.

```html
<section class="stage">
  <div class="container">
    <div class="stage-grid">
      <div class="stage-content">
        <div class="stage-number">STAGE 0X <span class="stage-number-line"></span></div>
        <h2>Stage title <em>with italicized word</em></h2>
        <p class="stage-question">"The single guiding question for this stage."</p>
        <p>First paragraph of explanation, with <strong>key term</strong> bolded.</p>
        <p>Second paragraph, finishing the thought with another <strong>key concept</strong> bolded.</p>
        <div class="key-activities">
          <div class="key-activities-label">Typical activities</div>
          <span class="activity-tag">activity one</span>
          <span class="activity-tag">activity two</span>
          <span class="activity-tag">activity three</span>
        </div>
      </div>
      <div class="visual-panel">
        <div class="visual-label">Example at Stage X</div>
        <!-- Custom visual snapshot here -->
      </div>
    </div>
  </div>
</section>
```

## Design system essentials

For full details see `references/design-system.md`. Headlines:

**Typography**: Pair a distinctive display serif (Fraunces, Instrument Serif, EB Garamond, Bricolage Grotesque) with a clean humanist sans (IBM Plex Sans, Söhne, GT America, or Work Sans as a free fallback) and a mono accent (IBM Plex Mono, JetBrains Mono). NEVER default to Inter, Roboto, Arial, or system fonts.

**Color**: Commit to a warm, atmospheric palette. Cream or off-white background beats pure white. Deep ink beats pure black. One earthy primary accent, one warm secondary accent, one muted tertiary. NEVER use purple gradients on white — that is the unmistakable signature of generic AI output.

**Texture**: Add a paper grain or subtle noise via CSS radial gradients. It costs almost nothing and immediately separates the output from default rendered HTML.

**Layout**: Two-column grid (concept left, visual right). Alternate section background colors for rhythm. Generous vertical padding (60-80px per section). On mobile, columns stack and visuals come second.

**Motion**: Optional. CSS-only is fine. Don't over-animate, this is a reading artifact, not a presentation.

## Voice essentials

For full details see `references/writing-voice.md`. Headlines:

**Tone**: Confident, warm, lightly editorial. Like a smart older friend explaining the domain over coffee. Not lecturing, not breezy, not jargon-heavy. Specific where it matters, restrained where it doesn't.

**Per stage**: Exactly two short paragraphs (~50-65 words each). Paragraph one defines the concept concretely. Paragraph two adds the nuance, the surprising fact, or the principle behind the principle.

**Bolding**: 1-3 key terms per paragraph. Bold the words that name the thing being taught, not emphatic flourishes ("**MVP** stands for…" not "this is **really important**").

**Hedge fog**: One hedge per sentence at most. "May," "might," "could," "potentially," "often," "typically" stacked together say nothing.

**Guiding question**: One italic question per stage, 6-15 words, phrased as the question the practitioner is asking themselves at this moment. The highest-leverage sentence in the artifact.

**Avoid the AI tell**: No "let's dive in," no "in today's fast-paced world," no "it's important to note that," no "at its core," no paragraphs ending in a rhetorical-question summary, no three-part lists out of nowhere.

## Length calibration

The reader should finish in 5-12 minutes of focused scrolling. Specific targets:

- Hero intro: 60-90 words
- Per-stage explanation: 100-130 words across 2 short paragraphs
- Activity tags: 3-5 per stage
- Closing synthesis: 80-120 words

If your draft is much longer, you are over-explaining. Trust the reader. If much shorter, the example is probably underdeveloped at each stage.

## Common pitfalls

Watch for these failure modes:

**Multiple examples**: The single biggest mistake. Once you introduce a second example "just to make this point clearer" you've broken the threading and weakened every other section retroactively. If a single example cannot illustrate a stage, your stage decomposition is wrong, not your example.

**Generic typography**: Inter on white background with purple accents. The fastest way to make the artifact feel disposable.

**Identical visual snapshots**: Bar chart at every stage. Or worse, a "stage icon" placeholder. Each snapshot should be a different visual idiom drawn from the natural artifacts of that stage.

**Bullet-point colonization**: Bullets feel like "filling out a form" rather than reading. Use prose with bold key terms instead. Save lists for the small activity tags and the closing diagram.

**Conclusion that just summarizes**: A closing that recaps "we covered stages 1 through 8" wastes the closing. Use it to reveal a new shape, suggest an exercise, or change the frame.

**Too-long prose paragraphs**: 2-3 sentences each, maximum. The format depends on visual rhythm.

## Reference example

`examples/reference-example.html` is a canonical, validated implementation of this skill (a product development lifecycle explainer using a plant care app called "Sprout" as the threading example). Open it as a benchmark when you're unsure whether your draft hits the bar. If your draft feels visually thinner, less continuous, or less editorial than the reference, iterate before delivering.

## Workflow

1. Confirm the topic and audience with the user if not obvious from context.
2. Internally decompose the topic into stages and pick a threading example. Quickly sanity-check the example by imagining the visual snapshot at each stage. If you can't picture them, pick a different example.
3. Draft the HTML artifact end to end as a single self-contained file: inline CSS, inline SVG, Google Fonts via `<link>`. No external JS, no build step, no dependencies the reader needs to install.
4. Deliver the artifact. Keep the chat message short: confirm what you built and offer 1-2 sentences of meta-guidance on how to use it.
5. Offer light iteration: "If you'd like a different example or a different aesthetic direction, say the word."
