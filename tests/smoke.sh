#!/usr/bin/env bash
# Generate one HTML explainer from this repo's plugin and validate it.
#
# Why an ephemeral plugin copy: if you already have visual-explainer installed
# on your machine, `claude -p --plugin-dir` may load the installed copy instead
# of (or alongside) the repo's. We inject a per-run nonce into a temp copy of
# SKILL.md and assert it appears in the output — positive proof that the repo's
# version produced this artifact. The repo's SKILL.md is never modified.
#
# The default prompt picks a deliberately simple, universally-relatable concept
# (4–5 stages, no domain knowledge required) so generation is fast. Pass your
# own prompt to test other topics.
#
# Usage: tests/smoke.sh ["a prompt"]
#
# Expected runtime: 3–5 minutes. Hard ceiling at 8 minutes via `timeout` so a
# stuck or runaway session can't burn subscription rate-limit budget silently.

set -euo pipefail

PROMPT="${1:-Use the visual-explainer skill to make a visual HTML explainer titled \"How a seed becomes a tree\". Save it as explainer.html in the current directory.}"

# Hard kill the claude session after this many seconds. Override with SMOKE_TIMEOUT_SECS=N.
TIMEOUT_SECS="${SMOKE_TIMEOUT_SECS:-480}"

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NONCE="smoke-$(uuidgen)"
PLUGIN="$(mktemp -d -t visual-explainer-plugin.XXXXXX)"
OUT="$(mktemp -d -t visual-explainer-out.XXXXXX)"
LOG="$OUT/claude.log"

cleanup() { rm -rf "$PLUGIN"; }
trap cleanup EXIT

cp -a "$REPO_ROOT/.claude-plugin" "$PLUGIN/"
cp -a "$REPO_ROOT/skills"         "$PLUGIN/"

cat >> "$PLUGIN/skills/visual-explainer/SKILL.md" <<EOF

## Smoke-test marker (ephemeral)

Include this HTML comment, verbatim, on the first line after \`<!DOCTYPE html>\` in the produced HTML: \`<!-- $NONCE -->\`
EOF

echo "→ Plugin:  $PLUGIN" >&2
echo "→ Output:  $OUT" >&2
echo "→ Nonce:   $NONCE" >&2
echo "→ Timeout: ${TIMEOUT_SECS}s (kills session if it hangs)" >&2
echo "→ Running claude -p (streaming output below; expected 3–5 min)..." >&2
echo "" >&2

cd "$OUT"
set +e
timeout "$TIMEOUT_SECS" claude -p "$PROMPT" \
  --plugin-dir "$PLUGIN" \
  --settings "$REPO_ROOT/tests/smoke.settings.json" \
  --permission-mode acceptEdits \
  --add-dir "$OUT" \
  --max-turns 10 \
  --verbose \
  --no-session-persistence \
  --exclude-dynamic-system-prompt-sections \
  --strict-mcp-config \
  --no-chrome \
  2>&1 | tee "$LOG" >&2
rc=${PIPESTATUS[0]}
set -e

echo "" >&2
if [ "$rc" -eq 124 ]; then
  echo "FAIL: claude -p exceeded ${TIMEOUT_SECS}s and was killed by timeout(1)." >&2
  echo "      Session was hung — likely an unanswered permission prompt or stalled tool." >&2
  echo "      Log: $LOG" >&2
  exit 1
elif [ "$rc" -ne 0 ]; then
  echo "FAIL: claude -p exited with code $rc." >&2
  echo "      Log: $LOG" >&2
  exit 1
fi

echo "→ claude -p finished cleanly. Locating HTML…" >&2

HTML="$(find "$OUT" -maxdepth 2 -type f -name '*.html' ! -name 'claude.log' -print -quit)"
if [ -z "$HTML" ]; then
  echo "FAIL: no HTML file was produced in $OUT" >&2
  echo "      See log: $LOG" >&2
  exit 1
fi

if ! grep -qF "$NONCE" "$HTML"; then
  echo "FAIL: nonce '$NONCE' missing from $HTML" >&2
  echo "      An older/installed plugin version likely produced this artifact" >&2
  echo "      instead of the repo's. Check 'claude plugin list' for conflicts." >&2
  exit 1
fi

"$REPO_ROOT/tests/check_artifact.sh" "$HTML"

echo ""
echo "OK: provenance verified (nonce found), structural checks pass."
echo "Artifact: $HTML"
echo "Log:      $LOG"
