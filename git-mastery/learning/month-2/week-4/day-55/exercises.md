# Day 55 Exercises: Git Hooks

## Exercise 1: Create Pre-Commit Hook (20 min)

### Objective
Create a hook that prevents console.log commits.

### Steps

1. **Create hook**
   ```bash
   cat > .git/hooks/pre-commit << 'EOF'
   #!/bin/bash
   
   if git diff --cached | grep -q "console.log"; then
       echo "ERROR: Remove console.log before committing"
       exit 1
   fi
   
   exit 0
   EOF
   chmod +x .git/hooks/pre-commit
   ```

2. **Test it fails**
   ```bash
   echo "console.log('debug')" > test.js
   git add test.js
   git commit -m "test"  # Should fail
   ```

3. **Test it passes**
   ```bash
   rm test.js
   git add test.js
   git commit -m "test"  # Should pass
   ```

### Success Criteria
- [ ] Hook created
- [ ] Blocks console.log
- [ ] Allows clean commits

---

## Exercise 2: Create Commit-Msg Hook (20 min)

### Objective
Enforce conventional commit format.

### Steps

1. **Create hook**
   ```bash
   cat > .git/hooks/commit-msg << 'EOF'
   #!/bin/bash
   
   msg=$(cat "$1")
   
   if ! echo "$msg" | grep -qE "^(feat|fix|docs|chore|test|refactor)\(.+\)*: .+"; then
       echo "ERROR: Commit must follow format:"
       echo "  type(scope): description"
       echo "Types: feat, fix, docs, chore, test, refactor"
       exit 1
   fi
   
   exit 0
   EOF
   chmod +x .git/hooks/commit-msg
   ```

2. **Test it fails**
   ```bash
   git commit -m "fixed stuff"  # Should fail
   ```

3. **Test it passes**
   ```bash
   git commit -m "fix(auth): resolve login bug"  # Should pass
   ```

### Success Criteria
- [ ] Hook created
- [ ] Rejects bad format
- [ ] Accepts good format

---

## Exercise 3: Set Up Husky (25 min)

### Steps

1. **Install**
   ```bash
   npm install husky --save-dev
   ```

2. **Initialize**
   ```bash
   npx husky install
   ```

3. **Add hook**
   ```bash
   npx husky add .husky/pre-commit "npm test"
   ```

4. **Verify**
   ```bash
   git add .husky
   git commit -m "chore: add husky hooks"
   ```

### Success Criteria
- [ ] Husky installed
- [ ] Hook created via husky
- [ ] Hook works

---

## Exercise 4: Create Pre-Push Hook (15 min)

### Objective
Run tests before push.

```bash
cat > .git/hooks/pre-push << 'EOF'
#!/bin/bash

echo "Running tests before push..."
npm test

if [ $? -ne 0 ]; then
    echo "Tests failed! Push aborted."
    exit 1
fi

echo "Tests passed!"
exit 0
EOF
chmod +x .git/hooks/pre-push
```
