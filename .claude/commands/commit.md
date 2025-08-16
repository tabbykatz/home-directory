# Commit Changes

You are tasked with committing changes in the current project repository. Follow these guidelines:

## Core Requirements

- Use conventional commit format (feat:, fix:, docs:, refactor:, test:, chore:)
- Always use `git push --force-with-lease` instead of `git push --force`
- Separate changes into logical commits if multiple distinct changes exist
- Run lint and typecheck commands before committing if available

## Process

1. Run `git status` and `git diff` to understand all changes
2. Analyze changes and group them logically:
   - New features (feat:)
   - Bug fixes (fix:)
   - Documentation updates (docs:)
   - Code refactoring (refactor:)
   - Tests (test:)
   - Maintenance tasks (chore:)
3. Create separate commits for each logical group
4. Write clear, concise commit messages focusing on "why" not "what"
5. Verify commits with `git log` and `git status`

## Commit Message Format

```
type: brief description

Optional longer explanation of what changed and why.
```

## Examples

- `feat: add user authentication system`
- `fix: resolve memory leak in connection pool`
- `docs: update API documentation for new endpoints`
- `refactor: extract utility functions to separate module`
- `test: add integration tests for payment flow`
- `chore: update dependencies to latest versions`

## Important Notes

- Never commit unless explicitly asked
- Check for sensitive information before committing
- If pre-commit hooks modify files, amend the commit to include those changes
- Do not push to remote unless explicitly requested
