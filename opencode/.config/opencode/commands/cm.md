---
description: Generate a concise commit message
---

Generate a commit message for the current repo changes.

Before writing the message:

- Check whether the repo has a commit convention configured, such as a `commitlint` config or similar commit-message rule/config
- If a convention is configured, follow it
- If no convention is configured, inspect recent git history for this repo and infer the commit style from there
- Base the message on relevant code/config changes since the last `cm`, or from the start if none
- Ignore unrelated conversation or questions

Formatting:

- Single line only
- Do not exceed 100 characters
- No body
- No bullet points
- No extra lines
- No quotes
- No code blocks
- If the commit references an issue, append a space followed by `(#<ISSUE_NUMBER>)` on the same line

Style:

- Use imperative mood
- Keep wording minimal and precise
- Use type/scope only if the repo uses them
- No trailing punctuation

Output:

First line: the commit message only. If an issue is referenced, include `(#<ISSUE_NUMBER>)` at the end while remaining under the 100-character limit.

Then on a new line: if this commit should reference an issue, provide the issue number.

On the following line: if revisions are required, specify the changes and the message will be regenerated.
