# Day 2: Git Setup & Configuration

```
← Previous: Day 1 | Day 2 | Next: Day 3 →
```

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                            LESSON OVERVIEW                                    ║
╚═══════════════════════════════════════════════════════════════════════════════╝

📅 Day 2 of 56
⏱️ Duration: 4 hours (1h learning, 2h practice, 1h debugging)
🎯 Goal: Configure Git properly for your development environment

┌─────────────────────────────────────────────────────────────────────────────┐
│  LEARNING PATH                                                              │
│  ├── Concept: Why configuration matters (15 min)                           │
│  ├── Concept: Configuration levels (30 min)                              │
│  ├── Hands-on: Setting your identity (30 min)                             │
│  ├── Hands-on: Editor configuration (15 min)                              │
│  ├── Hands-on: Aliases (30 min)                                           │
│  └── Practice & Exercises (90 min)                                         │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🎯 LEARNING OBJECTIVES

By the end of this lesson, you will:

- [ ] Understand why Git configuration is important
- [ ] Know the three levels of Git configuration
- [ ] Configure your Git identity (name and email)
- [ ] Set up your preferred text editor
- [ ] Create useful Git aliases
- [ ] Know where configuration is stored

---

## 📖 PART 1: WHY CONFIGURATION MATTERS

### The Problem Without Configuration

Imagine if everyone who committed to your project had different usernames:

```
commit 1a2b3c4d - "Alice" <alice@company.com>
commit 5e6f7g8h - "alice-smith" <alice.smith@gmail.com>
commit 9i0j1k2l - "Alice Smith" <a.smith@company.com>
```

**All from the same person!** This happens when Git isn't configured properly.

### What Configuration Controls

| Setting | Purpose | Example |
|---------|---------|---------|
| `user.name` | Your display name in commits | "John Doe" |
| `user.email` | Your email in commits | "john@example.com" |
| `core.editor` | Default editor for messages | "vim", "code --wait" |
| `core.autocrlf` | Line ending handling | "true", "input", false |
| `alias.*` | Custom command shortcuts | `ci` = `commit` |

---

## 📖 PART 2: CONFIGURATION LEVELS

Git has **three levels** of configuration, from broadest to narrowest:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│  LEVEL 1: SYSTEM (Lowest Priority)                                         │
│  ─────────────────────────────────────────────────────────────────────     │
│  Location:  /etc/gitconfig or C:\Program Files\Git\etc\gitconfig          │
│  Scope:     All users on this machine                                      │
│  Use:       System administrator sets defaults                             │
│  Command:   git config --system                                           │
│                                                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  LEVEL 2: GLOBAL (Medium Priority)                                         │
│  ─────────────────────────────────────────────────────────────────────     │
│  Location:  ~/.gitconfig or $HOME/.gitconfig                              │
│  Scope:     Your user account on this machine                              │
│  Use:       Your personal preferences                                      │
│  Command:   git config --global                                            │
│                                                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  LEVEL 3: LOCAL (Highest Priority)                                          │
│  ─────────────────────────────────────────────────────────────────────     │
│  Location:  ./.git/config                                                  │
│  Scope:     This specific repository only                                  │
│  Use:       Project-specific settings                                      │
│  Command:   git config --local (default when in repo)                     │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Priority Rule

```
LOCAL > GLOBAL > SYSTEM
```

When the same setting exists at multiple levels, **LOCAL wins**.

### Real-World Analogy

```
SYSTEM    = Default company policy (everyone follows)
GLOBAL    = Your personal preferences (overrides company)
LOCAL     = Project-specific rules (overrides all)
```

---

## 📖 PART 3: YOUR FIRST CONFIGURATION

### Setting Your Identity

This is the **most important** configuration. Every commit needs this.

```bash
# Set your name (--global applies to all repos for this user)
git config --global user.name "Your Name"

# Set your email
git config --global user.email "your.email@example.com"

# Verify configuration
git config --global user.name
git config --global user.email
```

