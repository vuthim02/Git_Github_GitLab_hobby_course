# Error Tracking Log

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                              ERROR LOG TEMPLATE                              ║
║                        Document your Git mistakes and solutions               ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## 📝 HOW TO USE THIS LOG

1. **Every time** you encounter an error, document it here
2. Include the exact error message
3. Write what caused it (if you know)
4. Document how you fixed it
5. Review weekly to spot patterns

---

## 📊 ERROR STATISTICS

### Summary (Update Weekly)

| Week | Total Errors | New Errors | Repeated Errors | Resolved |
|------|-------------|------------|-----------------|----------|
| Week 1 | | | | |
| Week 2 | | | | |
| Week 3 | | | | |
| Week 4 | | | | |
| Month 1 Total | | | | |
| Week 5 | | | | |
| Week 6 | | | | |
| Week 7 | | | | |
| Week 8 | | | | |
| Month 2 Total | | | | |
| **Total** | | | | |

### Error Categories (Mark Off As You Learn)

- [ ] **Configuration** - user.email, user.name issues
- [ ] **Authentication** - SSH keys, credentials
- [ ] **Merge Conflicts** - conflicting changes
- [ ] **Detached HEAD** - working in wrong state
- [ ] **Lost Commits** - reset gone wrong
- [ ] **Push/Reject** - remote ahead of local
- [ ] **Permission Denied** - SSH/key issues
- [ ] **Unrelated Histories** - unrelated repos
- [ ] **Empty Repository** - nothing to commit/merge

---

## 🗂️ COMMON ERROR CATEGORIES

### Category 1: Configuration Errors

