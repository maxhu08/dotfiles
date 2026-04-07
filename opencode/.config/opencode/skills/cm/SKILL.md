---
name: cm
description: Generate a concise commit message when the user says cm
---

When the user message is exactly "cm", output a commit message.

- Include relevant code/config changes since the last "cm", or from the start if none
- Ignore unrelated conversation or questions
- Follow the repository's commit conventions
- If unclear, infer style from recent git history

Formatting:

- Single line only
- Do not exceed 100 characters
- No body, no bullet points, no extra lines
- No quotes or code blocks

Style:

- Use imperative mood
- Keep wording minimal and precise
- Use type/scope only if the repo uses them
- No trailing punctuation

Output:

- First line: the commit message only

Then on a new line: If this commit should reference an issue, provide the number and (#N) will be appended while staying under 100 characters.

On the following line: If revisions are required, specify the changes and the message will be regenerated.
