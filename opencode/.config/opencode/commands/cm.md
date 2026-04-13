---
description: Generate commit message; args: [issue-number] [git]
---

Generate a commit message for the current repo changes.

Work quickly. Use the smallest amount of inspection needed.

Arguments: `$ARGUMENTS`

Argument handling:

- Default to using only this conversation to understand the requested changes.
- Do not inspect git history or diffs unless the arguments explicitly ask for git mode.
- If the arguments include an issue number, append ` (#<ISSUE_NUMBER>)`.
- If the arguments include git mode, inspect `git diff` and summarize all current changes instead of using only this conversation.
- If no issue number is provided, do not append one.

Accepted argument forms:

- No arguments: conversation-only mode, no issue number.
- `<issue-number>`: conversation-only mode, append ` (#<issue-number>)`.
- `git`: git mode, no issue number.
- `<issue-number> git`: git mode, append ` (#<issue-number>)`.
- Reject any other argument format.

Process:

1. Check for a commit-message convention such as `commitlint` or similar config.
2. If one exists, follow it.
3. Otherwise, infer the style from recent commits.
4. In conversation-only mode, base the message only on the relevant requested changes in this conversation.
5. In git mode, base the message on the current repo diff.
6. Ignore unrelated conversation.

Rules:

- Single line only
- Maximum 100 characters
- No body, bullets, quotes, or code fences
- Use imperative mood
- Keep wording minimal and precise
- Use type/scope only if the repo uses them
- No trailing punctuation
- If the commit references an issue, append ` (#<ISSUE_NUMBER>)`

Output:

- Output only the commit message
