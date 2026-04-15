# Day 54 Exercises: Custom Aliases

## Exercise 1: Create Git Aliases (15 min)

### Steps

1. **Add aliases to ~/.gitconfig**
   ```bash
   git config --global alias.st "status -sb"
   git config --global alias.co "checkout"
   git config --global alias.br "branch"
   git config --global alias.lg "log --oneline --graph --decorate"
   ```

2. **Test them**
   ```bash
   git st
   git co main
   git br
   git lg
   ```

### Success Criteria
- [ ] Created at least 3 aliases
- [ ] Tested all aliases

---

## Exercise 2: Create Shell Aliases (15 min)

### Steps

1. **Add to ~/.bashrc or ~/.zshrc**
   ```bash
   echo 'alias gs="git status"' >> ~/.bashrc
   echo 'alias gp="git push"' >> ~/.bashrc
   echo 'alias gl="git pull"' >> ~/.bashrc
   ```

2. **Reload shell**
   ```bash
   source ~/.bashrc
   ```

3. **Test**
   ```bash
   gs
   gp
   gl
   ```

### Success Criteria
- [ ] Shell aliases work
- [ ] Persist after reload

---

## Exercise 3: Create Complex Alias (15 min)

### Create useful aliases

```bash
# Undo last commit (keep changes)
git config --global alias.undo "reset --soft HEAD~1"

# Amend without editing message
git config --global alias.fix "commit --amend --no-edit"

# Show staged changes
git config --global alias.diffs "diff --staged"

# All aliases with explanations
git config --global alias.list "config --get-regexp alias"
```

### Test them
```bash
git undo
git fix
git diffs
git list
```

### Success Criteria
- [ ] Complex aliases work
- [ ] Useful shortcuts created
