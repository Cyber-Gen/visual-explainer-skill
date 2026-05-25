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

Two install paths, depending on whether you want the full plugin or just the skill.

### Option 1 — Full plugin (recommended)

Download `visual-explainer-plugin-vX.Y.Z.zip` from the [latest release](https://github.com/Cyber-Gen/visual-explainer/releases/latest), unzip into your Claude Code plugins directory, and enable it. Or, for development, point Claude Code at this repo directly:

```bash
git clone https://github.com/Cyber-Gen/visual-explainer.git
claude --plugin-dir ./visual-explainer
```

### Option 2 — Skill only

Download `visual-explainer-skill-vX.Y.Z.zip` from the [latest release](https://github.com/Cyber-Gen/visual-explainer/releases/latest) and unzip into `~/.claude/skills/`:

```bash
mkdir -p ~/.claude/skills
curl -L -o /tmp/ve-skill.zip https://github.com/Cyber-Gen/visual-explainer/releases/latest/download/visual-explainer-skill-latest.zip
unzip /tmp/ve-skill.zip -d ~/.claude/skills/
```

This drops `~/.claude/skills/visual-explainer/SKILL.md` (plus its `references/` and `examples/`) — exactly the layout Claude Code expects for a standalone skill.

## Invoke

Once installed, the skill can be invoked by either:

1. Manually using `/visual-explainer` in your prompt.

2. Automatically using triggering prompts like:

    ```text
    "Help me understand how OAuth works"
    "Walk me through the product launch lifecycle"
    "I'm a visual learner — break down the SAFe framework"
    "Build me a primer on venture funding rounds"
    ```

---

<div align="center">

[MIT](LICENSE) &nbsp;·&nbsp; Built by [Cyber-Gen](https://github.com/Cyber-Gen)

</div>
