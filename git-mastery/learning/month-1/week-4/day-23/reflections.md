# Day 23 Reflections: Interactive Rebase

## What I Learned Today

### Interactive Commands

| Command | Purpose |
|---------|---------|
| pick | Keep commit |
| squash | Combine + message |
| fixup | Combine, discard message |
| reword | Change message |
| edit | Stop for changes |
| drop | Remove commit |

### Common Use Cases

1. **Clean up WIP commits:**
   ```
   WIP → WIP → WIP → "Add login feature"
   ```

2. **Reorder commits:** Fix order before merge

3. **Edit messages:** Make them meaningful

### Commands

```bash
git rebase -i HEAD~n   # Last n commits
git rebase -i --root   # Include initial
```

### Key Insight

> "Interactive rebase gives you full control over commit history. You can make history look however you want."

### When to Use

- Before merging feature branches
- Clean up messy local commits
- Improve commit messages
- Remove unnecessary commits

### Confidence Check (1-5)

- [ ] Understanding interactive rebase: ____
- [ ] Squashing commits: ____
- [ ] Using other commands: ____
- [ ] Handling conflicts: ____

### Tomorrow's Preview

Day 24: Cherry-Picking
- Copy specific commits
- Apply commits to different branches
- Useful for backports
