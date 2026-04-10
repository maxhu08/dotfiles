---
description: Generate a concise commit message
---

Generate a commit message for the current repo changes.

Work quickly. Use the smallest amount of inspection needed.

1. Check for a commit-message convention such as `commitlint` or similar config.
2. If one exists, follow it.
3. Otherwise, infer the style from recent commits.
4. Base the message on relevant changes since the last `cm`, or from the start if none.
5. Ignore unrelated conversation.

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

- First line: only the commit message
- If no follow-up is needed, stop after the first line
- If an issue number is needed or the request needs revision, add exactly one second line with this exact text:

`If this should reference an issue or you'd like revisions, send the issue number or the changes to make and I'll regenerate it.`

If the user provides an issue number or revision instructions, regenerate the message using that information.
