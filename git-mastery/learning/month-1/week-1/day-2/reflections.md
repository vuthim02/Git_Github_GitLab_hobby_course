# Day 2 Reflections: Git Setup & Configuration

## What I Learned Today

### Key Takeaways

1. **Configuration Levels**
   - SYSTEM: All users on machine (lowest priority)
   - GLOBAL: Your user account (medium priority)
   - LOCAL: Current repository (highest priority)
   - Priority: LOCAL > GLOBAL > SYSTEM

2. **Git Identity**
   - user.name and user.email are REQUIRED before committing
   - Email links commits to your GitHub/GitLab account
   - Can use privacy email for GitHub

3. **Line Endings**
   - Windows uses CRLF (\r\n)
   - Linux/Mac uses LF (\n)
   - Configure core.autocrlf to prevent issues
   - Windows: true | Linux/Mac: input

4. **Aliases**
   - Shortcuts for long commands
   - Save time in daily work
   - Examples: st=status, co=checkout, lg="log --oneline"

### Commands Mastered

```bash
# Configuration
git config --global user.name "Name"
git config --global user.email "email"
git config --global core.editor "code --wait"
git config --global core.autocrlf true/input

# Aliases
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.lg "log --oneline --graph --all"

# Viewing
git config --list
git config --global --list
git config --show-origin user.name
cat ~/.gitconfig
```

### Mental Model: Configuration Levels

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         CONFIGURATION PRIORITY                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   LOCAL (.git/config)          ← HIGHEST (wins over everything)            │
│   Project-specific settings                                                  │
│                                                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   GLOBAL (~/.gitconfig)        ← MEDIUM (your personal settings)           │
│   Your preferences, applies to all your repos                              │
│                                                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   SYSTEM (/etc/gitconfig)       ← LOWEST (machine defaults)                  │
│   Applied to all users, requires admin rights                              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Aha Moments

- "My commit email is my identity in the project - it links all my commits together"
- "Using --global vs --local matters - local only affects ONE repo"
- "Line ending config prevents those annoying 'whole file changed' diffs"
- "Aliases are shortcuts, but I should know the full commands first"

### Questions to Explore Further

1. Can I have different identities for different projects (work vs personal)?
2. How does GitHub's email privacy actually work?
3. What's the difference between --system and --global?
4. Can I set configuration per remote?
5. How do I backup and restore my Git configuration?

### Tomorrow's Preview

**Day 3: Creating Your First Repository**

Tomorrow I'll learn:
- How `git init` works
- The .git directory structure
- What "tracking" means
- The difference between tracked and untracked files

### Confidence Check

Rate your understanding (1-5):
- [ ] Configuration levels: ____
- [ ] Setting up identity: ____
- [ ] Line ending config: ____
- [ ] Creating aliases: ____
- [ ] Viewing configuration: ____

## Practice Log

Today I practiced by:
1. ______________________________________
2. ______________________________________
3. ______________________________________

## Notes

- ______________________________________
- ______________________________________
- ______________________________________

## Configuration I Set Up Today

**My Git Identity:**
- Name: _________________________________
- Email: _________________________________

**My Editor:**
- Editor: _________________________________

**My Line Ending Setting:**
- Setting: _________________________________

**My Aliases:**
- _________________________________
- _________________________________
- _________________________________
