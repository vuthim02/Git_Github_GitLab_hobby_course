# Day 31 Checklist: Code Reviews

## Pre-Lesson Checklist

- [ ] Day 30 completed (Pull Requests)
- [ ] Understanding of PR workflow
- [ ] GitHub CLI installed
- [ ] GitHub account ready

## During Lesson Checklist

- [ ] Watched code review video
- [ ] Understood feedback types
- [ ] Learned review checklist
- [ ] Understood feedback frameworks

## Self-Review Practice

- [ ] Reviewed own code before PR
- [ ] Used `gh pr diff` to check changes
- [ ] Created self-review checklist
- [ ] Fixed issues found

## Reviewing Others

- [ ] Checked out someone else's PR
- [ ] Read code thoroughly
- [ ] Left constructive comments
- [ ] Distinguish blocking vs non-blocking

## Feedback Types

- [ ] Can identify blocking feedback
- [ ] Can write non-blocking suggestions
- [ ] Can ask clarifying questions
- [ ] Can give positive feedback

## Handling Feedback

- [ ] Received feedback professionally
- [ ] Responded to comments constructively
- [ ] Made requested changes
- [ ] Re-requested review

## GitHub Review Features

- [ ] Left line comments
- [ ] Left general comments
- [ ] Approved a PR
- [ ] Requested changes

## Understanding Verification

- [ ] I understand why code reviews matter
- [ ] I can give constructive feedback
- [ ] I know blocking vs non-blocking feedback
- [ ] I can handle feedback professionally
- [ ] I have my own review checklist

## Post-Lesson Checklist

- [ ] Completed all exercises
- [ ] Practiced reviewing code
- [ ] Created personal checklist
- [ ] Ready for Day 32: Issues & Projects

## Quick Reference

```bash
# Get PR for review
gh pr checkout 123

# View changes
gh pr diff 123
gh pr view 123

# Review types
gh pr review 123 --comment --body "Feedback"      # Comment
gh pr review 123 --request-changes --body "Fix"   # Block
gh pr review 123 --approve                         # Approve

# Comment
gh pr comment 123 --body "General comment"
```

## Feedback Framework

**Be SPECIFIC:**
```
❌ "This is wrong"
✅ "Line 42: null check needed for user object"
```

**Explain WHY:**
```
❌ "Don't use == "
✅ "== causes type coercion, use === for strict equality"
```

**Suggest ALTERNATIVES:**
```
❌ "This is bad"
✅ "Consider using Map for O(1) lookup"
```

## Success Criteria

You are ready for Day 32 when you can:
1. Give constructive code review feedback
2. Identify blocking vs non-blocking issues
3. Handle feedback professionally
4. Use GitHub review features
5. Create your own review checklist
