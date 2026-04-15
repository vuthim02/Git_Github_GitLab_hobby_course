# Day 51 Reflections: Git Bisect

## What I Learned Today

### Key Takeaways

1. **Git Bisect**
   - Binary search algorithm
   - Finds buggy commit efficiently
   - Automated or manual testing

2. **Process**
   - Start: `git bisect start`
   - Mark bad: `git bisect bad`
   - Mark good: `git bisect good <commit>`
   - Test and repeat
   - End: `git bisect reset`

3. **Automation**
   - `git bisect run <script>`
   - Script returns 0 = good, non-zero = bad

### Tomorrow's Preview

**Day 52: Submodules & Subtrees**

Tomorrow I'll learn:
- Managing nested repositories
- When to use submodules
- Submodule workflow

### Confidence Check

Rate your understanding (1-5):
- [ ] Git bisect process: ____
- [ ] Manual bisect: ____
- [ ] Automated bisect: ____

## Practice Log

Today I practiced by:
1. ______________________________________
