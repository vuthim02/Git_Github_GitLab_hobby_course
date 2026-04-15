# Day 27: Common Mistakes - Reflog & Recovery

## Mistake 1: Not Checking Reflog Before Panic

**Wrong:** Thinking commits are lost forever

**Right:** Always check reflog first:
```bash
git reflog
```

## Mistake 2: Forgetting Reflog is Local

**Wrong:** Expecting reflog to recover pushed commits after fetch

**Reality:** Reflog is local. After fetch, reflog only shows local operations.

## Mistake 3: Using Wrong Reflog Entry

**Question:** Which entry should I use?

**Answer:** HEAD@{n} where n is from oldest to newest.

```
HEAD@{0} = current position
HEAD@{1} = one step ago
HEAD@{2} = two steps ago
```

## Mistake 4: Reflog Not Backed Up

**Note:** Reflog is stored in `.git/logs/`

It's local and can be lost if:
- Repository deleted
- `.git` deleted
- Days pass beyond retention

## Lesson Learned

> "Reflog is Git's safety net. When you think you've lost work, check reflog first."

## Recovery Cheat Sheet

| Scenario | Command |
|----------|---------|
| Hard reset | `git reset --hard HEAD@{1}` |
| Lost branch | `git checkout -b branch abc123` |
| Bad rebase | `git reset --hard ORIG_HEAD` |
| Bad merge | `git reset --hard HEAD@{1}` |
