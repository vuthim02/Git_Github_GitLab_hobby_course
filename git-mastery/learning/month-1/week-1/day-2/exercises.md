# Day 2: Exercises - Git Setup & Configuration

```
← Previous | Day 2 Exercises | Next: Day 3 →
```

---

## 🎯 EXERCISE SET 1: CONFIGURATION BASICS

### Exercise 1.1: View Current Configuration
**Task**: See what Git configuration you already have

```bash
# View all configuration
git config --list

# View global (user-level) only
git config --global --list
```

**Questions**:
1. Do you already have user.name set?
2. Do you already have user.email set?
3. What is your current core.editor?

---

### Exercise 1.2: Set Your Identity
**Task**: Configure your Git identity with your real name and email

```bash
# Set your name
git config --global user.name "Your Name"

# Set your email
git config --global user.email "your.email@example.com"

# Verify
git config --global user.name
git config --global user.email
```

**Expected Output**:
```
Your Name
your.email@example.com
```

---

## 🎯 EXERCISE SET 2: EDITOR CONFIGURATION

### Exercise 2.1: Set Your Preferred Editor
**Task**: Configure Git to use your favorite text editor

**Choose ONE based on your editor**:

```bash
# VS Code (recommended)
git config --global core.editor "code --wait"

# Vim
git config --global core.editor vim

# Nano
git config --global core.editor nano

# Sublime
git config --global core.editor "subl -n -w"

# Atom
git config --global core.editor "atom --wait"
```

**Verify**:
```bash
git config --global core.editor
```

---

### Exercise 2.2: Test Your Editor
**Task**: Test that your editor works with Git

```bash
# Create a test repo
mkdir -p ~/git-editor-test
cd ~/git-editor-test
git init

# Create a file and try to commit without message
echo "test content" > test.txt
git add test.txt
git commit
```

**Expected behavior**: Your editor should open. Type a commit message, save, and close.

**If using VS Code**: You should see "waiting for file closure" in terminal. Save and close the file tab.

---

## 🎯 EXERCISE SET 3: LINE ENDINGS

### Exercise 3.1: Configure Line Endings
**Task**: Set the appropriate line ending behavior for your OS

```bash
# For Windows
git config --global core.autocrlf true

# For Linux/macOS
git config --global core.autocrlf input

# Verify
git config --global core.autocrlf
```

---

### Exercise 3.2: Test Line Ending Configuration
**Task**: Verify line endings are handled correctly

```bash
# Create a test file with Unix line endings
echo -e "line1\nline2\nline3" > test-lines.txt

# Add to Git and check what happens
git add test-lines.txt
git diff --cached

# The output should show minimal changes
```

---

## 🎯 EXERCISE SET 4: ALIASES

### Exercise 4.1: Create Basic Aliases
**Task**: Create shortcuts for common Git commands

```bash
# Create common shortcuts
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.ci "commit"
git config --global alias.unstage "reset HEAD --"
```

---

### Exercise 4.2: Create Advanced Aliases
**Task**: Create more powerful aliases

```bash
# Pretty log graph
git config --global alias.lg "log --oneline --graph --all"

# Staged diff
git config --global alias.ds "diff --staged"

# Last commit
git config --global alias.last "log -1 HEAD"

# Visual graph
git config --global alias.visual "log --graph --oneline --all --decorate"
```

---

### Exercise 4.3: Test Your Aliases
**Task**: Use your new aliases

```bash
# Go to your test repo
cd ~/git-editor-test

# Use alias instead of full command
git st        # Should show same as git status
git lg        # Should show pretty log
git last      # Should show last commit
```

---

### Exercise 4.4: List All Aliases
**Task**: See all your custom aliases

```bash
git config --get-regexp alias
```

---

## 🎯 EXERCISE SET 5: CONFIGURATION LEVELS

### Exercise 5.1: Understand Configuration Priority
**Task**: Understand how configuration levels work

