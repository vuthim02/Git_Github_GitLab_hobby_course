# Day 30 Reflections: Pull Requests Deep Dive

## What I Learned Today

### Key Takeaways

1. **Pull Request Concept**
   - PR is a proposal to merge changes from one branch to another
   - It's a formal request for code review
   - Enables discussion before changes become permanent

2. **PR Creation**
   - Can be created via web, CLI (`gh pr create`), or URL after push
   - Draft PRs for work-in-progress
   - PR body should explain what, why, and how

3. **Merge Strategies**
   - **Merge commit**: Preserves all commits, creates merge commit
   - **Squash merge**: Combines all commits into one, clean history
   - **Rebase merge**: Replays commits on target, preserves individual commits

4. **Code Review Process**
   - Checkout PR locally with `gh pr checkout`
   - Review thoroughly before approving
   - Be constructive, not critical
   - Request changes when needed

5. **Best Practices**
   - Keep PRs small and focused
   - Write descriptive titles
   - Link PRs to issues
   - Delete branches after merge

### Commands Mastered

```bash
# Create PR
gh pr create --title "Title" --body "Description"
gh pr create --draft  # Work in progress

# View PR
gh pr list
gh pr view 123
gh pr diff 123

# Review
gh pr checkout 123
gh pr review 123 --approve
gh pr review 123 --request-changes --body "Feedback"

# Merge
gh pr merge 123
gh pr merge --squash 123

# Update PR
git fetch origin
git rebase origin/main
git push --force-with-lease
```

### Mental Model: PR Lifecycle

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           PR LIFECYCLE                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   1. CREATE          2. REVIEW           3. APPROVE         4. MERGE        │
│   ┌──────────┐      ┌──────────┐       ┌──────────┐      ┌──────────┐      │
│   │ Push     │ ───► │ Reviewer │ ───► │ Approve  │ ───► │ Merge    │      │
│   │ branch   │      │ comments │      │ changes  │      │ to main  │      │
│   └──────────┘      └──────────┘      └──────────┘      └──────────┘      │
│        │                 │                                     │          │
│        ▼                 ▼                                     ▼          │
│   ┌──────────┐      ┌──────────┐                          ┌──────────┐    │
│   │ Open PR  │      │ Changes  │                          │ Delete  │    │
│   │ on GitHub│      │ requested│                          │ branch  │    │
│   └──────────┘      └──────────┘                          └──────────┘    │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Merge Strategy Comparison

```
Strategy      │ History        │ Commits        │ Best For
──────────────┼────────────────┼────────────────┼────────────────────
Merge         │ Full history   │ All preserved  │ Team collaboration
Squash        │ Clean          │ Combined       │ Feature branches
Rebase        │ Linear         │ All preserved  │ Clean + history
```

### Aha Moments

- "PRs are conversations, not approvals"
- "A merge commit shows when work was integrated; squashing shows what work was done"
- "Using `--force-with-lease` instead of `--force` prevents accidentally overwriting others' work"
- "Draft PRs let you share work without triggering full review"

### Questions to Explore Further

1. How do CODEOWNERS files work with PRs?
2. What are GitHub's auto-merge features?
3. How do protected branches affect the PR workflow?
4. What are the best practices for large PRs?
5. How do teams handle PR velocity and bottlenecks?

### Tomorrow's Preview

**Day 31: Code Reviews**

Tomorrow I'll learn:
- Effective code review techniques
- Giving constructive feedback
- Handling review feedback gracefully
- Code review checklists
- Review as a team practice

### Confidence Check

Rate your understanding (1-5):
- [ ] Pull Request concept: ____
- [ ] Creating PRs: ____
- [ ] Merge strategies: ____
- [ ] Reviewing PRs: ____
- [ ] Syncing PRs with main: ____

## Practice Log

Today I practiced by:
1. ______________________________________
2. ______________________________________
3. ______________________________________

## Notes

- ______________________________________
- ______________________________________
- ______________________________________
