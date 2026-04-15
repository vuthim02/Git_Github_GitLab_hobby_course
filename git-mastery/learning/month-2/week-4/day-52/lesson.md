# Day 52: Submodules & Subtrees

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 52                                ║
║                         SUBMODULES & SUBTREES                             ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Use git submodules
- [ ] Use git subtrees
- [ ] Manage dependencies
- [ ] Choose between them

---

## Theory: Submodules

### What are Submodules?

Submodules let you include another repository as a subdirectory:

```
parent-repo/
├── .gitmodules
├── file.txt
└── other-repo/          ← It's a separate Git repo
    ├── .git          ← Has its own .git
    └── file.txt
```

### Adding Submodule

```bash
# Add submodule
git submodule add https://github.com/user/lib.git libs/lib

# Clone with submodules
git clone --recurse-submodules URL

# Update submodules
git submodule update --init
git submodule update --init --recursive
```

### Working with Submodules

```bash
# Pull changes in submodules
git submodule update --remote

# Make commits in submodule
cd libs/lib
git commit -m "Fix bug"
git push
# Back to parent
cd ..
git add libs/lib
git commit -m "Update lib"
```

---

## Subtrees

### Adding Subtree

```bash
# Add as subtree
git subtree add --prefix=lib https://github.com/user/lib.git main --squash

# Pull updates
git subtree pull --prefix=lib https://github.com/user/lib.git main --squash
```

### Subtrees vs Submodules

| Aspect | Submodules | Subtrees |
|--------|-----------|----------|
| Complexity | More | Less |
| History | Separate | Combined |
| Dependencies | Explicit | Copied |
| Updates | Manual | Pull |

---

## Reading References

### Git SCM Documentation
- [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [Subtree](https://git-scm.com/book/en/v2/Git-Tools-Advanced-Merging)

## Checklist

- [ ] Add submodules
- [ ] Manage submodules
- [ ] Use subtrees