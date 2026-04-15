# Day 14: Week 2 Review

## Week 2 Summary

This week we mastered Git branching. Let's review everything we learned.

## Topics Covered

### Day 8: Introduction to Branching
- Branches are lightweight pointers to commits
- Enable parallel development
- Easy to create and delete

### Day 9: Creating & Switching Branches
- `git branch` - Create branches
- `git switch` - Switch branches
- `git switch -c` - Create and switch

### Day 10: Understanding HEAD
- HEAD points to current location
- Detached HEAD = HEAD at commit, not branch
- Always create branches to save detached work

### Day 11: Merging Basics
- Fast-forward: No divergence
- Three-way: Divergence exists
- Merge commits have two parents

### Day 12: Resolving Merge Conflicts
- Conflicts when Git can't auto-merge
- Manual resolution required
- Always remove conflict markers

### Day 13: Branching Workflows
- GitHub Flow: Simple, CD-focused
- GitFlow: Release-oriented
- Naming conventions: `type/description`

## Command Reference

```bash
# Branching
git branch              # List branches
git branch <name>       # Create branch
git switch <branch>     # Switch to branch
git switch -c <branch>  # Create and switch
git switch -            # Previous branch

# Merging
git merge <branch>      # Merge into current
git merge --no-ff       # Force merge commit
git merge --abort       # Cancel merge

# Conflicts
git status              # See conflicts
git diff                # View changes
git add <file>          # Stage resolved file
git commit              # Complete merge

# HEAD
cat .git/HEAD           # Check HEAD
git reflog              # HEAD history
```

## Video References

- [Git Tutorial for Beginners: Branching](https://youtu.be/zTjRZNkhiEU)
- [Git & GitHub Tutorial - Branching](https://youtu.be/8JJ101D3knE)
- [Git Branches Tutorial](https://youtu.be/RGOj5yH7evk)

## Practice Challenges

### Challenge 1: Full Workflow
1. Create repo with GitHub Flow structure
2. Feature branch → commits → merge
3. Another feature branch → merge
4. Show clean history

### Challenge 2: Conflict Resolution
1. Create conflicting changes
2. Resolve conflict
3. Complete merge
4. Show final graph

### Challenge 3: Recovery
1. Enter detached HEAD
2. Make commits
3. Save with new branch
4. Verify commits are safe

## Assessment Questions

1. What command creates a branch without switching to it?
2. What's the difference between `git switch` and `git checkout`?
3. When does fast-forward merge happen?
4. What are conflict markers?
5. What's HEAD?

## Week 3 Preview

Next week: Remote Collaboration
- Git remotes
- Cloning and fetching
- Push and pull
- GitHub and GitLab workflows

## Navigation

← [Day 13: Branching Workflows](../day-13/lesson.md) | [Week 3: Day 15 - Git Remote Basics](../week-3/day-15/lesson.md) →
