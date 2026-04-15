# Day 31: Common Mistakes - Code Reviews

## Mistake 1: Being Too Harsh

**Bad:**
```
"This code is terrible. Rewrite the whole thing."
"You clearly don't know what you're doing."
"This is the worst implementation I've seen."
```

**Why it's bad:**
- Makes author defensive
- Creates hostile environment
- Doesn't help improve code
- Damages team relationships

**Better:**
```
"This implementation has some issues. Here are my suggestions:
1. The algorithm here could be more efficient
2. Error handling is missing
3. Consider adding tests for edge cases"
```

---

## Mistake 2: Not Being Specific

**Bad:**
```
"This doesn't look right."
"I don't like this approach."
"Something is wrong here."
```

**Problem:** Author doesn't know what to fix.

**Better:**
```
"Line 42: The null check doesn't handle the case when userId 
is undefined. This could cause a TypeError.

Consider: if (!userId || typeof userId !== 'string')"
```

---

## Mistake 3: Focusing on Style (Not Using Linters)

**Bad:**
```
"Add a space before the curly brace."
"Use camelCase, not snake_case."
"Indent with 4 spaces, not 2."
```

**Why it's bad:**
- Linters should handle this
- Wastes review time
- Creates unnecessary back-and-forth
- Reviewers should focus on logic

**Better:**
```
"Consider adding ESLint/Prettier to enforce style consistently.
This would catch these issues automatically."
```

---

## Mistake 4: Not Explaining WHY

**Bad:**
```
"Don't use a for loop."
"Use a HashMap instead."
"Extract this to a separate function."
```

**Problem:** Author doesn't understand the reasoning.

**Better:**
```
"This for loop has O(n²) complexity when searching.

Consider using a HashMap for O(1) lookups:
- Build map: O(n)
- Each lookup: O(1)
- Total: O(n) instead of O(n²)

This will significantly improve performance for large datasets."
```

---

## Mistake 5: Giving Vague Praise

**Bad:**
```
"Looks good!"
"LGTM"
"Nice work"
```

**Why it's not ideal:**
- Doesn't reinforce good practices
- No learning opportunity
- Author doesn't know what specifically was good

**Better:**
```
"✅ Great job on this!

Key things I liked:
- Clean separation of concerns
- Good use of early returns
- Comprehensive error handling
- Clear variable naming

This sets a good example for the team."
```

---

## Mistake 6: Blocking on Personal Preference

**Bad:**
```
"I prefer using async/await over Promises."
"Use const instead of let."
"I don't like arrow functions."
```

**Why it's wrong:**
- Personal preference isn't a blocker
- Different developers have different styles
- Should use team conventions, not individual
- Creates unnecessary friction

**Better:**
```
"Not a blocker, but for consistency with the rest of the codebase,
you might consider [team convention]. However, your approach is 
also valid."
```

---

## Mistake 7: Not Reviewing Your Own Code

**Author:**
```
"Made changes, creating PR for review!"
```

**Problem:** Obviously missing things that should have been caught.

**Before asking for review:**
- [ ] Self-review all changes
- [ ] Run tests
- [ ] Check for obvious issues
- [ ] Read your diff as if you're a reviewer

---

## Mistake 8: Approving Without Thorough Review

**Reviewer:**
```
*LGTM!* (approved without really looking)
```

**Why it's problematic:**
- Defeats the purpose of code review
- Bugs can reach production
- Doesn't spread knowledge
- If something breaks, you're partly responsible

**Rule:** Only approve when you've actually reviewed.

---

## Mistake 9: Not Responding to Feedback

**Author:**
```
Reviewer: "Please fix X"
Author: *pushes code without addressing feedback*
Reviewer: "Did you see my comment?"
Author: *silence*
```

**Why it's bad:**
- Wastes reviewer's time
- Creates frustration
- Blocks the PR
- Unprofessional

**Better:**
```
"Thank you for the feedback. I've updated the code to address
your concerns. Let me know if you have other suggestions!"
```

---

## Mistake 10: Taking Feedback Personally

**Author:**
```
Reviewer: "This could be improved"
Author: "You think my code is bad? Maybe YOU should..."
```

**Why it's wrong:**
- Feedback is about code, not you
- Everyone writes imperfect code
- Reviewers are trying to help
- This attitude damages team dynamics

**Healthy response:**
```
"Thanks for catching that. I've updated the code and addressed
your concern. Let me know if you have other feedback!"
```

---

## Lesson Learned

> "Code review is a conversation about code, not a judgment of the coder. Be kind, be specific, and focus on improvement."

**Golden Rules:**
1. Be kind - criticism should be constructive
2. Be specific - vague feedback is useless
3. Explain why - help them learn
4. Focus on what matters - logic, security, correctness
5. Don't block on style - use linters
6. Review thoroughly - don't just approve
7. Respond professionally - address feedback
