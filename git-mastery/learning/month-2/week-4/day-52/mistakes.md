# Day 52: Common Mistakes - Submodules

## Mistake 1: Forgetting --recurse-submodules

**Problem:**
```bash
git clone repo
cd repo
ls  # Empty submodule folders!
```

**Solution:**
```bash
git clone --recurse-submodules repo
# OR
git submodule init
git submodule update
```

---

## Mistake 2: Editing Submodule Directly

**Wrong:**
```bash
cd libs/library
git checkout -b fix-my-bug
# Edit and commit
```

**Why it's wrong:**
- Changes are in the submodule repo
- Not tracked by parent repo
- Can get confusing

**Right:**
- Edit in submodule's own repo
- Push changes
- Update submodule in parent

---

## Mistake 3: Not Updating After Pull

**Problem:**
Submodule is old after pulling parent

**Solution:**
```bash
git submodule update --remote
# OR
git pull --recurse-submodules
```

---

## Lesson Learned

> "Submodules are repos inside repos. Remember to update them separately!"

**Key Points:**
1. Clone with `--recurse-submodules`
2. Update with `git submodule update`
3. Edit in the submodule repo, not the parent
