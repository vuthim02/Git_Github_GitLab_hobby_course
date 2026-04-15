# Day 2 Checklist: Git Setup & Configuration

## Pre-Lesson Checklist

- [ ] Day 1 completed
- [ ] Git installed on your system
- [ ] Terminal/command prompt open
- [ ] Understanding of version control concepts

## Configuration Setup Checklist

- [ ] Set user.name globally
- [ ] Set user.email globally
- [ ] Set preferred text editor
- [ ] Configured line endings (autocrlf)
- [ ] Created at least 3 aliases

## Command Practice Checklist

- [ ] Ran `git config --global user.name "Your Name"`
- [ ] Ran `git config --global user.email "your@email.com"`
- [ ] Ran `git config --global core.editor "code --wait"`
- [ ] Tested editor with `git commit`
- [ ] Created aliases (st, co, br, ci)
- [ ] Ran `git config --list`
- [ ] Checked config file with `cat ~/.gitconfig`

## Understanding Verification

- [ ] I can explain the 3 configuration levels
- [ ] I know which level to use when
- [ ] I understand why email matters for GitHub
- [ ] I understand line ending issues
- [ ] I know how to view my configuration

## Post-Lesson Checklist

- [ ] All configuration commands worked
- [ ] Created meaningful aliases
- [ ] Verified configuration is saved
- [ ] Ready to move to Day 3: Creating Repositories

## Quick Reference

```bash
# Identity (REQUIRED)
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Editor
git config --global core.editor "code --wait"

# Line endings
git config --global core.autocrlf true    # Windows
git config --global core.autocrlf input   # Linux/Mac

# Aliases
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.ci "commit"

# View config
git config --list
git config --global --list
cat ~/.gitconfig
```

## Success Criteria

You are ready for Day 3 when you can:
1. Explain configuration levels (system, global, local)
2. Set up your Git identity from memory
3. Create useful aliases
4. Configure line endings for your OS
5. View and understand your configuration
