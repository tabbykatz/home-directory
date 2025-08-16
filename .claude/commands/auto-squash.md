# Fixup and auto squash

1. **Stage all changes**: Run `git add .` to stage all modifications
2. **Find the target commit SHA**: Use `git log --oneline <file_path>` to find the SHA of the last commit that modified the file
3. **Edit the original commit message if needed**: If the currently staged changes meaningfully change the purpose or scope of the target commit, run `git commit --amend` to update the commit message accordingly. Otherwise, leave as-is.
4. **Create a fixup commit**: Run `git commit --fixup <SHA>` where `<SHA>` is the commit you want to squash into
5. **Perform autosquash rebase**: Run `git rebase -i --autosquash <SHA>~1` where `<SHA>~1` is the commit before your target commit
