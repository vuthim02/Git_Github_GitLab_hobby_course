# Day 55: Git Hooks

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 55                                ║
║                           GIT HOOKS                                        ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand Git hooks
- [ ] Use client-side hooks
- [ ] Use server-side hooks
- [ ] Create custom hooks

---

## Theory: Git Hooks

### What are Hooks?

Git hooks are scripts that run at certain points in Git workflow:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    GIT WORKFLOW WITH HOOKS                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                             │
│   before-commit  →  git commit  →  after-commit             │
│        │                  │                   │                 │
│   pre-commit      post-commit         commit-msg            │
│   prepare-commit-msg                                            │
│                                                             │
│   ─────────────────────────────────────────────                │
│                                                             │
│   pre-push  →  git push  →  post-receive                    │
│        │         │            │                               │
│   pre-receive    post-receive                                │
│                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Client-Side Hooks

```bash
# In .git/hooks/
# - pre-commit: Before commit is recorded
# - prepare-commit-msg: Before commit message
# - commit-msg: After commit message
# - post-commit: After commit
# - pre-rebase: Before rebase
# - post-checkout: After checkout
# - post-merge: After merge
# - pre-push: Before push
```

### Server-Side Hooks

```bash
# In repo.git/hooks/
# - pre-receive: Before push
# - update: Per branch
# - post-receive: After push
```

### Creating Hooks

```bash
# Make executable
chmod +x .git/hooks/pre-commit

# pre-commit example
#!/bin/bash
# Check for debug code
if git diff --cached --name-only | xargs grep "console.log"; then
  echo "Remove console.log before committing"
  exit 1
fi

exit 0
```

### Husky (Pre-commit Tool)

```bash
# Install
npm install husky --save-dev

# Init
npx husky install

# Add hook
npx husky add .husky/pre-commit "npm test"
```

---

## Common Hook Uses

1. **Pre-commit**: Lint, test, format check
2. **Commit-msg**: Enforce commit message format
3. **Pre-push**: Run full test suite
4. **Post-commit**: Notifications

---

## Reading References

### Git SCM Documentation
- [Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
- [Hooks](https://git-scm.com/docs/githooks)

## Checklist

- [ ] Understand Git hooks
- [ ] Create pre-commit hooks
- [ ] Use husky