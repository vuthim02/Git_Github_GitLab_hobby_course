# Day 23 Checklist: Interactive Rebase

## Interactive Commands

| Command | Action |
|---------|--------|
| pick/p | Use commit as-is |
| reword/r | Change message |
| edit/e | Edit files |
| squash/s | Combine + edit message |
| fixup/f | Combine, discard message |
| drop/d | Remove commit |

## Usage

```bash
git rebase -i HEAD~3       # Last 3 commits
git rebase -i --root       # Include first commit
git rebase -i main        # Since main
```

## Common Operations

### Squash Multiple Commits
- [ ] Mark first as `pick`
- [ ] Mark others as `squash`

### Reorder Commits
- [ ] Simply reorder the lines

### Change Message
- [ ] Change to `reword`

### Split Commits
- [ ] Mark as `edit`
- [ ] `git reset HEAD~1`
- [ ] Make smaller commits

## Warnings

- [ ] Never rebase pushed commits
- [ ] Save work before interactive rebase
- [ ] Know how to abort

## Post-Lesson

- [ ] Can use interactive rebase
- [ ] Can squash commits
- [ ] Can reorder commits
- [ ] Ready for Day 24: Cherry-Picking
