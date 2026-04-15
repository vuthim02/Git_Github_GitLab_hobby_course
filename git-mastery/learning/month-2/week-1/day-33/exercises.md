# Day 33 Exercises: GitHub Actions Intro

## Exercise 1: Create Your First Workflow (20 min)

### Objective
Create and trigger a basic CI workflow.

### Steps

1. **Create directory**
   ```bash
   mkdir -p .github/workflows
   ```

2. **Create workflow file**
   ```bash
   cat > .github/workflows/ci.yml << 'EOF'
   name: CI Pipeline

   on: [push, pull_request]

   jobs:
     build:
       runs-on: ubuntu-latest
       
       steps:
       - uses: actions/checkout@v4
       
       - name: Setup Node.js
         uses: actions/setup-node@v4
         with:
           node-version: '20'
       
       - name: Install dependencies
         run: npm ci
       
       - name: Run tests
         run: npm test
   EOF
   ```

3. **Commit and push**
   ```bash
   git add .github/
   git commit -m "Add CI workflow"
   git push
   ```

4. **View results**
   - Go to Actions tab
   - See workflow running
   - Wait for completion

### Success Criteria
- [ ] Workflow created
- [ ] Pushes trigger workflow
- [ ] Can view run in Actions tab
- [ ] Tests run successfully

---

## Exercise 2: Add Multiple Jobs (25 min)

### Objective
Create workflow with lint, build, and test jobs.

### Steps

1. **Create workflow with dependencies**
   ```bash
   cat > .github/workflows/ci.yml << 'EOF'
   name: CI Pipeline

   on: [push, pull_request]

   jobs:
     lint:
       runs-on: ubuntu-latest
       steps:
       - uses: actions/checkout@v4
       - uses: actions/setup-node@v4
         with:
           node-version: '20'
           cache: 'npm'
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
           cache: 'npm'
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
           cache: 'npm'
       - run: npm ci
       - run: npm test
   EOF
   ```

2. **Push and watch**
   ```bash
   git add .github/
   git commit -m "Add multi-job workflow"
   git push
   ```

3. **View job flow**
   - Actions tab → Select run
   - See jobs run sequentially
   - Click each job for details

### Success Criteria
- [ ] Lint job runs first
- [ ] Build waits for lint
- [ ] Test waits for build
- [ ] Can view each job separately

---

## Exercise 3: Matrix Strategy (20 min)

### Objective
Test multiple Node.js versions.

### Steps

1. **Create matrix workflow**
   ```bash
   cat > .github/workflows/ci.yml << 'EOF'
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
   EOF
   ```

2. **Push and view**
   ```bash
   git add .github/
   git commit -m "Add matrix testing"
   git push
   ```

3. **Check results**
   - Each node version runs separately
   - View all 3 results in Actions tab

### Success Criteria
- [ ] 3 separate jobs created
- [ ] Each Node version tested
- [ ] All pass/fail visible

---

## Exercise 4: Cache Dependencies (15 min)

### Objective
Speed up workflow with caching.

### Steps

1. **Add cache to workflow**
   ```bash
   # Look at Exercise 1, add cache: 'npm' or cache: 'pip'
   # The setup-node and setup-python actions have built-in caching
   ```

2. **Run workflow twice**
   - First run: No cache
   - Second run: Uses cache

3. **Compare times**
   - First run: ~2-3 minutes
   - Second run: ~30 seconds

### Success Criteria
- [ ] Cache is used on second run
- [ ] Noticeable speed improvement
- [ ] Cache key in logs

---

## Exercise 5: Build and Deploy (25 min)

### Objective
Create a workflow that builds and "deploys" (simulated).

### Steps

1. **Create deploy workflow**
   ```bash
   cat > .github/workflows/deploy.yml << 'EOF'
   name: Build and Deploy

   on:
     push:
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
       
       - name: Install and build
         run: |
           npm ci
           npm run build
       
       - name: Upload build artifacts
         uses: actions/upload-artifact@v4
         with:
           name: build-output
           path: dist/

     deploy:
       needs: build
       runs-on: ubuntu-latest
       steps:
       - name: Download artifacts
         uses: actions/download-artifact@v4
         with:
           name: build-output
       
       - name: Deploy (simulated)
         run: |
           echo "Deploying to production..."
           echo "Files ready: $(ls -la)"
   EOF
   ```

2. **Push and test**
   ```bash
   git add .github/
   git commit -m "Add deploy workflow"
   git push
   ```

### Success Criteria
- [ ] Build job completes
- [ ] Deploy job waits for build
- [ ] Artifacts used correctly

---

## Exercise 6: Debug Failing Workflow (20 min)

### Objective
Learn to debug common workflow failures.

### Scenario

Create a workflow with intentional errors, then fix them:

1. **Wrong Node version**
   ```yaml
   # This will fail - version not valid
   - uses: actions/setup-node@v4
     with:
       node-version: '17'  # LTS is 18, 20, 22
   ```

2. **Missing dependency**
   ```yaml
   # This will fail - npm test not found
   - run: npm run test-no-exist
   ```

3. **Fix by checking logs**
   - Go to Actions tab
   - Click failed run
   - Click on failing step
   - Read error message

### Success Criteria
- [ ] Can find error in logs
- [ ] Understand error messages
- [ ] Can fix common issues

---

## Challenge Exercise: Complete CI/CD System (45 min)

### Objective
Build a complete continuous integration and delivery system.

### Requirements

```
.github/workflows/
├── ci.yml          # Lint + Test + Build
├── security.yml    # Security scanning
├── deploy-dev.yml   # Deploy to dev on PR merge
└── deploy-prod.yml # Deploy to prod on release
```

### ci.yml Requirements
- Lint job (runs first)
- Test matrix (Node 18, 20, 22)
- Build job (runs after test)
- Cache dependencies

### Security scanning
- Use dependency scanning
- Use code scanning (if available)

### Deploy workflows
- Separate dev and prod
- Different triggers
- Different secrets

### Success Criteria
- [ ] CI workflow passes all checks
- [ ] Security scan runs
- [ ] Dev deployment configured
- [ ] Prod deployment configured

---

## Review Questions

1. What does CI stand for?
   _______________________________________________

2. What does CD stand for?
   _______________________________________________

3. What is a workflow in GitHub Actions?
   _______________________________________________

4. What is a job in GitHub Actions?
   _______________________________________________

5. What is a matrix strategy?
   _______________________________________________