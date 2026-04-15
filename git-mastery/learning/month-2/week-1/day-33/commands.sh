#!/bin/bash

# Day 33: GitHub Actions Intro - Practice Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║               Day 33: GitHub Actions Intro - Commands                 ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

# ============================================
# SECTION 1: Creating Workflow Files
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 1: Creating Workflow Files"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Create workflow directory"
echo "----------------------------------------"
cat << 'EOF'
mkdir -p .github/workflows
EOF
echo ""

echo "Create basic workflow"
echo "----------------------------------------"
cat << 'EOF'
cat > .github/workflows/ci.yml << 'EOF'
name: CI Pipeline

on:
  push:
    branches: [main]
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
    
    - name: Install dependencies
      run: npm ci
    
    - name: Run tests
      run: npm test
EOF
EOF
echo ""

echo "Node.js with caching"
echo "----------------------------------------"
cat << 'EOF'
cat > .github/workflows/ci.yml << 'EOF'
name: CI Pipeline

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
        cache: 'npm'
    
    - run: npm ci
    - run: npm test
EOF
EOF
echo ""

# ============================================
# SECTION 2: Common Actions
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 2: Common Actions"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Checkout action"
echo "----------------------------------------"
cat << 'EOF'
- uses: actions/checkout@v4

# With specific branch
- uses: actions/checkout@v4
  with:
    ref: develop

# With full history (for git operations)
- uses: actions/checkout@v4
  with:
    fetch-depth: 0
EOF
echo ""

echo "Setup Node.js"
echo "----------------------------------------"
cat << 'EOF'
- uses: actions/setup-node@v4
  with:
    node-version: '20'

# With caching
- uses: actions/setup-node@v4
  with:
    node-version: '20'
    cache: 'npm'

# With specific version range
- uses: actions/setup-node@v4
  with:
    node-version: '>=18.0.0'
EOF
echo ""

echo "Setup Python"
echo "----------------------------------------"
cat << 'EOF'
- uses: actions/setup-python@v5
  with:
    python-version: '3.11'

# With caching
- uses: actions/setup-python@v5
  with:
    python-version: '3.11'
    cache: 'pip'
EOF
echo ""

echo "Docker actions"
echo "----------------------------------------"
cat << 'EOF'
# Setup buildx
- uses: docker/setup-buildx-action@v3

# Login to Docker Hub
- uses: docker/login-action@v3
  with:
    username: ${{ secrets.DOCKER_USERNAME }}
    password: ${{ secrets.DOCKER_PASSWORD }}

# Login to GitHub Container Registry
- uses: docker/login-action@v3
  with:
    registry: ghcr.io
    username: ${{ github.actor }}
    password: ${{ secrets.GITHUB_TOKEN }}

# Build and push
- uses: docker/build-push-action@v5
  with:
    context: .
    push: true
    tags: user/repo:latest
EOF
echo ""

# ============================================
# SECTION 3: Workflow Triggers
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 3: Workflow Triggers"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Push trigger"
echo "----------------------------------------"
cat << 'EOF'
on:
  push:
    branches: [main, develop]
EOF
echo ""

echo "Pull request trigger"
echo "----------------------------------------"
cat << 'EOF'
on:
  pull_request:
    branches: [main]
EOF
echo ""

echo "Release trigger"
echo "----------------------------------------"
cat << 'EOF'
on:
  release:
    types: [published, created]
EOF
echo ""

echo "Schedule trigger (cron)"
echo "----------------------------------------"
cat << 'EOF'
on:
  schedule:
    - cron: '0 0 * * *'  # Daily at midnight
EOF
echo ""

echo "Manual trigger"
echo "----------------------------------------"
cat << 'EOF'
on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Environment to deploy'
        required: true
        default: 'staging'
EOF
echo ""

echo "Multiple triggers"
echo "----------------------------------------"
cat << 'EOF'
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  release:
    types: [published]
