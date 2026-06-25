# AGENTS.md

## Coding Approach

### Think Before Coding

Do not assume, hide confusion, or skip tradeoffs.

Before implementing:

- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them instead of choosing silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop, name what is confusing, and ask.

### Simplicity First

Write the minimum code that solves the problem. Avoid speculative work.

- Do not add features beyond what was asked.
- Do not add abstractions for single-use code.
- Do not add flexibility or configurability that was not requested.
- Do not add error handling for impossible scenarios.
- If 200 lines could be 50, rewrite it.
- Ask: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### Surgical Changes

Touch only what you must. Clean up only your own mess.

When editing existing code:

- Do not improve adjacent code, comments, or formatting unless needed for the task.
- Do not refactor things that are not broken.
- Match existing style, even if you would do it differently.
- If you notice unrelated dead code, mention it instead of deleting it.

When your changes create orphans:

- Remove imports, variables, and functions that your changes made unused.
- Do not remove pre-existing dead code unless asked.

Every changed line should trace directly to the user's request.

### Goal-Driven Execution

Define success criteria and loop until verified.

Transform tasks into verifiable goals:

- "Add validation" means write tests for invalid inputs, then make them pass.
- "Fix the bug" means write a test that reproduces it, then make it pass.
- "Refactor X" means ensure tests pass before and after.

For multi-step tasks, state a brief plan:

1. [Step] -> verify: [check]
2. [Step] -> verify: [check]
3. [Step] -> verify: [check]

## Code Style

Prefer correctness, consistency with surrounding code, and readability over applying rules mechanically.

Follow the style of nearby code unless it conflicts with correctness or clarity.

Write for clarity. Keep logic local until extraction improves reuse, naming, testing, or composition.

Use simple control flow. Prefer early returns for guards, and `if` / `else` for one paired decision.

Prefer immutable values. Use ternaries for simple conditional initialization; reassign only for real changing state.

Avoid temporary variables unless they name an idea, remove repetition, or improve readability.

Only catch errors when you can recover, add context, clean up, fall back, or convert them meaningfully.

Avoid broad or unchecked types except at true unknown boundaries.

Rely on inference when clear. Add explicit types, annotations, or schemas at public boundaries or when they improve readability.

Use short names for local obvious values; use descriptive names across wider scopes.

Keep object context visible. Prefer `user.name` over standalone `name` unless unpacking clearly reduces noise.

Prefer collection transformations when they make data flow clearer. Use loops when they are simpler.

Make validation or filtering explicit when it changes later assumptions.

Use the simplest standard tool that fits. Reach lower-level only when more control is needed.

Write comments to explain why, not to restate what.

## Testing

Test behavior, not duplicated implementation logic.

Avoid mocks when the real thing is cheap, deterministic, and safe. Use mocks or fakes for slow, costly, nondeterministic, destructive, or external dependencies.
