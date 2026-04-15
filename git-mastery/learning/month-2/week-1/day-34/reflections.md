# Day 34 Reflections: Protected Branches

## What I Learned Today

### Key Takeaways

1. **Branch Protection**
   - Prevents direct pushes to main
   - All changes via PR
   - Enforced rules on repository

2. **Required Reviews**
   - Must have approvals
   - Code owner reviews possible
   - Can dismiss stale

3. **Status Checks**
   - CI workflow must pass
   - Blocks merge until green
   - All tests enforced

4. **CODEOWNERS**
   - Defines ownership
   - Creates required reviewers
   - Based on file paths

### Commands Mastered

```bash
# No specific commands - Settings UI
# Working with protection:

# Create feature branch
git checkout -b feature/my-feature

# Push branch
git push -u origin feature

# Create PR
gh pr create --title "Feature" --body "Desc"

# Approve PR
gh pr review NUMBER --approve

# Merge PR
gh pr merge NUMBER
```

### Aha Moments

- "Protection makes quality mandatory"
- "CODEOWNERS automates review requests"
- "All work flows through PR"

### Tomorrow's Preview

**Day 35: Week 5 Review**

Review topics:
- GitHub Repositories
- Pull Requests
- Issues & Projects
- GitHub Actions
- Protected Branches

### Confidence Check

Rate your understanding (1-5):
- [ ] Branch protection: ____
- [ ] Configuring rules: ____
- [ ] CODEOWNERS: ____
- [ ] Quality gates: ____

## Practice Log

Today I practiced by:
1. ______________________________________
2. ______________________________________
3. ______________________________________

## Notes

- ______________________________________
- ______________________________________
- ______________________________________