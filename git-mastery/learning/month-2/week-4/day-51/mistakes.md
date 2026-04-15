# Day 51: Common Mistakes - Git Bisect

## Mistake 1: Not Having Testable States

**Problem:**
Can't run tests or code doesn't compile

**Solution:**
- Create a simple test script
- Use automated tests
- Ensure code can run

---

## Mistake 2: Forgetting to Reset

**Problem:**
Stuck in bisect mode

```bash
# Stuck in bisect mode
git bisect start
git bisect bad
# ... forgot to finish
```

**Solution:**
```bash
git bisect reset
```

---

## Mistake 3: Wrong Good/Bad Marking

**Problem:**
Marked wrong commits as good/bad

**Solution:**
- Double-check before marking
- You can always start over

---

## Lesson Learned

> "Git bisect is like a game of 20 questions for code - binary search your way to the bug."

**Steps:**
1. Start bisect
2. Mark bad (current)
3. Mark good (known working)
4. Test and mark
5. Repeat
6. Reset when done