| Error | Cause | Solution | Reference |
|-------|-------|----------|----------|
| `Please tell me who you are` | No identity set | `git config --global user.email "you@example.com"` | [Fix](./fixes.md#config-error) |
| `User name and email must be set` | Incomplete config | Set both name and email | [Fix](./fixes.md#config-error) |
| Wrong identity on commits | Using wrong email | Re-set identity, amend if recent | [Fix](./fixes.md#change-identity) |

### Category 2: Repository Errors

| Error | Cause | Solution | Reference |
|-------|-------|----------|----------|
| `Not a git repository` | Not in a repo | `cd` to repo or `git init` | [Fix](./fixes.md#not-repo) |
| `Already exists` | Trying to init existing | Repo already exists, use it | [Info](./fixes.md#already-exists) |
| `.git directory missing` | Accidentally deleted | Recreate from remote or backup | [Fix](./fixes.md#missing-git) |

### Category 3: Staging & Committing Errors

| Error | Cause | Solution | Reference |
|-------|-------|----------|----------|
| `Nothing to commit` | No changes made | Make file changes first | [Info](./common-errors.md#nothing) |
| `Did not match any file(s)` | Wrong filename | Check with `git status` | [Fix](./fixes.md#pathspec) |
| `No message provided` | Empty commit message | Provide `-m "message"` | [Info](./common-errors.md#no-message) |

### Category 4: Branching Errors

| Error | Cause | Solution | Reference |
|-------|-------|----------|----------|
| `Detached HEAD` | Checked out commit, not branch | `git checkout <branch>` | [Fix](./fixes.md#detached) |
| `Already exists` | Branch name taken | Use different name or delete old | [Info](./common-errors.md#branch-exists) |
| `Cannot delete` | Branch has unmerged changes | Merge or use `-D` flag | [Fix](./fixes.md#branch-delete) |

### Category 5: Remote & Sync Errors

| Error | Cause | Solution | Reference |
|-------|-------|----------|----------|
| `Failed to push` | Remote has changes | `git pull --rebase` then push | [Fix](./fixes.md#push-rejected) |
| `Permission denied` | SSH key issue | Check SSH key setup | [Fix](./fixes.md#permission) |
| `Unrelated histories` | Different repos | `git merge --allow-unrelated-histories` | [Fix](./fixes.md#unrelated) |

### Category 6: Merge Conflict Errors

| Error | Cause | Solution | Reference |
|-------|-------|----------|----------|
| `Merge conflict` | Same lines changed | Resolve conflicts manually | [Fix](./fixes.md#merge-conflict) |
| `Automatic merge failed` | Unresolved conflicts | Fix conflicts and commit | [Fix](./fixes.md#merge-failed) |

---

## 📖 PERSONAL ERROR LOG

### Template for Each Error Entry

```
Date: YYYY-MM-DD
Day: Day X
Error: <paste exact error message>
Category: <from list above>
Cause: <what you think caused it>

What happened:
<describe the situation>

Solution:
<how you fixed it>

Prevention:
<how to avoid this in the future>

Time to resolve: <X minutes>
```

---

### Week 1 Errors

#### Error Entry #1

```
Date: 
Day: Day 
Error: 
Category: 
Cause: 

What happened:


Solution:


Prevention:

Time to resolve: 
```

#### Error Entry #2

```
Date: 
Day: Day 
Error: 
Category: 
Cause: 

What happened:


Solution:


Prevention:

Time to resolve: 
```

#### Error Entry #3

```
Date: 
Day: Day 
Error: 
Category: 
Cause: 

What happened:


Solution:


Prevention:

Time to resolve: 
```

*(Add more entries as needed)*

---

### Week 2 Errors

#### Error Entry #1

```
Date: 
Day: Day 
Error: 
Category: 
Cause: 

What happened:


Solution:


Prevention:

Time to resolve: 
```

*(Add more entries as needed)*

---

### Week 3 Errors

*(Continue pattern)*

---

### Week 4 Errors

*(Continue pattern)*

---

### Month 1 Summary

```
Total Errors: 
Most Common Error: 
Quickest Fix: 
Longest Fix: 
Lessons Learned:
1. 
2. 
3. 
```

---

### Week 5-8 Errors

*(Continue same pattern for Month 2)*

---

## 🏆 ERROR MASTERED CHECKLIST

Mark when you've successfully resolved an error type without looking at the reference:

- [ ] `Please tell me who you are` error
- [ ] `fatal: not a git repository`
- [ ] `nothing to commit, working tree clean`
- [ ] `detached HEAD` state
- [ ] Merge conflict
- [ ] `failed to push some refs`
- [ ] `permission denied (publickey)`
- [ ] Wrong branch
- [ ] Accidentally deleted commits
- [ ] Pushed wrong changes

---

## 📚 QUICK REFERENCE CARDS

### Emergency Commands

| Situation | Command |
|-----------|---------|
| Lost commit | `git reflog` → `git checkout <hash>` |
| Wrong branch | `git checkout <correct>` |
| Undo add | `git reset HEAD <file>` |
| Undo commit | `git reset --soft HEAD~1` |
| Undo push | `git push --force` (careful!) |
| Cancel merge | `git merge --abort` |
| Cancel rebase | `git rebase --abort` |

### Error → Quick Fix Map

| Error | One-Line Fix |
|-------|--------------|
| `Please tell me who you are` | `git config --global user.email "you@example.com"` |
| `not a git repository` | `cd` to the repository directory |
| `nothing to commit` | Make some changes to files first |
| `detached HEAD` | `git switch -` (go back) or `git checkout <branch>` |
| `push rejected` | `git pull --rebase && git push` |
| `merge conflict` | Edit file, remove markers, `git add` |

---

## 📋 WEEKLY ERROR REVIEW QUESTIONS

Ask yourself these each week:

1. What was my most common error?
2. What error took longest to fix?
3. Did I make the same mistake twice?
4. What should I do differently?
5. Do I understand WHY the error occurred?

---

**Navigation**:  
← [Dashboard](../dashboard.md) | [Roadmap](../roadmap.md) | [Quick Links](../quick-links.md) | Error Log | Next: [Weekly Review](./weekly-review.md) →

**See Also**:
- [Common Errors Reference](../debugging/common-errors.md)
- [Fixes Guide](../debugging/fixes.md)
