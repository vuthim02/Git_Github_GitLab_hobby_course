#!/bin/bash

# Day 46: Code Reviews Best Practices - Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║           Day 46: Code Reviews Best Practices - Commands           ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

echo "Code Review Best Practices:"
echo "----------------------------------------"
cat << 'EOF'
# 1. Be Kind and Constructive
gh pr review 123 --comment --body "Consider using [alternative approach]"
# NOT: "This is wrong"

# 2. Be Specific
# Point to exact line or function
gh pr review 123 --comment --body "Line 42: Consider handling null here"

# 3. Explain WHY
gh pr review 123 --comment --body "Using HashMap gives O(1) lookups vs O(n)"

# 4. Suggest Alternatives
gh pr review 123 --comment --body "You could use Array.flat() here"

# 5. Praise Good Work
gh pr review 123 --approve --body "✅ Great use of design patterns here!"
EOF
echo ""

echo "Review Checklist Commands:"
echo "----------------------------------------"
cat << 'EOF'
# List PRs needing review
gh pr list --reviewer @me --state open

# View PR details
gh pr view 123

# Checkout PR for thorough review
gh pr checkout 123

# Run tests locally
npm test  # or your test command

# Check coverage
npm run coverage
EOF
echo ""

echo "Effective Feedback Examples:"
echo "----------------------------------------"
cat << 'EOF'
# Blocking (Bug/Security)
"🔴 BLOCKING: SQL injection on line 45.
User input is concatenated directly.
Use parameterized queries."

# Non-blocking (Suggestion)
"💡 SUGGESTION: This could use Array.reduce() 
for cleaner code. Not blocking."

# Question
"❓ Why is this timeout 5 seconds?
Is this handling a specific edge case?"

# Praise
"✅ NICE: Clean abstraction here.
Easy to understand and extend."
EOF