**Example:**
```bash
git config --global user.name "John Doe"
git config --global user.email "john.doe@example.com"
```

---

### Why Your Email Matters

1. **Commits are tied to this email** - It's your identity in the project
2. **GitHub/GitLab use it** - Your commits link to your account
3. **It appears in logs** - Everyone sees who made what changes

### Email Privacy on GitHub

If you don't want your personal email exposed:

1. Create a GitHub-provided noreply email:
   - Go to GitHub Settings → Emails → Generate new email
2. Use that email in Git config:
   ```bash
   git config --global user.email "your-new-email@users.noreply.github.com"
   ```

---

## 📖 PART 4: EDITOR CONFIGURATION

### Why Configure an Editor?

Git opens an editor for:
- Writing commit messages
- Interactive rebase
- Merge conflict resolution

### Common Editor Options

| Editor | Command | Notes |
|--------|---------|-------|
| Vim | `vim` | Default on Linux, powerful but steep learning curve |
| Nano | `nano` | Simple, beginner-friendly |
| VS Code | `code --wait` | Popular, requires `--wait` flag |
| Sublime | `subl -n -w` | Cross-platform |
| Atom | `atom --wait` | GitHub's former editor |
| Notepad++ | `notepad++ -notabbar -nosession -noPlugin` | Windows only |

### Setting Your Editor

```bash
# For VS Code (recommended for beginners)
git config --global core.editor "code --wait"

# For Vim
git config --global core.editor vim

# For Nano
git config --global core.editor nano

# For Sublime
git config --global core.editor "subl -n -w"
```

### Testing Your Editor

```bash
# This opens your configured editor
git commit

# Write a message, save, and close the editor
# If using code --wait: Cmd/Ctrl+S to save, Cmd/Ctrl+W to close
```

---

## 📖 PART 5: LINE ENDING CONFIGURATION

### The Problem

Different operating systems use different characters to mark line endings:

| OS | Character | Name |
|----|------------|------|
| Windows | CRLF (`\r\n`) | Carriage Return + Line Feed |
| macOS (older) | CR (`\r`) | Carriage Return |
| Linux/macOS (modern) | LF (`\n`) | Line Feed |

### The Symptom

You edit a file on Windows, push to GitHub, and on Linux it shows every line as changed!

### The Solution

```bash
# FOR WINDOWS (recommended)
git config --global core.autocrlf true
# Converts LF → CRLF on checkout, CRLF → LF on commit

# FOR LINUX/MAC
git config --global core.autocrlf input
# Converts CRLF → LF on commit only

# FOR DEVELOPERS who NEVER edit on Windows
git config --global core.autocrlf false
# No conversion (risky if collaborating across OS)
```

### Recommended Settings

| OS | Setting |
|----|---------|
| Windows | `true` |
| macOS/Linux | `input` |

---

## 📖 PART 6: USEFUL ALIASES

### What Are Aliases?

Git aliases are shortcuts for long commands.

### Creating Aliases

```bash
# Simple aliases (shortcuts)
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.ci "commit"

# Now you can use:
git st    # instead of git status
git co    # instead of git checkout
git br    # instead of git branch
git ci    # instead of git commit
```

### Advanced Aliases

```bash
# View recent commits (one line each)
git config --global alias.lg "log --oneline --graph --all"

# View staged changes
git config --global alias.ds "diff --staged"

# Unstage a file (opposite of add)
git config --global alias.unstage "reset HEAD --"

# Show last commit
git config --global alias.last "log -1 HEAD"

# List all aliases
git config --get-regexp alias
```

### Testing Your Alias

```bash
git lg   # Should show pretty log graph
git st   # Should show status
```

---

## 📖 PART 7: VIEWING CONFIGURATION

### View Current Configuration

```bash
# View all global settings
git config --global --list

# View all settings (all levels)
git config --list

# View specific setting
git config --global user.name
git config --global user.email

# View where a setting comes from
git config --show-origin user.name
git config --show-origin user.email
```

