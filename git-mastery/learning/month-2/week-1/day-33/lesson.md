# Day 33: GitHub Actions Intro

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 33                                   ║
║                         GITHUB ACTIONS INTRO                                    ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand CI/CD concepts
- [ ] Learn GitHub Actions fundamentals
- [ ] Create your first workflow
- [ ] Run tests automatically
- [ ] Understand workflow syntax
- [ ] Debug failed workflows

---

## Video Reference

**Video**: [Git & GitHub Tutorial](https://youtu.be/RGOj5yH7evk)  
**Section**: CI/CD with GitHub Actions  
**Timestamps**: 30:00 - 60:00

---

## Theory: CI/CD Concepts

### What is CI/CD?

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           CI/CD OVERVIEW                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   CI = Continuous Integration                                               │
│   ├─ Frequently merge code changes                                         │
│   ├─ Automated testing on each commit                                       │
│   └─ Catch bugs early                                                      │
│                                                                             │
│   CD = Continuous Delivery                                                │
│   ├─ Automated release process                                            │
│   ├─ Deploy to staging/production                                        │
│   └─ Human gate for production                                           │
│                                                                             │
│   CD = Continuous Deployment                                             │
│   ├─ Fully automated release                                            │
│   └─ Deploys every change that passes tests                                 │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Why Use CI/CD?

1. **Catch bugs early** - Automated tests on every commit
2. **Reduce manual work** - No more manual testing
3. **Faster releases** - Automated deployment
4. **Better code quality** - Enforced standards
5. **Team collaboration** - Everyone knows build status

### Traditional vs CI/CD Workflow

```
TRADITIONAL:
Developer → Code → Manual Test → Manual Deploy → Production
                ↓              ↓              ↓
            Hours/Days     Manual QC     Manual Upload

CI/CD WORKFLOW:
Developer → Code → Automated Test → Automated Deploy → Production
                ↓              ↓                   ↓
            Minutes      Automated QC         One-click
```

---

## GitHub Actions Fundamentals

### What are GitHub Actions?

GitHub Actions is GitHub's **built-in CI/CD** service. It allows you to:
- Automate workflows
- Run tests
- Build and deploy applications
- Custom automation

### Key Concepts

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      GITHUB ACTIONS CONCEPTS                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   WORKFLOW                                                                 │
│   ├─ YAML file in .github/workflows/                                        │
│   ├─ Defines automation                                                     │
│   └─ Triggered by events (push, PR, etc.)                                 │
│                                                                             │
│   JOB                                                                       
│   ├─ Collection of steps                                                    │
│   ├─ Runs on a runner                                                       │
│   └─ Can run in parallel                                                   │
│                                                                             │
│   STEP                                                                     
│   ├─ Individual action or command                                             │
│   ├─ Runs sequentially within job                                            │
│   └─ Can use actions or shell commands                                      │
│                                                                             │
│   ACTION                                                                  
│   ├─ Reusable unit of code                                                  │
│   ├─ Can be custom or from marketplace                                     │
│   └─ Encapsulates a specific task                                          │
│                                                                             │
│   RUNNER                                                                    │
│   ├─ Server that runs workflows                                           │
│   ├─ GitHub-hosted or self-hosted                                           │
│   └─ Ubuntu, Windows, macOS available                                      │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Workflow File Structure

```yaml
name: Workflow Name

on:
  trigger_event:
    branches: [main]

jobs:
  job-name:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      
      - name: Setup environment
        uses: actions/setup-node@v4
        with:
          node-version: '20'
      
      - name: Install dependencies
        run: npm install
      
      - name: Run tests
        run: npm test
      
      - name: Build
        run: npm run build
```

---

## Creating Your First Workflow

### Step 1: Create Workflow Directory

```bash
mkdir -p .github/workflows
```

### Step 2: Create Workflow File

```bash
cat > .github/workflows/ci.yml << 'EOF'
name: CI Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v4
    
    - name: Setup Node.js
      uses: actions/setup-node@v4
      with:
        node-version: '20'
        cache: 'npm'
    
    - name: Install dependencies
      run: npm ci
    
    - name: Run linter
      run: npm run lint
    
    - name: Run tests
      run: npm test
    
    - name: Build
      run: npm run build
EOF
```

### Understanding the Workflow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      WORKFLOW EXECUTION FLOW                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   TRIGGER: Push to main                                                     │
│           │                                                                 │
│           ▼                                                                 │
│   ┌───────────────┐                                                        │
│   │   Job: build  │                                                        │
│   └───────┬───────┘                                                        │
│           │                                                                 │
│           ▼                                                                 │
│   Step 1: Checkout → Uses actions/checkout@v4                                │
│           ↓                                                                 │
│   Step 2: Setup Node → Uses actions/setup-node@v4                          │
│           ↓                                                                 │
│   Step 3: Install → npm ci                                                │
│           ↓                                                                 │
│   Step 4: Lint → npm run lint                                              │
│           ↓                                                                 │
│   Step 5: Test → npm test                                                  │
│           ↓                                                                 │
│   Step 6: Build → npm run build                                           │
│           ↓                                                                 │
│           ✓ Success OR X Failed                                           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Common Workflows

### Node.js Workflow

```yaml
name: Node.js CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    
    strategy:
      matrix:
        node-version: [18, 20, 22]
    
    steps:
    - uses: actions/checkout@v4
    
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v4
      with:
        node-version: ${{ matrix.node-version }}
        cache: 'npm'
    
    - name: Install dependencies
      run: npm ci
    
    - name: Run tests
      run: npm test
```

### Python Workflow

```yaml
name: Python CI

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    
    strategy:
      matrix:
        python-version: ['3.9', '3.10', '3.11']
    
    steps:
    - uses: actions/checkout@v4
    
    - name: Set up Python ${{ matrix.python-version }}
      uses: actions/setup-python@v5
      with:
        python-version: ${{ matrix.python-version }}
    
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
    
    - name: Run tests
      run: pytest
```

### Docker Workflow

```yaml
name: Docker CI

on:
  push:
    branches: [main]
    tags: ['v*']

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v4
    
    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v3
    
    - name: Login to Docker Hub
      uses: docker/login-action@v3
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}
    
    - name: Build and push
      uses: docker/build-push-action@v5
      with:
        context: .
        push: true
        tags: user/repo:latest,user/repo:${{ github.ref_name }}
```

---

## Workflow Triggers

### Common Triggers

```yaml
on:
  # Trigger on push to specific branches
  push:
    branches: [main, develop]
  
  # Trigger on PR to specific branches
  pull_request:
    branches: [main]
  
  # Trigger on release tags
  release:
    types: [published]
  
  # Trigger manually
  workflow_dispatch:
  
  # Trigger on schedule (cron)
  schedule:
    - cron: '0 0 * * *'  # Daily at midnight
```

### Branch Filtering

```yaml
on:
  push:
    branches:
      - main
      - 'feature/*'
      - 'bugfix/*'
    branches-ignore:
      - 'experimental/*'
```

### Path Filtering

```yaml
on:
  push:
    paths:
      - 'src/**'
      - 'tests/**'
      - 'package.json'
```

---

## Caching Dependencies

### Why Cache?

Caching speeds up workflows by reusing downloaded packages.

### NPM Cache

```yaml
- name: Setup Node
  uses: actions/setup-node@v4
  with:
    node-version: '20'
    cache: 'npm'  # Built-in cache
```

### pip Cache

```yaml
- name: Setup Python
  uses: actions/setup-python@v5
  with:
    python-version: '3.11'
    cache: 'pip'
```

### Custom Cache

```yaml
- name: Cache node modules
  uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-npm-
```

---

## Matrix Strategy

### Multiple Versions Testing

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18, 20, 22]
        operating-system: [ubuntu-latest, windows-latest]
    
    steps:
    - uses: actions/checkout@v4
    
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v4
      with:
        node-version: ${{ matrix.node-version }}
    
    - name: Install and test
      run: |
        npm ci
        npm test
