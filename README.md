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

Download `visual-explainer-plugin-vX.Y.Z.zip` from the [latest release](https://github.com/Cyber-Gen/visual-explainer-skill/releases/latest).

#### Upload in Claude.ai / Claude Desktop

Use the same plugin upload flow in Claude.ai and Claude Desktop. Cowork, Chat, and Code should all accept the exact same `plugin.zip`.

1. Download `visual-explainer-plugin-vX.Y.Z.zip`.
2. Open the plugin installer / upload flow in Claude.ai or Claude Desktop.
3. Choose **Upload plugin** and select the zip.
4. Confirm the install and enable `visual-explainer`.
5. Invoke it normally after install.

#### Claude Code development install

```bash
git clone https://github.com/Cyber-Gen/visual-explainer-skill.git
claude --plugin-dir ./visual-explainer
```

### Option 2 — Skill only

Download `visual-explainer-skill-vX.Y.Z.zip` from the [latest release](https://github.com/Cyber-Gen/visual-explainer-skill/releases/latest).

#### Upload in Claude.ai / Claude Desktop

Use the same skill upload flow in Claude.ai and Claude Desktop. Cowork, Chat, and Code should all accept the exact same `skill.zip`.

1. Download `visual-explainer-skill-vX.Y.Z.zip`.
2. Open the skill installer / upload flow in Claude.ai or Claude Desktop.
3. Choose **Upload skill** and select the zip.
4. Confirm the install and enable `visual-explainer`.
5. Invoke it normally after install.

#### Claude Code filesystem install

```bash
mkdir -p ~/.claude/skills
VERSION=X.Y.Z
curl -L -o /tmp/ve-skill.zip "https://github.com/Cyber-Gen/visual-explainer-skill/releases/download/v${VERSION}/visual-explainer-skill-v${VERSION}.zip"
unzip /tmp/ve-skill.zip -d ~/.claude/skills/
```

This drops `~/.claude/skills/visual-explainer/SKILL.md` (plus its `references/` and `examples/`) — exactly the layout Claude Code expects for a standalone skill.

## Releasing

Release tags must match `.claude-plugin/plugin.json` exactly: if the manifest version is `0.1.0`, create the tag `v0.1.0`.

```bash
VERSION="$(jq -r '.version' .claude-plugin/plugin.json)"
git tag -a "v${VERSION}" -m "visual-explainer v${VERSION}"
git push origin "v${VERSION}"
```

Pushing that tag triggers `.github/workflows/release.yml`, which publishes:

- `visual-explainer-plugin-vX.Y.Z.zip`
- `visual-explainer-skill-vX.Y.Z.zip`
- `release-assets-sha256.txt`

If you create the tag in GitHub instead of locally, use the same `vX.Y.Z` name and point it at the commit whose `.claude-plugin/plugin.json` already contains `X.Y.Z`.

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
