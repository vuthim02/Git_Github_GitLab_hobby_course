# Day 55 Checklist: Git Hooks

## Pre-Lesson Checklist
- [ ] Day 54 completed
- [ ] Basic shell scripting knowledge
- [ ] Git repo with commits

## During Lesson Checklist
- [ ] Understood what Git hooks are
- [ ] Learned hook types
- [ ] Understood client vs server hooks
- [ ] Learned Husky

## Hook Creation Practice
- [ ] Created pre-commit hook
- [ ] Created commit-msg hook
- [ ] Created pre-push hook
- [ ] Used Husky

## Understanding Verification
- [ ] I understand when hooks run
- [ ] I can create a basic hook
- [ ] I can validate hook scripts
- [ ] I understand Husky benefits

## Post-Lesson Checklist
- [ ] Created working hooks
- [ ] Tested hook behavior
- [ ] Set up Husky
- [ ] Ready for Day 56: Final Assessment

## Quick Reference

```bash
# Hook locations
.git/hooks/

# Common hooks
pre-commit      # Before commit
commit-msg      # Commit message
post-commit     # After commit
pre-push        # Before push
post-push       # After push

# Make hook executable
chmod +x .git/hooks/hook-name

# Remove hook
rm .git/hooks/hook-name
```

## Success Criteria

You are ready for Day 56 when you can:
1. Explain what Git hooks are
2. Create at least one working hook
3. Understand hook types
4. Use Husky for hook management
