# Day 20: Common Mistakes - GitLab & Merge Requests

## Mistake 1: Confusing MR with PR

**Same thing, different names:**

| Platform | Name |
|----------|------|
| GitHub | Pull Request |
| GitLab | Merge Request |

## Mistake 2: Wrong Target Branch

**Wrong:** Merging into wrong branch

**Right:** Always verify source and target branches in MR

## Mistake 3: Not Requesting Reviews

**Wrong:** Merging without review

**Right:** Add reviewers to MR:
- Select reviewers in GitLab UI
- Or use `@username` in comments

## Mistake 4: Ignoring CI/CD Failures

**Wrong:** Merging despite failing pipeline

**Right:** Pipeline must pass:
- Green checkmark = passed
- Red X = failed
- Fix issues before merge

## Mistake 5: Forgetting to Update Fork

Same as GitHub:
```bash
git remote add upstream original-url
git fetch upstream
git merge upstream/main
```

## Lesson Learned

> "GitLab and GitHub are similar. PRs on GitHub, MRs on GitLab. The Git workflow is the same."

## GitLab Specifics

- **MR Description**: Markdown supported
- **Review**: Line-by-line comments
- **Merge**: Squash commits option
- **Pipeline**: Must pass to merge (if required)
