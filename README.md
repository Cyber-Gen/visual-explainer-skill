<div align="center">

# visual-explainer

*A Claude Code plugin (and standalone Skill) for editorial-grade, scrollable HTML explainers.*

**[Canonical example](skills/visual-explainer/examples/reference-example.html)**

</div>

---

> Most explainers fail by listing N separate ideas. This one threads **a single named example through every stage** — the reader watches it evolve rather than memorize a checklist.

## What it produces

A single self-contained HTML file with editorial-quality typography, custom visual snapshots for each stage, and full mobile responsiveness. Perfect for explaining **lifecycles**, **mental models**, **taxonomies**, and **conceptual journeys** that unfold across multiple stages.

## Install

Two install paths, depending on whether you install as plugin or skill.

### Option 1 — Plugin (recommended for Claude ecosystem)

Download `visual-explainer-plugin-vX.Y.Z.zip` from the [latest release](https://github.com/Cyber-Gen/visual-explainer-skill/releases/latest).

#### Upload in Claude.ai / Claude Desktop app

1. Download `visual-explainer-plugin-vX.Y.Z.zip`.
2. Open the **Customize** page
3. Select **+** sign next to Personal plugin
4. Choose **Upload plugin** and select the zipped plugin.
5. Confirm the install and enable `visual-explainer`.

### Option 2 — Skill 

Download `visual-explainer-skill-vX.Y.Z.zip` from the [latest release](https://github.com/Cyber-Gen/visual-explainer-skill/releases/latest).

#### Upload in Claude.ai / Claude Desktop

1. Download `visual-explainer-skill-vX.Y.Z.zip`.
2. Open the **Customize** page and navigate to **Skills** section
3. Select **+** sign to add a new skill
4. Choose **Upload a skill** and select the zipped skill.
5. Confirm the install and enable `visual-explainer`.

#### Claude Code CLI

```bash
mkdir -p ~/.claude/skills
VERSION=X.Y.Z
curl -L -o /tmp/ve-skill.zip "https://github.com/Cyber-Gen/visual-explainer-skill/releases/download/v${VERSION}/visual-explainer-skill-v${VERSION}.zip"
unzip /tmp/ve-skill.zip -d ~/.claude/skills/
```

## Usage

Once installed, the skill can be invoked by either:

1. Manually using `/visual-explainer` in your prompt.

2. Automatically using triggering prompts like:

    ```text
    "Create a visual explainer for how OAuth works"
    "Build a step-by-step visual explainer of the product launch lifecycle"
    "I'm a visual learner – break down the SAFe framework for me"
    ```

---

<div align="center">

[MIT](LICENSE) &nbsp;·&nbsp; Built by [Cyber-Gen](https://github.com/Cyber-Gen)

</div>
