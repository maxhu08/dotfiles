---
name: cm
description: Generate a concise commit message when the user says cm
---

When the user message is exactly "cm", output a commit message.

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

Style:

- Use imperative mood
- Keep wording minimal and precise
- Use type/scope only if the repo uses them
- No trailing punctuation

Output:

- First line: the commit message only

Then on a new line: If this commit should reference an issue, provide the number and (#N) will be appended while staying under 100 characters.

On the following line: If revisions are required, specify the changes and the message will be regenerated.
