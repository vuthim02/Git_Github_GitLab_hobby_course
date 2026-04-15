# Day 50: Common Mistakes - Debugging Commands

## Mistake 1: Using blame to Blame

**Wrong:**
```
"I found who broke it! Blame @john for line 42!"
```

**Why it's wrong:**
- blame is for finding context, not people
- Creates hostile environment
- Code is a team effort

**Right:**
```
"blame shows line 42 was changed in commit abc123.
Let me check that commit for context."
```

---

## Mistake 2: Not Using reflog

**Problem:**
Lost commits, can't find them

**Solution:**
```bash
git reflog
# Find the commit
git checkout abc123
```

**Always remember:** Git never loses commits, just might take reflog to find them.

---

## Mistake 3: Force Pushing After Reset

**Wrong:**
```bash
git reset --hard HEAD~3
git push --force
# Team's history is broken!
```

**Right:**
```bash
git reset --hard HEAD~3
git push --force-with-lease
# Safer: won't overwrite if others pushed
```

---

## Lesson Learned

> "Git blame is for finding context, not assigning blame."

**Golden Rules:**
1. Use blame for understanding, not accusing
2. Use reflog to recover lost work
3. Use bisect to find bugs systematically
4. Use stash when you need to switch context
