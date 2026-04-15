# Day 16: Common Mistakes - Cloning & Fetching

## Mistake 1: Clone Into Existing Directory

**Wrong:**
```bash
mkdir myproject
git clone https://... myproject
# Error if myproject has files
```

**Right:** Use empty directory or let Git create it:
```bash
git clone https://... myproject  # Git creates it
```

## Mistake 2: Thinking Fetch Updates Local Branches

**Wrong:** `git fetch` then expecting to see remote changes

**Right:** Fetch only updates remote-tracking branches:
```
origin/main updated ← But local main unchanged
```

You need to merge or rebase to incorporate changes.

## Mistake 3: Confusing Remote and Local

```
origin/main  ← Remote-tracking (read-only copy)
main         ← Local branch (your work)
```

## Mistake 4: Not Fetching Before Checking Status

**Wrong:** `git status` showing outdated info

**Right:** Fetch first to see current remote state:
```bash
git fetch origin
git status
```

## Mistake 5: Clone URL with Typos

**Wrong:**
```bash
git clone https://github.com/user/repo.gi  # Missing 't'
git clone https://guthub.com/user/repo.git # Typo
```

**Right:** Copy the URL directly from GitHub.

## Lesson Learned

> "Fetch downloads changes but doesn't integrate them. It updates your knowledge of the remote without changing your work."
