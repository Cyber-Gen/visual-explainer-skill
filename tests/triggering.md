# Triggering checklist

A small set of prompts to confirm `visual-explainer` activates on the right inputs and stays quiet on the wrong ones. **Run by hand** when you edit `SKILL.md`'s description.

How: paste each prompt into a fresh Claude session that has this plugin available, observe whether the skill fires, and tick the boxes below. No automated runner.

## Should FIRE (skill activates and produces an HTML explainer)

| # | Prompt | ✓ |
|---|--------|---|
| F1 | Walk me through how OAuth2 works | ☐ |
| F2 | Help me understand the product launch lifecycle | ☐ |
| F3 | Give me a primer on how venture funding rounds work | ☐ |
| F4 | I'm a visual learner — break down the OODA loop | ☐ |

## Should SKIP (skill stays quiet)

| # | Prompt | ✓ |
|---|--------|---|
| S1 | What's the capital of France? | ☐ |
| S2 | Write a Python function to sort a list of dicts by a nested key | ☐ |
| S3 | Give me a 1-page cheat sheet for git commands | ☐ |
| S4 | Fix this bug: [stack trace] | ☐ |

## What to do when a row misbehaves

If a SHOULD FIRE row stays silent, the description is too narrow — add or rephrase a trigger phrase.

If a SHOULD SKIP row fires, the description is too broad — tighten the "Do NOT use for" clause.

Edit the description, then re-run the eight rows. Do not commit a description change without a clean pass on all eight.
