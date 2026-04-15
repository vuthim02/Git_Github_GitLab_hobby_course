# Day 17: Common Mistakes - Pulling & Merging

## Mistake 1: Pulling Without Fetching

**Wrong:** Expecting pull to update remote-tracking without fetch

**Reality:** Pull does fetch automatically, so this usually works.

## Mistake 2: Rebase on Public Commits

**Wrong:**
```bash
# Others have your commits
git pull --rebase
# This rewrites history others have!
```

**Right:** Only rebase commits that are local only.

## Mistake 3: Pull Conflicts and Panic

**Wrong:** Abandoning the process when conflicts occur

**Right:** Conflicts are normal. Resolve, stage, and continue:
```bash
git add file.txt
git rebase --continue  # For rebase
# or
git commit             # For merge
```

## Mistake 4: Not Understanding --ff-only

**Question:** What happens?

**Answer:** Fails if merge commit would be needed. Useful to prevent accidental merges.

## Mistake 5: Wrong Default Configuration

Set your preference globally:
```bash
git config --global pull.rebase false  # Default (merge)
git config --global pull.rebase true   # Rebase by default
```

## Lesson Learned

> "Pull is fetch + merge (or rebase). It downloads changes and integrates them in one step."

## Rebase Golden Rule

> "Never rebase commits that have been pushed to a shared repository."