**Step 1**: Check system config (if you have access)
```bash
git config --system --list
```

**Step 2**: Check your global config
```bash
git config --global --list
```

**Step 3**: Create a local config in a repo
```bash
cd ~/git-editor-test
git config --local user.name "Local Name"
git config --local user.email "local@email.com"
```

**Step 4**: Verify LOCAL overrides GLOBAL
```bash
cd ~/git-editor-test
git config user.name        # Should show "Local Name"
cd ~
git config user.name        # Should show "Your Name"
```

---

### Exercise 5.2: Clean Up
**Task**: Remove the local config you just created

```bash
cd ~/git-editor-test
git config --local --unset user.name
git config --local --unset user.email

# Verify it's gone
git config user.name         # Should show your global name now
```

---

## 🎯 EXERCISE SET 6: CONFIG FILE EXPLORATION

### Exercise 6.1: View Your Config File
**Task**: Look at your global Git configuration file

```bash
# View the file
cat ~/.gitconfig

# Or open in your editor
code ~/.gitconfig
nano ~/.gitconfig
vim ~/.gitconfig
```

**Questions**:
1. What sections are in the file?
2. Are there any settings you didn't configure?
3. Can you read the format (it's INI-style)?

---

### Exercise 6.2: Edit Config File Manually
**Task**: Add a new configuration manually

**Open ~/.gitconfig in your editor and add**:

```ini
[alias]
    lg = log --oneline --graph --all
    
[color]
    ui = auto
```

**Save and verify**:
```bash
git config --list | grep -A2 alias
```

---

## 🎯 EXERCISE SET 7: TROUBLESHOOTING SCENARIOS

### Scenario 1: Wrong Identity
You accidentally set your email to "wrong@email.com". How do you fix it?

**Your answer**:
```bash
# Write the fix here
```

---

### Scenario 2: Wrong Editor
You set nano but want to use VS Code instead. How do you change it?

**Your answer**:
```bash
# Write the fix here
```

---

### Scenario 3: Can't Find Setting
You want to find where a setting is defined. What command do you use?

**Your answer**:
```bash
# Write the command here
```

---

## 🎯 EXERCISE SET 8: BONUS CHALLENGES

### Bonus 1: Color Configuration
**Task**: Enable colored output for better readability

```bash
git config --global color.ui auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.diff auto
```

**Test**: Run `git status` - you should see colored output.

---

### Bonus 2: Default Branch Name
**Task**: Set the default branch name for new repositories

```bash
# Modern standard
git config --global init.defaultBranch main
```

**Verify in a new repo**:
```bash
mkdir ~/test-default-branch
cd ~/test-default-branch
git init
cat .git/HEAD
```

**Should show**: `ref: refs/heads/main`

---

### Bonus 3: Push Default
**Task**: Set a safe default for push behavior

```bash
git config --global push.default simple
```

---

## 🧹 CLEAN UP

```bash
# Remove test directories
rm -rf ~/git-editor-test
rm -rf ~/git-config-test
rm -rf ~/test-default-branch

# Remove test files
rm -f test-lines.txt
```

---

## 📊 SUCCESS CRITERIA

Complete ALL of the following to pass Day 2:

| Exercise | Task | Completed |
|----------|------|-----------|
| 1.1 | View configuration | [ ] |
| 1.2 | Set identity | [ ] |
| 2.1 | Set editor | [ ] |
| 2.2 | Test editor | [ ] |
| 3.1 | Configure line endings | [ ] |
| 4.1 | Create basic aliases | [ ] |
| 4.2 | Create advanced aliases | [ ] |
| 4.3 | Test aliases | [ ] |
| 5.1 | Understand config priority | [ ] |
| 6.1 | View config file | [ ] |

---

**Navigation**: ← Previous: [Lesson](./lesson.md) | [Dashboard](../../dashboard.md) | Day 2 Exercises | Next: [Day 3](./day-3/lesson.md) →
