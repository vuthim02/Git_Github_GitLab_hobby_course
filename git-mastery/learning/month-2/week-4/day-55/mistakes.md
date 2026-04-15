# Day 55: Common Mistakes - Git Hooks

## Mistake 1: Hook Not Executable

**Problem:**
```bash
cat > .git/hooks/pre-commit << 'EOF'
# Code
EOF
git commit  # Hook doesn't run!
```

**Solution:**
```bash
chmod +x .git/hooks/pre-commit
```

---

## Mistake 2: Wrong Shebang

**Problem:**
```bash
# Hook doesn't run
```

**Solution:**
```bash
#!/bin/bash
# OR
#!/usr/bin/env bash
```

---

## Mistake 3: Hook Runs on Wrong Branch

**Problem:**
Hook runs on all branches

**Solution:**
```bash
#!/bin/bash
branch=$(git symbolic-ref --short HEAD)
if [ "$branch" != "main" ]; then
    exit 0  # Skip for non-main branches
fi
```

---

## Mistake 4: Hooks Not Committed

**Problem:**
Hooks are local, not shared with team

**Solution:**
- Use Husky (commits hooks to repo)
- Document required hooks
- Use CI/CD for enforced checks

---

## Lesson Learned

> "Git hooks automate quality checks. Make them executable, test them, and share them with your team using Husky."

**Golden Rules:**
1. Always `chmod +x`
2. Test hooks before using
3. Use Husky for team sharing
4. Keep hooks fast
