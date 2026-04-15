# Day 48 Exercises: Release Management

## Exercise 1: Semantic Versioning Practice (15 min)

### Identify the correct version for each scenario:

1. Fixed a bug in the login function → v1.0.___
2. Added new payment feature (backwards compatible) → v___.0.0
3. Changed the API response format (breaking) → v___.0.0
4. Updated documentation → v1.0.___
5. Refactored internal code (no external changes) → v___.0.0
6. Removed deprecated function → v___.0.0
7. Added optional parameter (backwards compatible) → v___.0.0
8. Fixed two bugs and added one minor feature → v___.___.___

### Success Criteria
- [ ] Understand MAJOR.MINOR.PATCH format
- [ ] Know when to increment each number

---

## Exercise 2: Create a Release (25 min)

### Steps

1. **Prepare for release**
   ```bash
   # Ensure all features are merged
   # Run tests
   npm test
   ```

2. **Update version number**
   ```bash
   # Edit package.json
   # "version": "1.1.0"
   
   # Or use a script
   npm version minor
   ```

3. **Create tag**
   ```bash
   git tag -a v1.1.0 -m "Release v1.1.0: Add payment feature"
   ```

4. **Push tag**
   ```bash
   git push origin v1.1.0
   ```

5. **Create GitHub Release**
   ```bash
   gh release create v1.1.0 \
     --title "Version 1.1.0" \
     --notes "## New Features
     - Add payment feature
     - Improve performance
     
     ## Bug Fixes
     - Fix login timeout"
   ```

### Success Criteria
- [ ] Tag created locally
- [ ] Tag pushed to remote
- [ ] GitHub Release created
- [ ] Release notes included

---

## Exercise 3: Generate Changelog (20 min)

### Task

Generate a changelog from git commits:

```bash
# Get commits since last release
git log v1.0.0..HEAD --oneline

# Group by type
git log v1.0.0..HEAD --format="%s" | grep -E "^(feat|fix|docs)"
```

### Create Release Notes:

```markdown
## Version 1.1.0 (Date)

### New Features
- _________________________________
- _________________________________

### Bug Fixes
- _________________________________
- _________________________________

### Breaking Changes
- _________________________________

### Other Changes
- _________________________________
```

---

## Exercise 4: Hotfix Release (20 min)

### Scenario
Critical bug found in production. Version is 1.1.0.

### Steps

1. **Create hotfix branch**
   ```bash
   git checkout v1.1.0
   git checkout -b hotfix/critical-bug
   ```

2. **Fix the bug**
   ```bash
   # Make fix
   git add . && git commit -m "fix: critical bug in production"
   ```

3. **Create hotfix tag (PATCH version)**
   ```bash
   git tag -a v1.1.1 -m "Hotfix v1.1.1: Critical bug fix"
   git push origin v1.1.1
   ```

4. **Create GitHub Release**
   ```bash
   gh release create v1.1.1 \
     --title "Hotfix v1.1.1" \
     --notes "Critical bug fix"
   ```

### Success Criteria
- [ ] Hotfix branch created
- [ ] PATCH version incremented
- [ ] Release created
