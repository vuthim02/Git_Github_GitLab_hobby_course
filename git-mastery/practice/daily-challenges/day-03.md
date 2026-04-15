# Daily Challenge: Day 3 - Branch Basics

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                    CHALLENGE: BRANCH BASICS                                  ║
║                         BEGINNER LEVEL                                       ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Scenario

You're developing a new feature for your calculator app. Create a feature branch and make commits on it.

## Setup

```bash
mkdir branch-practice
cd branch-practice
git init
echo "# Calculator" > README.md
git add . && git commit -m "Initial commit"
```

## Tasks

### Task 1: List Branches (2 min)
```bash
git branch
# Shows current branch (usually main)
```

### Task 2: Create Branch (3 min)
```bash
git branch feature-calculator
git branch  # Now shows both branches
```

### Task 3: Switch Branches (5 min)
```bash
git checkout feature-calculator
# Or in modern Git:
git switch feature-calculator
```

### Task 4: Create & Switch (3 min)
```bash
git checkout -b feature-tests
# One command to create AND switch
```

### Task 5: Make Commits on Branch (7 min)
```bash
cat > test.py << 'EOF'
def test_add():
    assert 2 + 3 == 5
EOF

git add test.py
git commit -m "test: Add unit tests"
```

### Task 6: Switch Back and Verify (3 min)
```bash
git checkout main
# Verify test.py doesn't exist
ls
# Or check with:
git branch -v
```

## Expected Output

```
* main
  feature-calculator
  feature-tests
```

## Checklist

- [ ] List branches
- [ ] Create branch
- [ ] Switch branches
- [ ] Create and switch
- [ ] Commit on branch
- [ ] Verify branch isolation

## Solution

<details>
<summary>Click to reveal</summary>

```bash
mkdir branch-practice
cd branch-practice
git init
echo "# Calculator" > README.md
git add . && git commit -m "Initial commit"

git branch feature-calculator
git checkout feature-calculator

cat > test.py << 'EOF'
def test_add():
    assert 2 + 3 == 5
EOF
git add test.py
git commit -m "test: Add unit tests"

git checkout main
ls  # test.py not visible
```
</details>

---

**Next Challenge**: [Day 4: Merge Branches](./day-04.md)
