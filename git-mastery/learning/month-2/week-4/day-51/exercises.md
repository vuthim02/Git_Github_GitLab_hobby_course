# Day 51 Exercises: Git Bisect

## Exercise 1: Find a Bug with Bisect (30 min)

### Objective
Use binary search to find which commit introduced a bug.

### Steps

1. **Start bisect**
   ```bash
   git bisect start
   ```

2. **Mark current state**
   ```bash
   git bisect bad  # Bug exists now
   ```

3. **Mark a known good state**
   ```bash
   # Use a tag or commit from before bug
   git bisect good v1.0.0
   ```

4. **Test and mark**
   ```bash
   # Git checks out middle commit
   # Test if bug exists
   git bisect good  # or git bisect bad
   ```

5. **Repeat until found**
   ```bash
   # Git will tell you which commit is the culprit
   ```

6. **End session**
   ```bash
   git bisect reset
   ```

### Success Criteria
- [ ] Started bisect correctly
- [ ] Identified buggy commit
- [ ] Reset bisect

---

## Exercise 2: Automate Bisect (25 min)

### Objective
Use a script to automate testing.

### Steps

1. **Create test script**
   ```bash
   cat > test.sh << 'EOF'
   #!/bin/bash
   # Test if bug exists
   npm test
   if [ $? -eq 0 ]; then
     exit 0  # Test passed = good
   else
     exit 1  # Test failed = bad
   fi
   EOF
   chmod +x test.sh
   ```

2. **Run bisect with script**
   ```bash
   git bisect start
   git bisect bad
   git bisect good v1.0.0
   git bisect run ./test.sh
   ```

3. **Result**
   - Git automatically tests each commit
   - Finds the bug commit
   - Reports result

### Success Criteria
- [ ] Created test script
- [ ] Ran automated bisect
- [ ] Found bug commit automatically
