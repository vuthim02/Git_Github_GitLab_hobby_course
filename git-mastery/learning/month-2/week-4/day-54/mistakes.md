# Day 54: Common Mistakes - Custom Aliases

## Mistake 1: Overwriting Existing Commands

**Problem:**
```bash
git config --global alias.checkout "log"  # BAD!
# Now 'git checkout' shows log!
```

**Solution:**
- Use different names
- Keep original commands accessible

---

## Mistake 2: Aliases Too Short

**Problem:**
```bash
# Too short, forgettable
git config --global alias.s status
# What does 's' mean?
```

**Solution:**
- Use meaningful names
- Add comments explaining

---

## Mistake 3: Not Using --global Wisely

**Problem:**
Alias works in one repo but not others

**Solution:**
- Use `--global` for personal aliases
- Use `--local` for repo-specific aliases

---

## Lesson Learned

> "Good aliases save keystrokes and reduce friction. Make them memorable and meaningful."

**Golden Rules:**
1. Meaningful names
2. Don't overwrite built-ins
3. Use --global for personal aliases
4. Document complex aliases
