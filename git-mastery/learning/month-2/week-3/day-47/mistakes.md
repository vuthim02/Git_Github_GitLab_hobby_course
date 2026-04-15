# Day 47: Common Mistakes - Commit Conventions

## Mistake 1: Vague Messages

**Bad:**
```bash
git commit -m "fixed bug"
git commit -m "updates"
git commit -m "changes"
```

**Good:**
```bash
git commit -m "fix(auth): resolve login timeout after 5 minutes"
git commit -m "docs(api): add rate limiting documentation"
git commit -m "refactor(db): extract connection pooling"
```

---

## Mistake 2: No Type Prefix

**Bad:**
```bash
git commit -m "Added new feature"
git commit -m "Bug was fixed"
```

**Good:**
```bash
git commit -m "feat(auth): add OAuth2 support"
git commit -m "fix(api): handle null response in user endpoint"
```

---

## Mistake 3: Writing Novels

**Bad:**
```bash
git commit -m "I was working on the login feature and I noticed 
that when users enter their password incorrectly three times, 
the system doesn't lock their account. So I fixed it by adding
a new function that checks the login attempts and locks the
account after three failed attempts."
```

**Good:**
```bash
git commit -m "fix(auth): lock account after 3 failed login attempts"
```

---

## Mistake 4: Using Wrong Types

**Bad:**
```bash
git commit -m "feat: fixed typo in README"  # Not a feature!
git commit -m "fix: add validation"  # Not a fix!
```

**Good:**
```bash
git commit -m "docs: fix typo in README"
git commit -m "feat: add email validation"
```

---

## Lesson Learned

> "A good commit message tells a story. Make it clear, concise, and useful for the future."

**Rules:**
1. Use type prefix: `feat:`, `fix:`, `docs:`, etc.
2. Keep subject line under 72 characters
3. Use imperative mood: "add" not "added"
4. Body can have details, subject cannot
