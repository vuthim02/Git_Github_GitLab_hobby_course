# Day 9 Reflections: Creating & Switching Branches

## What I Learned Today

### Key Takeaways

1. **Two-Step Process**: Create branch, then switch
2. **One-Step Alternative**: `git switch -c` does both
3. **Switch Command**: `git switch` is newer and safer than `git checkout`
4. **Files Update**: Switching branches changes what files you see

### New Commands

```bash
git switch <branch>       # Switch branches
git switch -c <branch>    # Create and switch
git switch -              # Go to previous branch
```

### Mental Model Update

```
Before: Branches exist somewhere abstract
After:  HEAD pointer moves between branch pointers

.main → Commit A
.feature → Commit B

git switch feature
HEAD → feature → Commit B
```

### Comparison: Methods to Create & Switch

| Command | Creates | Switches |
|---------|---------|----------|
| `git branch + git switch` | Yes | Yes |
| `git switch -c` | Yes | Yes |
| `git checkout -b` | Yes | Yes |

### Aha Moments

- "The `-c` flag means 'create'"
- "Switching branches actually changes the files in my directory"
- "I can go back to where I was with `git switch -`"

### Confidence Check (1-5)

- [ ] Creating branches: ____
- [ ] Switching branches: ____
- [ ] Using `-c` flag correctly: ____
- [ ] Understanding file changes on switch: ____

### Tomorrow's Preview

Day 10: Understanding HEAD
- What exactly is HEAD?
- Detached HEAD state
- Why it matters
