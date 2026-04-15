# Day 37 Exercises: GitLab Merge Requests

## Exercise 1: Create First MR (15 min)

1. Create a branch with changes
2. Push to GitLab
3. Create MR via web or CLI

```bash
git checkout -b feature/my-feature
echo "Hello GitLab MR" > feature.txt
git add . && git commit -m "Add feature"
git push -u origin feature/my-feature

# Via web, create MR
# Or: glab mr create --title "My feature"
```

## Exercise 2: Add Description (10 min)

1. Edit MR description
2. Add sections:
   - Summary
   - Changes
   - Testing
   - Related issue

## Exercise 3: Review MR (15 min)

1. View MR diff
2. Add line comment
3. Add general comment
4. Approve MR

## Exercise 4: Merge MR (10 min)

1. Ensure all checks pass
2. Approve if needed
3. Click Merge
4. Optionally delete branch

---

## Challenge: Complete MR Workflow (30 min)

1. Create feature branch on local
2. Make multiple commits
3. Push and create MR
4. Get review from another user (or self-review)
5. Merge
6. Delete branch

---

## Review Questions

1. What is a Merge Request?
2. How does MR differ from PR?
3. What is approval?
4. How do you merge?