### Example Output

```
file:/home/john/.gitconfig    user.name=John Doe
file:/home/john/.gitconfig    user.email=john@example.com
file:/home/john/.gitconfig    core.editor=code --wait
file:.git/config             remote.origin.url=https://github.com/...
```

---

## 📖 PART 8: EDITING CONFIGURATION MANUALLY

### View the Config File

```bash
# View global config file
cat ~/.gitconfig

# Or open in editor
code ~/.gitconfig    # VS Code
nano ~/.gitconfig    # Nano
vim ~/.gitconfig     # Vim
```

### Manual Config File Structure

```ini
[user]
    name = John Doe
    email = john@example.com

[core]
    editor = code --wait
    autocrlf = true

[alias]
    st = status
    lg = log --oneline --graph --all
    co = checkout
    br = branch
    ci = commit
```

---

## 🎬 VIDEO RECOMMENDATION

**Watch**: [Git Tutorial for Beginners](https://youtu.be/zTjRZNkhiEU) - Minutes 15:00 to 30:00

**Key points from video**:
- Git configuration setup
- Setting user identity
- First-time Git setup

---

## 💻 COMMANDS SUMMARY

| Command | Purpose |
|---------|---------|
| `git config --global user.name "Name"` | Set your name |
| `git config --global user.email "email"` | Set your email |
| `git config --global core.editor "editor"` | Set default editor |
| `git config --global core.autocrlf true/input/false` | Line ending handling |
| `git config --global alias.<name> "<command>"` | Create shortcut |
| `git config --list` | List all settings |
| `git config --global --list` | List global settings |
| `git config --show-origin <key>` | Show where setting is defined |

---

## ⚠️ COMMON ERRORS & FIXES

### Error 1: "Please tell me who you are"

```
*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
```

**Cause**: You haven't set your identity yet.

**Fix**: Run the two config commands above.

---

### Error 2: Editor opens but commits don't work

**Cause**: Editor didn't close properly, or you're in a non-Git directory.

**Fix**: 
- Make sure you save and close the editor
- Use `code --wait` for VS Code
- Check you're in a Git repository with `git status`

---

## 📝 KEY TAKEAWAYS

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  1. Configuration has 3 levels: SYSTEM < GLOBAL < LOCAL                   │
│  2. ALWAYS set user.name and user.email before committing                   │
│  3. Use --global for personal settings                                      │
│  4. Use --local for project-specific settings                              │
│  5. Your email links commits to your GitHub/GitLab account                 │
│  6. Line ending config (autocrlf) prevents cross-platform issues          │
│  7. Aliases save time but don't memorize them until you know the real cmd │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🎯 TOMORROW'S PREVIEW

**Tomorrow (Day 3)**: Creating Your First Repository

You will learn:
- How to create a new Git repository
- What happens when you run `git init`
- The structure of the `.git` directory
- The difference between tracked and untracked files

---

## ✅ DAY 2 CHECKLIST

Complete all tasks before moving to Day 3:

- [ ] Read and understood this lesson
- [ ] Set user.name globally
- [ ] Set user.email globally
- [ ] Set your preferred editor
- [ ] Configured line endings for your OS
- [ ] Created at least 3 useful aliases
- [ ] Verified configuration with `git config --list`
- [ ] Completed exercises
- [ ] Wrote reflection

---

## 📁 FILES FOR TODAY

| File | Location | Description |
|------|----------|-------------|
| Lesson | ./day-2/lesson.md | This file |
| Commands | ./day-2/commands.sh | All commands from today |
| Exercises | ./day-2/exercises.md | Practice tasks |
| Checklist | ./day-2/checklist.md | Your progress |
| Mistakes | ./day-2/mistakes.md | Common mistakes |
| Reflections | ./day-2/reflections.md | Your notes |

---

**Navigation**: ← Previous: [Day 1](./day-1/lesson.md) | [Dashboard](../../dashboard.md) | Day 2 | Next: [Day 3](./day-3/lesson.md) →
