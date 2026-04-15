# Day 15 Reflections: Git Remote Basics

## What I Learned Today

### Key Concepts

1. **Remote**: URL alias stored in Git config
2. **origin**: Default name for the main remote
3. **Remote-tracking branches**: Local copies of remote branches

### Commands Mastered

```bash
git remote -v              # List remotes
git remote add name url    # Add remote
git remote remove name     # Remove
git remote rename old new  # Rename
git remote set-url name url # Change URL
```

### Mental Model

```
.git/config contains:
[remote "origin"]
    url = https://github.com/user/repo.git
    fetch = +refs/heads/*:refs/remotes/origin/*

This means:
- origin = the URL
- origin/* = stored in refs/remotes/origin/
```

### HTTPS vs SSH

| Aspect | HTTPS | SSH |
|--------|-------|-----|
| Setup | Easy | Requires keys |
| Authentication | Token/Password | SSH key |
| URL format | https://... | git@... |

### Confidence Check (1-5)

- [ ] Understanding remotes: ____
- [ ] Adding remotes: ____
- [ ] Managing remotes: ____
- [ ] URL formats: ____

### Tomorrow's Preview

Day 16: Cloning & Fetching
- `git clone` - Copy entire repository
- `git fetch` - Download without merging
- Remote-tracking branches
