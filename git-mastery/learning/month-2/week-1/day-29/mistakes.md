# Day 29: Common Mistakes - GitHub Repositories

## Mistake 1: Wrong Remote URL Format

**Wrong:**
```bash
git remote add origin username/repo
git push origin main
# Error: repository not found
```

**Right:**
```bash
# Use full HTTPS URL
git remote add origin https://github.com/username/repo.git

# Or full SSH URL
git remote add origin git@github.com:username/repo.git
```

**Why:** Git doesn't know how to interpret `username/repo` - it needs the full URL.

---

## Mistake 2: Pushing to Wrong Repository

**Problem:** You pushed commits to someone else's repository

**Signs:**
- Your commits show a different author
- You can't push anymore (permission denied)
- History shows unfamiliar commits

**Fix:**
```bash
# 1. Check current remote
git remote -v

# 2. Change to your repository
git remote set-url origin https://github.com/YOUR-USERNAME/repo.git

# 3. Verify
git remote -v
```

**Prevention:**
```bash
# Always check before pushing
git remote -v
git status
```

---

## Mistake 3: Forgetting to Set Upstream

**Error:**
```
fatal: The current branch main has no upstream branch.
```

**Why:** First push needs `-u` flag to set tracking

**Fix:**
```bash
git push -u origin main
# OR
git push --set-upstream origin main
```

**Prevention:** Remember: First push = `git push -u origin main`

---

## Mistake 4: Creating .gitignore After Commits

**Problem:** Sensitive files (node_modules, .env) already committed

**Wrong Approach:**
```bash
echo "node_modules" > .gitignore  # Too late!
git add .gitignore
git commit  # Files already tracked
```

**Right Approach:**
```bash
# BEFORE first commit, create .gitignore
echo "node_modules" > .gitignore
echo ".env" >> .gitignore
git add .gitignore
git commit -m "Add .gitignore"

# Remove already-tracked files
git rm -r --cached node_modules
git commit -m "Remove node_modules from tracking"
```

**Prevention:** Create `.gitignore` BEFORE `git add .`

---

## Mistake 5: Mixing Up origin and upstream

**Confusion:**
```
origin = ?
upstream = ?
```

**Clarification:**
```
origin    → YOUR fork of the repository
upstream  → The original repository (for syncing)
```

**Workflow:**
```bash
# You fork owner/original → YOUR_USERNAME/original (this is origin)

# Clone your fork
git clone https://github.com/YOUR_USERNAME/original.git
# This sets origin automatically

# Add upstream (the original)
git remote add upstream https://github.com/owner/original.git

# Fetch from original
git fetch upstream
```

---

## Mistake 6: Using Spaces in Repository Names

**Wrong:**
```bash
gh repo create "my project"  # Creates "my-project" (GitHub replaces spaces)
gh repo create my project    # ERROR: multiple arguments
```

**Right:**
```bash
gh repo create my-project  # No spaces, use hyphens
```

**Rule:** Repository names = lowercase + hyphens, no spaces

---

## Mistake 7: Wrong Visibility Setting

**Problem:** Created public repo when wanting private (or vice versa)

**Fix:**
```bash
# Create new repo with correct visibility
gh repo create my-private-repo --private

# If already created public by mistake:
# 1. Delete the repo (Settings → Danger Zone → Delete repository)
# 2. Recreate with correct visibility
```

**Or change visibility on existing repo:**
```bash
# Settings → Change visibility (Danger Zone)
# Or use CLI:
gh repo edit owner/repo --visibility private
```

---

## Mistake 8: Not Creating .gitignore at All

**Problem:** Pushing node_modules, build folders, etc.

**Consequences:**
- Massive repository size
- Slow clones
- Exposing secrets
- Merge conflicts with binary files

**Standard .gitignore templates:**

```bash
# Node.js
node_modules/
npm-debug.log*
yarn-debug.log*

# Python
__pycache__/
*.py[cod]
venv/
.env

# Java
target/
*.class

# macOS
.DS_Store

# IDE
.vscode/
.idea/
*.swp
```

Get templates: https://github.com/github/gitignore

---

## Mistake 9: Using Master Instead of Main

**Problem:** GitHub defaults to "main", but old repos use "master"

**Fix for existing repos:**
```bash
# Rename local branch
git branch -M main

# Push with new name
git push -u origin main

# Update GitHub default branch (Settings → Branches)
```

**Prevention:** Set `main` as default locally:
```bash
git config --global init.defaultBranch main
```

---

## Mistake 10: Forgetting to Push

**Scenario:** Worked on project for days, didn't push, computer crashes

**Prevention:**
```bash
# Good habit: Push at end of each day
git add .
git commit -m "Daily backup: work on feature X"
git push

# Even better: Use GitHub as backup
# Even better: Use multiple remotes
git remote add backup https://github.com/backup-account/repo.git
git push backup main
```

---

## Lesson Learned

> "GitHub is not just a backup - it's your development hub. Push early, push often."

**Golden Rules:**
1. Always set upstream on first push (`-u`)
2. Always verify remote URL before pushing
3. Create `.gitignore` before first commit
4. Push at least daily
5. Understand origin vs upstream in fork workflow
