#!/bin/bash

# Day 29: GitHub Repositories - Practice Commands

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║              Day 29: GitHub Repositories - Command Practice          ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

# ============================================
# SECTION 1: GitHub CLI Setup
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 1: GitHub CLI Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Step 1: Check if GitHub CLI is installed"
if command -v gh &> /dev/null; then
    echo "✅ GitHub CLI is installed"
    gh --version
else
    echo "⚠️  GitHub CLI not found. Install with:"
    echo "   macOS: brew install gh"
    echo "   Linux: sudo apt install gh"
    echo "   Windows: winget install GitHub.cli"
fi
echo ""

echo "Step 2: Authenticate with GitHub (run once)"
echo "Command: gh auth login"
echo "   - Choose HTTPS (recommended for beginners)"
echo "   - Or SSH for passwordless auth (recommended for professionals)"
echo ""

# ============================================
# SECTION 2: Creating Repositories
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 2: Creating Repositories"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Method 1: Create repo with GitHub CLI"
echo "----------------------------------------"
echo "# Create public repository"
echo "gh repo create my-project --public"
echo ""
echo "# Create private repository"
echo "gh repo create my-private-project --private"
echo ""
echo "# Create and clone immediately"
echo "gh repo create my-project --public --clone"
echo ""

echo "Method 2: Create repo from existing local project"
echo "----------------------------------------"
echo "# Initialize local repo"
echo "mkdir my-project && cd my-project"
echo "git init"
echo ""
echo "# Add files and commit"
echo "echo '# My Project' > README.md"
echo "git add . && git commit -m 'Initial commit'"
echo ""
echo "# Connect to GitHub (manually)"
echo "gh repo create my-project --public --source=. --push"
echo ""

echo "Method 3: Via Web Interface"
echo "----------------------------------------"
echo "1. Go to https://github.com/new"
echo "2. Enter repository name"
echo "3. Choose visibility"
echo "4. Click 'Create repository'"
echo ""

# ============================================
# SECTION 3: Cloning Repositories
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 3: Cloning Repositories"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Clone with HTTPS (default)"
echo "----------------------------------------"
echo "git clone https://github.com/owner/repo.git"
echo ""

echo "Clone with SSH"
echo "----------------------------------------"
echo "git clone git@github.com:owner/repo.git"
echo ""

echo "Clone to specific folder"
echo "----------------------------------------"
echo "git clone https://github.com/owner/repo.git my-folder"
echo ""

echo "Shallow clone (recent history only)"
echo "----------------------------------------"
echo "git clone --depth 1 https://github.com/owner/repo.git"
echo ""

# ============================================
# SECTION 4: Managing Remotes
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 4: Managing Remotes"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "View current remotes"
echo "----------------------------------------"
echo "git remote -v"
echo "# Output:"
echo "# origin    https://github.com/user/repo.git (fetch)"
echo "# origin    https://github.com/user/repo.git (push)"
echo ""

echo "Add a remote"
echo "----------------------------------------"
echo "git remote add origin https://github.com/user/repo.git"
echo "git remote add upstream https://github.com/original-owner/repo.git"
echo ""

echo "Change remote URL"
echo "----------------------------------------"
echo "# HTTPS to SSH"
echo "git remote set-url origin git@github.com:user/repo.git"
echo ""
echo "# SSH to HTTPS"
echo "git remote set-url origin https://github.com/user/repo.git"
echo ""

echo "Rename a remote"
echo "----------------------------------------"
echo "git remote rename origin upstream"
echo ""

echo "Remove a remote"
echo "----------------------------------------"
echo "git remote remove origin"
echo ""

# ============================================
# SECTION 5: Push and Pull
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 5: Push and Pull"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "First push (with upstream tracking)"
echo "----------------------------------------"
echo "git push -u origin main"
echo "# -u sets upstream, so future 'git push' works without args"
echo ""

echo "Subsequent pushes"
echo "----------------------------------------"
echo "git push  # Push to tracked branch"
echo "git push origin feature-branch  # Push specific branch"
echo ""

echo "Push all branches"
echo "----------------------------------------"
echo "git push --all origin"
echo ""

echo "Push with tags"
echo "----------------------------------------"
echo "git push origin --tags"
echo ""

echo "Pull changes"
echo "----------------------------------------"
echo "git pull           # Pull from upstream"
echo "git pull --rebase  # Pull with rebase (cleaner history)"
echo ""

# ============================================
# SECTION 6: Forking Workflow
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 6: Forking Workflow"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Fork a repository"
echo "----------------------------------------"
echo "# Via GitHub web: Click 'Fork' button on any repo"
echo "# Via CLI:"
echo "gh repo fork owner/repo"
echo ""

echo "Clone your fork"
echo "----------------------------------------"
echo "git clone https://github.com/YOUR-USERNAME/repo.git"
echo ""

echo "Add upstream remote"
echo "----------------------------------------"
echo "cd repo"
echo "git remote add upstream https://github.com/owner/repo.git"
echo ""

echo "Sync fork with upstream"
echo "----------------------------------------"
echo "# Method 1: GitHub web (Quick)"
echo "# - Go to your fork on GitHub"
echo "# - Click 'Sync fork' button"
echo ""
echo "# Method 2: Command line"
echo "git fetch upstream"
echo "git checkout main"
echo "git merge upstream/main"
echo "git push origin main"
echo ""

# ============================================
# SECTION 7: GitHub Pages Setup
# ============================================
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "SECTION 7: GitHub Pages (Static Website Hosting)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Enable GitHub Pages"
echo "----------------------------------------"
echo "# Via GitHub web:"
echo "# Settings → Pages → Source: main branch / (root)"
echo ""
echo "# Or via GitHub CLI:"
echo "gh repo edit owner/repo --enable-pages"
echo ""

echo "Common GitHub Pages URLs"
echo "----------------------------------------"
echo "# User site: https://username.github.io"
echo "# Project site: https://username.github.io/repo-name"
echo ""

# ============================================
# PRACTICE EXERCISES
# ============================================
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                        PRACTICE EXERCISES                              ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

echo "Exercise 1: First Repository"
echo "----------------------------------------"
cat << 'EOF'
# 1. Create a new repository
gh repo create my-first-repo --public

# 2. Clone it
gh repo clone YOUR-USERNAME/my-first-repo

# 3. Add a file
cd my-first-repo
echo "# My First Repo" > README.md

# 4. Commit and push
git add .
git commit -m "Add README"
git push
EOF
echo ""

echo "Exercise 2: Connect Existing Project"
echo "----------------------------------------"
cat << 'EOF'
# 1. Create local project
mkdir ~/my-project && cd ~/my-project
git init

# 2. Create GitHub repo (do this on GitHub.com first)
# Then connect:
git remote add origin https://github.com/YOUR-USERNAME/my-project.git

# 3. Push
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
EOF
echo ""

echo "Exercise 3: Fork and Sync"
echo "----------------------------------------"
cat << 'EOF'
# 1. Fork a popular repo
gh repo fork microsoft/vscode

# 2. Clone your fork
git clone https://github.com/YOUR-USERNAME/vscode.git

# 3. Add upstream
cd vscode
git remote add upstream https://github.com/microsoft/vscode.git

# 4. Fetch from both
git fetch origin
git fetch upstream

# 5. View branches
git branch -a | head -20
EOF
echo ""

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║                           COMPLETE!                                    ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
