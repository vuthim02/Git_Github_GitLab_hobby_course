# Day 28: Week 4 & Month 1 Review

## Month 1 Summary

Congratulations! You've completed Month 1 of Git Mastery. Let's review everything.

## Week 4 Topics

### Day 22: Rebase Fundamentals
- Rebase replays commits on new base
- Creates linear history
- Can be dangerous on shared branches

### Day 23: Interactive Rebase
- `git rebase -i HEAD~n`
- Squash, reorder, edit commits
- Powerful history rewriting

### Day 24: Cherry-Picking
- Copy specific commits
- Useful for backports
- Creates new commit hashes

### Day 25: Stashing Changes
- `git stash` - Temporary shelf
- `git stash pop` vs `git stash apply`
- Manage multiple stashes

### Day 26: Reset vs Revert
- Reset rewrites history
- Revert adds safe commits
- Different use cases

### Day 27: Reflog & Recovery
- Safety net for mistakes
- Recover from any state
- Local and temporary

## Month 1 Complete Commands

### Branching
```bash
git branch <name>           # Create
git switch <branch>        # Switch
git switch -c <branch>    # Create + switch
```

### Merging
```bash
git merge <branch>         # Merge
git merge --no-ff         # Force merge commit
git merge --abort         # Cancel
```

### Remotes
```bash
git clone <url>            # Clone
git fetch                 # Fetch
git pull                  # Pull
git push                  # Push
git remote add upstream   # Add upstream
```

### Advanced
```bash
git rebase <branch>       # Rebase
git rebase -i HEAD~n     # Interactive
git cherry-pick <commit>  # Cherry-pick
git stash                # Stash
git reset <mode> <ref>   # Reset
git revert <commit>      # Revert
git reflog               # History
```

## Assessment

### Can you answer these?

1. What's the difference between merge and rebase?
2. When should you use cherry-pick vs merge?
3. What's the safest way to undo pushed commits?
4. How do you recover from a hard reset?
5. What's the difference between stash pop and apply?

## Practice Challenge

Create a complete Git workflow:
1. Create feature branch
2. Make commits
3. Rebase to clean up
4. Merge to main
5. Push to remote
6. Simulate mistake and recover

## What's Next?

Month 2 will cover:
- Advanced branching strategies
- Git hooks
- Bisect for debugging
- Submodules
- Git attributes
- Custom workflows

## Certificate of Completion

You now know:
- Git fundamentals
- Branching and merging
- Remote collaboration
- History rewriting
- Recovery techniques

**You've mastered Git basics!**

## Reading References

### Pro Git Book
- [Git Basics](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)
- [Git Branching](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)

### Video References
- [Git Tutorial for Beginners](https://youtu.be/zTjRZNkhiEU)
- [Git Full Course](https://youtu.be/8JJ101D3knE)

## Navigation

← [Day 27: Reflog & Recovery](../day-27/lesson.md) | [Month 2: Advanced Topics](../month-2/day-29/lesson.md) →
