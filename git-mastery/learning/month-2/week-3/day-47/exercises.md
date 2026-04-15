# Day 47 Exercises: Commit Conventions

## Exercise 1: Convert Messages to Conventional Format (20 min)

### Convert these bad commit messages to conventional format:

**Before 1:** "fixed that thing"
```
_________________________________________________
```

**Before 2:** "updated files and stuff"
```
_________________________________________________
```

**Before 3:** "I added some features to the login page and also fixed the bug"
```
_________________________________________________
_________________________________________________
```

**Before 4:** "oops typo"
```
_________________________________________________
```

### Success Criteria
- [ ] All messages follow `<type>: <description>` format
- [ ] Types are appropriate
- [ ] Descriptions are concise

---

## Exercise 2: Set Up Commitlint (25 min)

### Steps

1. **Install commitlint**
   ```bash
   npm install -D @commitlint/cli @commitlint/config-conventional
   ```

2. **Create config file**
   ```bash
   cat > commitlint.config.js << 'EOF'
   module.exports = {
     extends: ['@commitlint/config-conventional']
   };
   EOF
   ```

3. **Add to hooks (optional)**
   ```bash
   npm install -D husky
   npx husky add .husky/commit-msg 'npx --no -- commitlint --edit $1'
   ```

4. **Test it works**
   ```bash
   git commit -m "oops typo"  # Should fail
   git commit -m "fix(auth): resolve login bug"  # Should pass
   ```

### Success Criteria
- [ ] Commitlint installed
- [ ] Bad messages rejected
- [ ] Good messages accepted

---

## Exercise 3: Analyze Your Commit History (15 min)

### Task

Look at your recent commits and identify issues:

```bash
git log --oneline -20
```

**Issues to look for:**
1. Inconsistent capitalization
2. Missing type prefixes
3. Vague descriptions
4. Unnecessary detail
5. Typos

**List any issues you find:**
1. _________________________________
2. _________________________________
3. _________________________________
4. _________________________________
5. _________________________________

---

## Exercise 4: Create a Commit Convention Guide (20 min)

Create a `CONTRIBUTING.md` section on commit conventions:

```markdown
## Commit Message Format

<type>(<scope>): <description>

Types:
- feat: New feature
- fix: Bug fix
- docs: Documentation
- style: Formatting
- refactor: Code refactoring
- test: Adding tests
- chore: Maintenance

Examples:
- feat(auth): add password reset
- fix(api): handle null response
- docs(readme): update installation
```