```

This creates **6 jobs** (3 node versions × 2 OS).

---

## Environment Variables and Secrets

### Using Secrets

```yaml
steps:
  - name: Deploy
    run: npm run deploy
    env:
      API_TOKEN: ${{ secrets.API_TOKEN }}
      DEPLOY_URL: ${{ secrets.DEPLOY_URL }}
```

### Setting Environment Variables

```yaml
env:
  NODE_VERSION: '20'

steps:
  - name: Show version
    run: echo "Node version: $NODE_VERSION"
```

---

## Practice Exercises

### Exercise 1: Create Basic Workflow (20 min)

1. Create a new repository or use existing
2. Create `.github/workflows/ci.yml`
3. Add basic Node.js workflow
4. Push to trigger workflow
5. View results in Actions tab

```bash
mkdir -p .github/workflows

cat > .github/workflows/ci.yml << 'EOF'
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: '20'
    - run: npm ci
    - run: npm test
EOF

git add .
git commit -m "Add CI workflow"
git push
```

### Exercise 2: Add Multiple Jobs (25 min)

1. Add lint job
2. Add build job
3. Add test job
4. Make test job depend on build

```yaml
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: '20'
    - run: npm ci
    - run: npm run lint

  build:
    needs: lint
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: '20'
    - run: npm ci
    - run: npm run build

  test:
    needs: build
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: '20'
    - run: npm ci
    - run: npm test
```

### Exercise 3: Matrix Testing (20 min)

1. Add matrix for multiple Node versions
2. Test on [18, 20, 22]
3. View matrix results

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18, 20, 22]
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: ${{ matrix.node-version }}
    - run: npm ci
    - run: npm test
```

---

## Checklist

- [ ] I understand CI/CD concepts
- [ ] I know GitHub Actions key terms
- [ ] I can create a basic workflow
- [ ] I understand workflow structure
- [ ] I can use common actions
- [ ] I can debug failing workflows
- [ ] I understand triggers
- [ ] I can use matrix strategy

---

## Commands Reference

```bash
# No specific CLI commands - workflows are YAML files
# Managed via code review

# Common actions used:
actions/checkout@v4           # Checkout code
actions/setup-node@v4          # Setup Node.js
actions/setup-python@v5        # Setup Python
actions/cache@v4              # Cache dependencies
docker/login-action@v3         # Docker login

# View workflows:
# GitHub → Actions tab
```

---

## Reading References

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Understanding GitHub Actions](https://docs.github.com/en/actions/learn-github-actions)
- [Actions Marketplace](https://github.com/marketplace?type=actions)

---

## Tomorrow's Preview

**Day 34: Protected Branches**

Tomorrow you'll learn:
- Branch protection rules
- Required reviews
- Required status checks
- CODEOWNERS
- Enforcing rules

---

## Navigation

← [Day 32: Issues & Projects](../day-32/lesson.md) | [Dashboard](../../dashboard.md) | [Day 34: Protected Branches](../day-34/lesson.md) →

---

**Estimated Time**: 4 hours  
**Your Progress**: Day 33 of 56 (Week 5 - Day 5)  
**Next**: Protected Branches