EOF
echo ""

# ============================================
# SECTION 4: Matrix Strategy
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 4: Matrix Strategy"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Node.js versions matrix"
echo "----------------------------------------"
cat << 'EOF'
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
EOF
echo ""

echo "Multi-OS matrix"
echo "----------------------------------------"
cat << 'EOF'
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
        node-version: [18, 20]
    
    steps:
    - uses: actions/checkout@v4
    
    - uses: actions/setup-node@v4
      with:
        node-version: ${{ matrix.node-version }}
    
    - run: npm ci
    - run: npm test
EOF
echo ""

echo "Matrix fail-fast"
echo "----------------------------------------"
cat << 'EOF'
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        node-version: [18, 20, 22]
    
    steps:
    - run: npm ci
    - run: npm test
EOF
echo ""

# ============================================
# SECTION 5: Environment and Secrets
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 5: Environment Variables and Secrets"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Using secrets"
echo "----------------------------------------"
cat << 'EOF'
steps:
  - run: npm run deploy
    env:
      API_KEY: ${{ secrets.API_KEY }}
      DEPLOY_URL: ${{ secrets.DEPLOY_URL }}
EOF
echo ""

echo "Environment variables"
echo "----------------------------------------"
cat << 'EOF'
env:
  NODE_VERSION: '20'
  ENVIRONMENT: production

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      NODE_ENV: production
    
    steps:
    - run: echo "Node version: ${{ env.NODE_VERSION }}"
EOF
echo ""

# ============================================
# SECTION 6: Job Dependencies
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 6: Job Dependencies"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Job with dependency"
echo "----------------------------------------"
cat << 'EOF'
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - run: npm ci
    - run: npm run lint

  test:
    needs: lint
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - run: npm ci
    - run: npm test
EOF
echo ""

echo "Multiple dependencies"
echo "----------------------------------------"
cat << 'EOF'
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
    - run: npm run lint

  build:
    runs-on: ubuntu-latest
    steps:
    - run: npm run build

  test:
    needs: [lint, build]
    runs-on: ubuntu-latest
    steps:
    - run: npm test
EOF
echo ""

# ============================================
# SECTION 7: Debugging
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━���━���━━━"
echo "SECTION 7: Debugging"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Enable debug logging"
echo "----------------------------------------"
cat << 'EOF'
# Add this to workflow
env:
  ACTIONS_DEBUG: 1

# Also enable in repository settings:
# Repository → Settings → Actions → General → Debug workflows
EOF
echo ""

echo "View workflow runs"
echo "----------------------------------------"
echo "GitHub → Actions → Select workflow → Select run"
echo ""

echo "Common errors and fixes"
echo "----------------------------------------"
cat << 'EOF'
# Error: Node not found
# Fix: Use correct node-version in setup-node

# Error: Cache not found
# Fix: Check cache key matches package-lock.json hash

# Error: Permission denied
# Fix: Check secrets are set correctly

# Error: Action not found
# Fix: Check action version (e.g., @v4 instead of @v2)
EOF
echo ""

# ============================================
# SECTION 8: Complete Examples
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 8: Complete Examples"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Complete Node.js workflow"
echo "----------------------------------------"
cat << 'EOF'
cat > .github/workflows/ci.yml << 'EOF'
name: Node.js CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

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

  test:
    needs: lint
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18, 20, 22]
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: ${{ matrix.node-version }}
        cache: 'npm'
    - run: npm ci
    - run: npm test

  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: '20'
        cache: 'npm'
    - run: npm ci
    - run: npm run build
EOF
EOF
echo ""

echo "Complete Python workflow"
echo "----------------------------------------"
cat << 'EOF'
cat > .github/workflows/python.yml << 'EOF'
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
        cache: 'pip'
    
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
        pip install pytest
    
    - name: Run tests
      run: pytest
EOF
EOF
echo ""

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                           COMPLETE!                                ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"