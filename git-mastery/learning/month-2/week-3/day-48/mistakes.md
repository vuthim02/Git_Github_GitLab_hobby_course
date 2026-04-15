# Day 48: Common Mistakes - Release Management

## Mistake 1: Releasing Untested Code

**Wrong:**
```bash
git tag v1.0.0
git push origin v1.0.0
# Tests were never run!
```

**Why it's wrong:**
- Bugs in production
- Users affected
- Hurts reputation

**Right:**
```bash
# Run all tests first
npm test
npm run e2e-test

# Then tag
git tag v1.0.0 -m "Release v1.0.0"
```

---

## Mistake 2: Forgetting to Update Version

**Wrong:**
```bash
git tag v1.0.0
# But package.json still says 0.9.0!
```

**Why it's wrong:**
- Version mismatch
- Confuses users
- Package registries get confused

**Right:**
```bash
# Update version first
npm version patch  # Updates package.json and creates tag

# Or manually:
# 1. Edit package.json
# 2. git add . && git commit -m "chore: bump version to 1.0.0"
# 3. git tag v1.0.0
```

---

## Mistake 3: Not Following Semver

**Wrong:**
```bash
# Just added a feature, but bumped MAJOR
git tag v2.0.0
# Now users expect breaking changes!
```

**Right:**
```bash
# New feature (backwards compatible) → MINOR
git tag v1.1.0

# Bug fix → PATCH
git tag v1.1.1

# Breaking changes → MAJOR
git tag v2.0.0
```

---

## Mistake 4: Forgetting to Push Tags

**Wrong:**
```bash
git tag v1.0.0
# Only pushed commits, not tags!
# CI/CD never triggered
```

**Right:**
```bash
# Push commits
git push

# Push tags
git push --tags
# OR
git push origin v1.0.0
```

---

## Lesson Learned

> "Releases are promises to users. Make sure they're tested, documented, and properly versioned."

**Golden Rules:**
1. Always test before tagging
2. Update version numbers consistently
3. Follow semantic versioning
4. Push tags to trigger CI/CD
5. Write clear release notes
