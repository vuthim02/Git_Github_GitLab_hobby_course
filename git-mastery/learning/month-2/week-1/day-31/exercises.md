# Day 31 Exercises: Code Reviews

## Exercise 1: Review Your Own Code (15 min)

### Objective
Learn to self-review before asking others.

### Steps

1. **Create a feature branch with intentional issues**
   ```bash
   cd pr-practice
   git checkout -b feature-for-review
   ```

2. **Make some changes with issues**
   ```bash
   # Create a file with issues
   cat > src/utils.js << 'EOF'
   // This has several issues for you to find
   function calculateTotal(items) {
       let total = 0;
       for (let i = 0; i < items.length; i++) {
           total = total + items[i].price;
       }
       return total;
   }

   function findUser(id) {
       return db.query("SELECT * FROM users WHERE id = " + id);
   }
   EOF
   git add . && git commit -m "Add utils"
   ```

3. **Review your own code like a reviewer**
   ```bash
   gh pr create --title "Add utils" --body "Review my code"
   gh pr diff 123
   ```

4. **List the issues you found:**
   - _________________________________
   - _________________________________
   - _________________________________

### Issues to Look For
- Security vulnerabilities
- Performance issues
- Error handling
- Code style
- Naming
- Comments

---

## Exercise 2: Practice Review Comments (20 min)

### Objective
Write various types of review comments.

### Scenario
Review this code and leave appropriate comments:

```javascript
// login.js
function login(email, password) {
    // Get user from database
    const user = db.query("SELECT * FROM users WHERE email = '" + email + "'");
    
    if (user.password === password) {
        return "success";
    }
    return "fail";
}
```

### Task: Write reviews for each issue

**Issue 1: SQL Injection**
Write a blocking comment:
```
_______________________________________________
_______________________________________________
_______________________________________________
```

**Issue 2: Password Comparison**
Write a blocking comment:
```
_______________________________________________
_______________________________________________
_______________________________________________
```

**Issue 3: Error Handling**
Write a suggestion comment:
```
_______________________________________________
_______________________________________________
_______________________________________________
```

---

## Exercise 3: Real PR Review (30 min)

### Objective
Review a real open source PR.

### Steps

1. **Find a popular repo with open PRs**
   ```bash
   gh pr list --repo facebook/react --state open --limit 5
   ```

2. **Pick a PR and checkout locally**
   ```bash
   gh pr checkout 12345
   ```

3. **Review the code thoroughly**
   ```bash
   # View commits
   git log main..HEAD --oneline
   
   # View changes
   git diff main...HEAD
   
   # View specific files
   cat package.json
   ```

4. **Run tests**
   ```bash
   npm test
   ```

5. **Leave constructive feedback**
   ```bash
   gh pr review 12345 --comment --body "Great work on this feature!"
   ```

### Success Criteria
- [ ] Checked out PR locally
- [ ] Read and understood the changes
- [ ] Ran tests
- [ ] Left constructive feedback

---

## Exercise 4: Create Review Checklist (15 min)

### Objective
Create a personal code review checklist.

### Create your checklist:

```markdown
# My Code Review Checklist

## Before Submitting (Self-Review)
- [ ] Read through all changes
- [ ] Ran all tests locally
- [ ] No console.log or debug code left
- [ ] Variables named clearly
- [ ] Comments explain WHY, not WHAT
- [ ] Error handling included
- [ ] Edge cases considered

## When Reviewing Others

### Functionality
- [ ] Code does what PR claims
- [ ] Edge cases handled
- [ ] Error handling present
- [ ] Security considerations

### Logic
- [ ] Algorithm is correct
- [ ] No obvious bugs
- [ ] Performance acceptable

### Readability
- [ ] Clear variable names
- [ ] Functions not too long
- [ ] Code self-documenting

### Tests
- [ ] Tests cover functionality
- [ ] Edge cases tested
- [ ] Tests are maintainable
```

Save this as `review-checklist.md` in your home directory or dotfiles.

---

## Exercise 5: Handle Review Feedback (20 min)

### Objective
Practice responding to review feedback professionally.

### Scenario
You've submitted a PR and received these comments:

**Comment 1:** "This function is too long. Consider splitting it up."

**Comment 2:** "Missing null check here. Will crash if user is undefined."

### Task: Respond and fix

**Response to Comment 1:**
```
_______________________________________________
```

**Response to Comment 2:**
```
_______________________________________________
```

**Fix the issues:**
```bash
git checkout -b fix-review-feedback
# Make the changes
git add . && git commit -m "Address review feedback"
git push
```

---

## Review Questions

1. What is the difference between blocking and non-blocking feedback?
   _______________________________________________

2. Name 3 things to look for in a code review:
   _______________________________________________
   _______________________________________________
   _______________________________________________

3. How do you checkout a PR locally for review?
   _______________________________________________

4. What should you do before asking others to review your code?
   _______________________________________________

5. How do you handle feedback you disagree with?
   _______________________________________________
