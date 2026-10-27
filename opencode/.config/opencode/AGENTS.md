# AGENTS.md

## Think Before Coding

Do not assume, hide confusion, or skip tradeoffs.

- Investigate relevant code and context before asking questions. Do not ask the user for information you can discover yourself.
- Make assumptions and tradeoffs explicit. When requirements have materially different interpretations, ask rather than silently choosing.
- Challenge unnecessary complexity and conflicting requirements. Recommend simpler alternatives when appropriate.
- If new evidence invalidates the approach, reassess. Ask when scope or intended behavior changes; resolve ordinary implementation details independently.

## Plan Mode

- Clarify before proposing a solution. Ask focused questions about requirements, constraints, tradeoffs, and relevant edge cases.
- Continue with follow-up questions until no unresolved decisions block implementation. Do not invent answers that materially affect behavior.
- Avoid hypothetical cases or questions that would not change the approach. Explicitly agree on assumptions when uncertainty cannot be resolved.
- After clarification, summarize the agreed behavior, approach, scope boundaries, and verification steps.

## Simplicity First

- Write the smallest clear solution that meets the requirements. Do not add speculative features, configuration, or flexibility.
- Add guards and error handling for realistic failures or untrusted boundaries, not impossible states already ruled out by types, validation, or enforced invariants. Avoid redundant checks and unreachable fallbacks.
- Prefer existing project utilities and standard tools. Add dependencies only when their benefits justify the maintenance cost; do not reinvent substantial, well-solved functionality merely to avoid one.
- If 200 lines could be 50, rewrite it.
- Ask: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## Surgical Changes

Touch only what you must. Clean up only your own mess.

- Match surrounding conventions; do not reformat, refactor, or clean up unrelated code.
- Preserve unfamiliar changes. Remove imports, variables, and helpers made unused by your changes; mention unrelated dead code rather than deleting it.

Every changed line should trace directly to the user's request.

## Reuse and Encapsulate

- Look for existing solutions before writing new logic. Share genuinely repeated behavior instead of maintaining near-duplicate implementations.
- Do not combine code merely because it looks similar. Avoid speculative frameworks or helpers with flags and special cases for unrelated uses.
- Keep logic local unless extraction improves clarity, reuse, testing, composition, or correctness, or hides meaningful complexity.
- Hide complex implementations behind small, clear interfaces. Expose only what callers need and keep internals private.
- Own validation, invariants, and state transitions at the appropriate boundary. Make correct usage easy and invalid states or operation sequences difficult to express.
- Fix root causes where they belong rather than adding workarounds at every call site. Never conceal failures by weakening validation or swallowing errors.

## Code Style

- Prefer correctness, readability, and consistency over mechanically applying rules.
- Use simple control flow: early returns for guards, `if` / `else` for paired decisions, and ternaries for simple conditional values.
- Prefer immutable values; reassign only for genuinely changing state.
- Introduce variables when they name an idea, remove repetition, or improve readability.
- Use short names locally and descriptive names across wider scopes. Keep object context visible unless destructuring clearly helps.
- Prefer collection transformations when they clarify data flow; use loops when simpler. Make filtering and validation explicit when later code relies on them.
- Rely on clear type inference. Add types at public boundaries or when they improve clarity; avoid broad or unchecked types except at genuinely unknown boundaries.
- Catch errors only to recover, add context, clean up, fall back, or translate them meaningfully.
- Comment on why, not what.

## Test What Matters

- Test meaningful behavior and contracts, not duplicated implementation logic. Each new test should catch a plausible failure that matters.
- Add regression coverage when it provides meaningful protection. Reuse existing coverage rather than adding redundant tests.
- Do not test incidental presentation details, such as a changed button color or CSS class, merely because they changed. Test them when they enforce a real requirement, such as accessibility or meaningful state.
- Use visual inspection when more appropriate for cosmetic changes.
- Prefer real dependencies when cheap, deterministic, and safe. Use mocks or fakes for slow, costly, nondeterministic, destructive, or external dependencies.
- Do not change tests merely to make failures disappear.

## Goal-Driven Execution

- Turn the request into observable success criteria before implementing.
- For multi-step work, give a brief plan pairing each step with its verification.
- Reproduce bugs before fixing them; verify invalid inputs for validation changes and preserve behavior during refactors.
- Work toward those criteria and verify the result. If a check fails, investigate and correct the cause rather than declaring completion.
- Review the final diff for unintended changes and run relevant checks.
- Report what changed, what was actually verified, and any remaining risks or verification gaps. Never claim checks passed unless they ran successfully.
