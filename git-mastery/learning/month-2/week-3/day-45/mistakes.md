# Day 45: Common Mistakes - GitLab Flow

## Mistake 1: Skipping Environment Branches

**Wrong:**
- Only using main
- No staging/production separation
- Deploying untested code to production

**Right:**
```
main → staging → production
       ↓
   All new features go through staging first
```

---

## Mistake 2: Not Following Promotion Process

**Wrong:**
- Merging directly to production
- Bypassing staging
- No promotion documentation

**Right:**
```
main → staging (test) → production (promote)
```

---

## Lesson Learned

> "GitLab Flow = GitHub Flow + environment branches + promotion process"

**Key Points:**
1. Use environment branches (staging, production)
2. Promote features through environments
3. Use GitLab CI/CD for automation
