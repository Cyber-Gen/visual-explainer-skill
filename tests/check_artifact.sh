#!/usr/bin/env bash
# Deterministic structural checks for a visual-explainer artifact.
# Verifies the HTML skeleton, prohibited tokens, and font/color constraints
# the skill commits to. Voice, threading continuity, and visual variety
# are not checked here — open the file in a browser for those.
#
# Usage: ./check_artifact.sh path/to/explainer.html

set -u

if [ "$#" -ne 1 ]; then
  echo "usage: $0 path/to/explainer.html" >&2
  exit 2
fi

file="$1"

if [ ! -f "$file" ]; then
  echo "FAIL: file not found: $file" >&2
  exit 2
fi

pass=0
fail=0
warn=0

note_pass() {
  printf "  \033[32mPASS\033[0m  %s\n" "$1"
  pass=$((pass + 1))
}

note_fail() {
  printf "  \033[31mFAIL\033[0m  %s — %s\n" "$1" "$2"
  fail=$((fail + 1))
}

note_warn() {
  printf "  \033[33mWARN\033[0m  %s — %s\n" "$1" "$2"
  warn=$((warn + 1))
}

echo "Checking: $file"
echo ""

# --- Document basics ---

if head -1 "$file" | grep -qi '<!doctype html>'; then
  note_pass "DOCTYPE html declared"
else
  note_fail "DOCTYPE html declared" "first line is not <!DOCTYPE html>"
fi

# --- Stage count ---

stage_count=$(grep -cE '<section[[:space:]]+class="stage"' "$file" || true)
if [ "$stage_count" -ge 4 ] && [ "$stage_count" -le 10 ]; then
  note_pass "Stage count in [4, 10] (found $stage_count)"
else
  note_fail "Stage count in [4, 10]" "found $stage_count"
fi

# --- Required child classes per stage ---

for cls in stage-number stage-question key-activities visual-panel; do
  count=$(grep -cE "class=\"[^\"]*\\b${cls}\\b" "$file" || true)
  if [ "$count" -ge "$stage_count" ]; then
    note_pass "Each stage has .${cls} ($count occurrences)"
  else
    note_fail "Each stage has .${cls}" "found $count, expected at least $stage_count"
  fi
done

# h2 inside stage — count h2 tags inside any <section class="stage">
# Approximation: total h2 should be at least stage_count
h2_count=$(grep -cE '<h2[> ]' "$file" || true)
if [ "$h2_count" -ge "$stage_count" ]; then
  note_pass "Each stage has at least one <h2> (total $h2_count)"
else
  note_fail "Each stage has at least one <h2>" "found $h2_count h2s for $stage_count stages"
fi

# --- Hero section ---

if grep -qE '<section[[:space:]]+class="hero"' "$file"; then
  note_pass "Hero section present"
else
  note_fail "Hero section present" "no <section class=\"hero\">"
fi

# --- External resources ---

if grep -q 'fonts.googleapis.com' "$file"; then
  note_pass "Google Fonts <link> present"
else
  note_fail "Google Fonts <link> present" "no fonts.googleapis.com reference"
fi

# External JS
if grep -qE '<script[^>]+src=["'"'"']https?://' "$file"; then
  note_fail "No external JavaScript" "found <script src=\"http(s)://...\">"
else
  note_pass "No external JavaScript"
fi

# External stylesheets other than Google Fonts
external_css=$(grep -E '<link[^>]+rel=["'"'"']stylesheet["'"'"']' "$file" | grep -vE 'fonts\.googleapis\.com|fonts\.gstatic\.com' || true)
if [ -z "$external_css" ]; then
  note_pass "No non-Google-Fonts external stylesheets"
else
  note_fail "No non-Google-Fonts external stylesheets" "found: $(echo "$external_css" | head -1)"
fi

# External images
if grep -qE '<img[^>]+src=["'"'"']https?://' "$file"; then
  note_fail "No external image dependencies" "found <img src=\"http(s)://...\">"
else
  note_pass "No external image dependencies"
fi

# Build step references
if grep -qiE 'webpack|vite\.config|package\.json|npm install|node_modules' "$file"; then
  note_fail "No build-step references" "found webpack/vite/npm token"
else
  note_pass "No build-step references"
fi

# --- Color constraints ---

# Purple hex colors
if grep -qiE '#(a855f7|7c3aed|8b5cf6|9333ea|6d28d9|a78bfa|7e22ce|c084fc)' "$file"; then
  matched=$(grep -oiE '#(a855f7|7c3aed|8b5cf6|9333ea|6d28d9|a78bfa|7e22ce|c084fc)' "$file" | head -1)
  note_fail "No purple hex colors" "found $matched"
else
  note_pass "No purple hex colors"
fi

# Named purple/violet (avoid matching CSS comments or stray prose by limiting to property-value context)
if grep -qiE ':[[:space:]]*(purple|violet)\b' "$file"; then
  note_fail "No purple/violet named colors" "found purple or violet as a CSS value"
else
  note_pass "No purple/violet named colors"
fi

# --- Body background not pure white ---

body_bg=$(awk '/^[[:space:]]*body[[:space:]]*\{/,/\}/' "$file" | grep -m 1 'background' || true)
if [ -z "$body_bg" ]; then
  note_warn "Body background declaration found" "no 'background' declaration found in body{} block — check manually"
else
  if echo "$body_bg" | grep -qiE '#(fff|ffffff)\b|background[^;]*:[[:space:]]*white\b'; then
    note_fail "Body background not pure white" "body declares $(echo "$body_bg" | tr -d '\n')"
  else
    note_pass "Body background not pure white"
  fi
fi

# --- Primary body font not Inter/Roboto/Arial/system-ui ---

body_font=$(awk '/^[[:space:]]*body[[:space:]]*\{/,/\}/' "$file" | grep -m 1 'font-family' || true)
if [ -z "$body_font" ]; then
  note_warn "Body font-family found" "no 'font-family' in body{} block — check manually"
else
  # Extract first font in the stack
  primary=$(echo "$body_font" | sed -E "s/.*font-family:[[:space:]]*['\"]?([^,'\";]+).*/\1/" | sed 's/[[:space:]]*$//')
  case "$primary" in
    Inter|Roboto|Arial|Helvetica|system-ui|sans-serif)
      note_fail "Primary body font not Inter/Roboto/Arial/Helvetica/system-ui" "primary body font: $primary"
      ;;
    *)
      note_pass "Primary body font is '$primary' (not a prohibited generic)"
      ;;
  esac
fi

# --- Summary ---

echo ""
printf "Summary: \033[32m%d PASS\033[0m  \033[31m%d FAIL\033[0m  \033[33m%d WARN\033[0m\n" "$pass" "$fail" "$warn"
echo ""
echo "Structural checks only. Voice, threading continuity, and visual variety"
echo "require human review — open the file in a browser."

if [ "$fail" -gt 0 ]; then
  exit 1
else
  exit 0
fi
