# Day 31: Code Reviews

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 31                                 ║
║                            CODE REVIEWS                                        ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand the importance of code reviews
- [ ] Learn to give effective feedback
- [ ] Master the art of constructive criticism
- [ ] Create review checklists
- [ ] Handle review feedback professionally

---

## Video Reference

**Video**: [Git & GitHub Tutorial](https://youtu.be/RGOj5yH7evk)  
**Section**: Code Review  
**Timestamps**: 120:00 - 150:00

---

## Theory: Code Reviews

### What is Code Review?

Code review is the **systematic examination of code** by someone other than the author to find defects, improve quality, and share knowledge.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           CODE REVIEW BENEFITS                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   FOR THE TEAM                                                              │
│   ├─ Catch bugs early                                                       │
│   ├─ Share knowledge                                                       │
│   ├─ Maintain code quality                                                 │
│   └─ Ensure consistency                                                    │
│                                                                             │
│   FOR THE AUTHOR                                                            │
│   ├─ Get fresh perspective                                                  │
│   ├─ Learn new techniques                                                   │
│   ├─ Improve skills                                                         │
│   └─ Validate approach                                                      │
│                                                                             │
│   FOR THE PROJECT                                                           │
│   ├─ Reduce technical debt                                                  │
│   ├─ Better documentation                                                   │
│   ├─ Security improvements                                                  │
│   └─ Multiple eyes on code                                                  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Why Code Reviews Matter

| Without Review | With Review |
|----------------|-------------|
| Bugs reach production | Bugs caught early |
| Knowledge silos | Shared understanding |
| Inconsistent code | Consistent patterns |
| Hard to onboard | Clear code standards |
| Security vulnerabilities | Security issues caught |

---

## The Code Review Process

### Step-by-Step

```
1. AUTHOR creates PR
       │
       ▼
2. REVIEWERS notified
       │
       ▼
3. REVIEWERS examine code
       │
       ▼
4. REVIEWERS leave feedback
       │
       ▼
5. AUTHOR addresses feedback
       │
       ▼
6. REVIEWERS approve
       │
       ▼
7. PR MERGED
```

### What to Review

**High Priority:**
- Business logic
- Security concerns
- Performance issues
- Edge cases
- Error handling

**Medium Priority:**
- Code structure
- Naming conventions
- Comments quality
- Test coverage

**Low Priority:**
- Style (use linters instead)
- Formatting (use formatters instead)
- Minor preferences

---

## Giving Effective Feedback

### The Feedback Framework

**Be specific:**
```
❌ Bad: "This code is wrong"
✅ Good: "The null check on line 42 doesn't handle the case 
        where user is undefined"

❌ Bad: "Should use a better variable name"
✅ Good: "Consider renaming 'x' to 'requestCount' for clarity"
```

**Explain why:**
```
❌ Bad: "Don't use ==, use ==="
✅ Good: "Using == here can cause type coercion bugs.
        Use === for strict equality."
```

**Suggest alternatives:**
```
❌ Bad: "This approach is bad"
✅ Good: "This approach has O(n²) complexity.
        Consider using a HashMap for O(1) lookups."
```

### Feedback Types

#### 1. Blocking (Must Fix)
```markdown
🔴 BLOCKING: This SQL query is vulnerable to injection.
The user input is directly concatenated into the query.
Must fix before approval.
```

#### 2. Non-Blocking (Consider)
```markdown
💡 CONSIDER: This could be simplified using Array.flatMap().
Not blocking, but might be cleaner.
```

#### 3. Question (Clarify)
```markdown
❓ QUESTION: Why do we need to check for both null and undefined here?
Is this handling a specific edge case?
```

#### 4. Nit (Minor)
```markdown
🐛 NIT: Missing semicolon (not enforced by linter, but good practice)
```

#### 5. Praise (Positive)
```markdown
✅ NICE: Great use of early return pattern here.
Makes the function easier to read.
```

---

## Review Checklist

### Functionality
- [ ] Does the code do what the PR claims?
- [ ] Are edge cases handled?
- [ ] Does it handle errors properly?
- [ ] Are there any security issues?

### Logic
- [ ] Is the logic correct?
- [ ] Are there potential bugs?
- [ ] Is the algorithm efficient?
- [ ] Are there race conditions?

### Readability
- [ ] Is the code easy to understand?
- [ ] Are variable/function names clear?
- [ ] Are comments helpful (not redundant)?
- [ ] Is the code well-structured?

### Testing
- [ ] Are there adequate tests?
- [ ] Do tests cover edge cases?
- [ ] Do tests actually test what they claim?
- [ ] Are tests maintainable?

### Maintainability
- [ ] Is the code DRY (Don't Repeat Yourself)?
- [ ] Are there code smells?
- [ ] Is the code testable?
- [ ] Are dependencies minimal?

---

## Handling Review Feedback

### As an Author

**Be open-minded:**
- Reviews are about code, not you
- The reviewer might be right
- You might have missed something

**Respond professionally:**
```
"Thank you for catching this! I've updated the code."

"Great suggestion. I applied it with a small modification because..."

"I understand your concern. Here's my reasoning for this approach..."
```

**Ask questions:**
```
"I'm not sure I understand. Could you explain what you mean by X?"

"What's the risk of the current approach?"
```

**Don't take it personally:**
```
"Wrong" → "Could be improved"
"Bad" → "Consider alternative"
"This is terrible" → "This might cause issue X"
```

### As a Reviewer

**Be kind:**
```
"This is a bit confusing" vs "This is wrong"
```

**Be constructive:**
```
"Would it be clearer to extract this into a function?" 
vs "Extract this"
```

**Be timely:**
```
Review within 24-48 hours
Don't let PRs sit for days
```

**Be thorough but focused:**
```
Focus on what matters
Don't block on minor preferences
```

---

## Practice Exercises

### Exercise 1: Review Your Own Code (15 min)

Before asking for review:

1. Review your own PR first
2. Read every line
3. Check for obvious issues
4. Test locally
5. Add comments explaining complex parts

```bash
# View your own diff
gh pr diff 123

# Check your own code
git diff main...HEAD

# Run tests
npm test  # or your test command
```

### Exercise 2: Code Review Practice (30 min)

Review someone else's code:

1. Clone the PR branch
2. Read the code thoroughly
3. Run the code if possible
4. Write constructive comments

```bash
gh pr checkout 123
git log --oneline -5
cat file.js  # Read the code
npm test     # Run tests
```

### Exercise 3: Create a Review Checklist (15 min)

Create your personal review checklist:

```markdown
# My Code Review Checklist

## Before Submitting PR
- [ ] Self-reviewed all changes
- [ ] Tests pass locally
- [ ] No console.log/debug code
- [ ] README updated (if needed)
- [ ] PR description complete

## When Reviewing Others
- [ ] Logic correctness
- [ ] Edge cases
- [ ] Security concerns
- [ ] Performance implications
- [ ] Code readability
```

---

## GitHub Review Features

### Review Comments vs Line Comments

**Line Comments:** Specific to a line of code
```bash
# Add comment on specific line
gh api repos/owner/repo/pulls/123/comments \
  --field body="Great job!" \
  --field commit_id=sha \
  --field path=file.js \
  --field line=42
```

**General Comments:** Overall feedback
```bash
gh pr comment 123 --body "Overall looks good!"
```

### GitHub Review Types

```bash
# Comment only
gh pr review 123 --comment --body "Feedback"

# Request changes (blocks merge)
gh pr review 123 --request-changes --body "Must fix this"

# Approve
gh pr review 123 --approve --body "LGTM"
```

### Using GitHub's Review UI

1. Go to PR on GitHub
2. Click "Files changed" tab
3. Hover over line number
4. Click "+" to add comment
5. Click "Start a review" for multiple comments
6. Submit review when done

---

## Code Review Anti-Patterns

### As a Reviewer

**Don't:**
- ❌ Be rude or dismissive
- ❌ Focus on style (use linters)
- ❌ Block for personal preferences
- ❌ Be overly critical
- ❌ Rush through reviews
- ❌ Approve without reading

### As an Author

**Don't:**
- ❌ Take feedback personally
- ❌ Argue without reason
- ❌ Push back on everything
- ❌ Ignore feedback
- ❌ Merge without addressing
- ❌ Get defensive

---

## Real-World Scenario

### Scenario: Bug Fix PR

**PR Description:**
> Fixes login timeout issue where users are logged out after 5 minutes.

**Review Process:**

1. **Reviewer checks if fix works:**
   - Read the code
   - Test locally if possible
   - Check if edge cases covered

2. **Reviewer checks for issues:**
   - Security: Any injection risks?
   - Performance: Any bottlenecks?
   - Logic: Any edge cases missed?

3. **Reviewer leaves feedback:**
   ```
   💡 CONSIDER: The timeout value is hardcoded.
   Consider moving to config for easier testing.

   ✅ NICE: Good use of early return.

   🔴 BLOCKING: This line doesn't handle null user.
   Need to add null check.
   ```

4. **Author addresses feedback:**
   ```bash
   # Fix the blocking issue
   git checkout -b fix-review
   # Make changes
   git add . && git commit -m "Fix null check issue"
   git push
   ```

5. **Reviewer approves:**
   ```bash
   gh pr review 123 --approve
   ```

---

## Checklist

- [ ] I understand why code reviews matter
- [ ] I can give constructive feedback
- [ ] I know the difference between blocking and non-blocking
- [ ] I can use GitHub's review features
- [ ] I can handle review feedback professionally
- [ ] I have a personal review checklist
- [ ] I understand what to look for in reviews

---

## Commands Reference

```bash
# Review PR
gh pr checkout 123          # Get PR locally
gh pr diff 123             # See changes
gh pr view 123             # View PR details

# Leave review
gh pr review 123 --comment --body "Feedback"
gh pr review 123 --request-changes --body "Must fix"
gh pr review 123 --approve --body "LGTM"

# General comment
gh pr comment 123 --body "General comment"
```

---

## Reading References

- [Google's Code Review Guide](https://google.github.io/eng-reviewex/)
- [GitHub: About Code Reviews](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews)
- [Code Review Best Practices](https://www.atlassian.com/blog/code-reviews/code-review-best-practices)

---

## Tomorrow's Preview

**Day 32: Issues & Projects**

Tomorrow you'll learn:
- Creating effective GitHub Issues
- Using GitHub Projects (Kanban boards)
- Milestones and labels
- Issue templates
- Tracking project progress

---

## Navigation

← [Day 30: Pull Requests Deep Dive](../day-30/lesson.md) | [Dashboard](../../dashboard.md) | [Day 32: Issues & Projects](../day-32/lesson.md) →

---

**Estimated Time**: 4 hours (1h learning, 2h practice, 1h review)  
**Your Progress**: Day 31 of 56 (Week 5 - Day 3)  
**Next**: Issues & Projects
