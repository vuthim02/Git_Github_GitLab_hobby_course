# Day 2: Common Mistakes - Git Setup & Configuration

## Mistake 1: Not Setting Configuration Before Committing

**Error:**
```
*** Please tell me who you are.
Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
```

**Cause:** Git doesn't know who you are

**Fix:**
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

**Prevention:** Set identity immediately after installing Git

---

## Mistake 2: Using Different Email for Different Projects

**Problem:**
```bash
# Project A
git config user.email "personal@email.com"

# Project B  
git config user.email "work@company.com"
# Now commits have different authors!
```

**Cause:** Using local config without understanding levels

**Fix:** Decide on ONE email for all projects:
```bash
# Use global for your main email
git config --global user.email "your@email.com"

# Only use local for exceptional cases
git config --local user.email "project-specific@email.com"
```

---

## Mistake 3: Wrong Line Ending Settings

**Symptom on Windows:**
```
Warning: LF will be replaced by CRLF in file.txt
```

**Symptom on Linux/Mac:**
```
Every line shows as changed when pulling from Windows users
```

**Fix:**

For Windows:
```bash
git config --global core.autocrlf true
```

For Linux/Mac:
```bash
git config --global core.autocrlf input
```

---

## Mistake 4: Forgetting --global Flag

**Problem:**
```bash
# Set email (forgot --global)
git config user.email "work@company.com"

# Works in this repo
# But fails in other repos!
```

**Why it's wrong:** Without --global, config only applies to current repo

**Fix:** Be consistent
```bash
# Personal settings use --global
git config --global user.name "John Doe"
git config --global user.email "john@email.com"

# Project-specific only use --local
git config --local user.name "John (Work)"
```

---

## Mistake 5: Using Spaces in Alias Names

**Wrong:**
```bash
git config --global alias."git log" "log --oneline"
# ERROR: Alias names cannot contain spaces
```

**Right:**
```bash
git config --global alias.lg "log --oneline"
# Use camelCase or abbreviated names
```

---

## Mistake 6: Overwriting Existing Commands

**Problem:**
```bash
git config --global alias.checkout "log --oneline"
# Now 'git checkout' shows log!
# 'git switch' is the original checkout command
```

**Fix:** Never alias over built-in commands you use:
```bash
# Safe aliases
git config --global alias.st "status"
git config --global alias.lg "log --oneline"

# Risky - overwrites commands
# git config --global alias.checkout "..."
```

---

## Mistake 7: Not Using Privacy Email for GitHub

**Problem:**
```bash
git config --global user.email "mysecretemail@private.com"
# This email is now public on GitHub!
```

**Fix:** Use GitHub's noreply email:
1. GitHub Settings → Emails → Generate new email
2. Use that address:
```bash
git config --global user.email "12345678+username@users.noreply.github.com"
```

---

## Mistake 8: Thinking --system Affects All Users

**Wrong:**
```bash
git config --system user.name "Company Name"
# Only works if you have admin rights
# Affects ALL users on machine
```

**When to use --system:**
- System administrator setting defaults for all users
- You're on a shared machine
- You have sudo/admin rights

**For personal use:**
```bash
git config --global user.name "Your Name"
```

---

## Lesson Learned

> "Git configuration is the foundation. Set it up correctly once, and it serves you forever."

**Golden Rules:**
1. Set identity FIRST (before any commits)
2. Use --global for personal settings
3. Use --local for project-specific only
4. Configure line endings for your OS
5. Use meaningful aliases
6. Never alias over commands you use
