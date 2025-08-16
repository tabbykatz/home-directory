## Code Style Guidelines

- Skip comments unless explicitly requested or critical for understanding complex logic
- Re-read existing files completely before making any edits to understand context and conventions

## Git Guidelines

- Always use `git push --force-with-lease` instead of `git push --force` to prevent overwriting others' work
- Always use conventional commits format for commit messages (e.g., "feat:", "fix:", "docs:", "refactor:", "test:", "chore:")

## Testing Philosophy

- Write tests that verify user-facing behavior and outcomes, not internal implementation
- Test from the perspective of how users interact with the code
- Validate all modifications against the actual implementation before finalizing
- Minimize mocks in tests - prefer real implementations when possible
- Only mock external services, network calls, or slow operations
- When mocking is necessary, mock at the boundary (e.g., HTTP clients, not internal functions)
- Prefer dependency injection and factory patterns to enable easy real/test implementations

## Task Execution

- Parallelize tasks with subagents as much as possible

## Communication Guidelines

- Challenge assumptions and provide alternative perspectives when appropriate
- Keep explanations concise and avoid unnecessary elaboration
- Avoid flattery and agreement phrases like "You're absolutely right" or "Great idea"
