# Daily Challenge: Day 1 - Initialize & Commit

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                    CHALLENGE: INIT AND COMMIT                                 ║
║                         BEGINNER LEVEL                                       ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Scenario

You're starting a new project - a simple calculator. Initialize a Git repository and make your first commits with proper messages.

## Tasks

### Task 1: Initialize Repository (5 min)
```bash
# Create directory
mkdir calculator
cd calculator

# Initialize Git
git init

# Verify .git folder created
ls -la
```

### Task 2: First Commit (5 min)
```bash
# Create README
echo "# Calculator" > README.md

# Stage file
git add README.md

# Commit
git commit -m "Initial commit: Add README"
```

### Task 3: Multiple Commits (10 min)
```bash
# Create calculator.py
cat > calculator.py << 'EOF'
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b
EOF

# Stage and commit
git add calculator.py
git commit -m "feat: Add add and subtract functions"

# Modify file
cat > calculator.py << 'EOF'
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b
EOF

git add calculator.py
git commit -m "feat: Add multiply function"
```

### Task 4: View History (5 min)
```bash
# View commit history
git log
git log --oneline
git log --graph --oneline --all
```

## Expected Output

```
* abc1234 feat: Add multiply function
* def5678 feat: Add add and subtract functions
* 9012345 Initial commit: Add README
```

## Checklist

- [ ] Repository initialized
- [ ] 3 commits created
- [ ] Commit messages follow convention
- [ ] History viewable

## Bonus

Add a test file and commit it:
```bash
cat > test.py << 'EOF'
from calculator import add, subtract, multiply

def test_add():
    assert add(2, 3) == 5

def test_subtract():
    assert subtract(5, 3) == 2

def test_multiply():
    assert multiply(4, 3) == 12
EOF

git add test.py
git commit -m "test: Add unit tests"
```

## Solution

<details>
<summary>Click to reveal solution</summary>

```bash
# Full solution
mkdir calculator && cd calculator
git init
echo "# Calculator" > README.md
git add README.md
git commit -m "Initial commit: Add README"

cat > calculator.py << 'EOF'
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b
EOF
git add calculator.py
git commit -m "feat: Add add and subtract functions"

# ... (continue with tasks above)
```
</details>

---

**Next Challenge**: [Day 2: View History](./day-02.md)
