# Day 54: Custom Aliases

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 54                                ║
║                          CUSTOM ALIASES                                    ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Create Git aliases
- [ ] Use shell aliases
- [ ] Organize aliases

---

## Theory: Git Aliases

### Creating Aliases

```bash
# Basic alias
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

# Full command alias
git config --global alias.unstage "reset HEAD --"

# Useful aliases
git config --global alias.last "log -1 HEAD"
git config --global alias.visualize "log --graph --oneline --all"
git config --global alias.undo "reset --soft HEAD~1"

# Log aliases
git config --global alias.lg "log --oneline --graph --all"
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
```

### Aliases in .gitconfig

```ini
[alias]
  st = status
  co = checkout
  br = branch
  ci = commit
  lg = log --oneline --graph --all
  undo = reset --soft HEAD~1
```

### Shell Aliases (Faster)

```bash
# In ~/.bashrc or ~/.zshrc
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gco="git checkout"
```

---

## Common Alias Categories

### Shortcuts
```bash
git config --global alias.s status
git config --global alias.a add
git config --global alias.c commit
```

### Undo
```bash
git config --global alias.undo "reset --soft HEAD~1"
git config --global alias.amend "commit --amend --no-edit"
```

### Logging
```bash
git config --global alias.hist "log --pretty=format:'%h %s' -20"
git config --global alias.today "log --since=midnight --author='name'"
```

---

## Reading References

### Git SCM Documentation
- [Git Config](https://git-scm.com/docs/git-config)
- [Customizing Git](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)

## Checklist

- [ ] Create Git aliases
- [ ] Use for productivity
- [ ] Organize systematically