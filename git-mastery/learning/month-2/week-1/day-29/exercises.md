# Day 29 Exercises: GitHub Repositories

## Exercise 1: Create Your First GitHub Repository (20 min)

### Objective
Create a GitHub repository using GitHub CLI and push your first commits.

### Steps

1. **Create repository**
   ```bash
   gh auth login
   gh repo create github-practice --public --clone
   cd github-practice
   ```

2. **Create project structure**
   ```bash
   mkdir src
   mkdir tests
   ```

3. **Create files**
   ```bash
   echo "# GitHub Practice" > README.md
   echo 'console.log("Hello GitHub");' > src/app.js
   echo 'console.log("Test");' > tests/app.test.js
   ```

4. **Commit and push**
   ```bash
   git add .
   git commit -m "Initial project setup"
   git push
   ```

5. **Verify on GitHub**
   - Go to your repository on GitHub
   - Verify all files are present
   - Check commit history

### Success Criteria
- [ ] Repository created on GitHub
- [ ] All files pushed successfully
- [ ] GitHub shows correct commit history
- [ ] README displays properly on GitHub

---

## Exercise 2: Connect Existing Local Repository (25 min)

### Objective
Take a local project and connect it to GitHub.

### Scenario
You have a local project `my-portfolio` that you want to host on GitHub.

### Steps

1. **Create local project (or use existing)**
   ```bash
   cd ~
   mkdir -p my-portfolio/src
   cd my-portfolio
   git init
   ```

2. **Add content**
   ```bash
   echo "# My Portfolio" > README.md
   echo "/* Portfolio styles */" > src/style.css
   echo "// Portfolio logic" > src/app.js
   ```

3. **Initial commit**
   ```bash
   git add .
   git commit -m "Initial commit"
   ```

4. **Create GitHub repo**
   ```bash
   gh repo create my-portfolio --public --source=. --push
   ```

5. **Verify connection**
   ```bash
   git remote -v
   git log --oneline
   ```

### Success Criteria
- [ ] Local repo connected to GitHub
- [ ] First commit visible on GitHub
- [ ] `git remote -v` shows correct URL

---

## Exercise 3: Forking Workflow Practice (30 min)

### Objective
Learn the complete fork workflow by forking and syncing a real repository.

### Steps

1. **Fork a popular repository**
   ```bash
   gh repo fork twbs/bootstrap
   # This clones your fork and adds upstream
   cd bootstrap
   ```

2. **Verify remotes**
   ```bash
   git remote -v
   # Should show:
   # origin    https://github.com/YOUR-USERNAME/bootstrap.git
   # upstream  https://github.com/twbs/bootstrap.git
   ```

3. **Create a feature branch**
   ```bash
   git checkout -b fix-typo-readme
   ```

4. **Make a small change**
   ```bash
   # Edit README.md (fix a typo or add comment)
   echo "<!-- Fork practice -->" >> README.md
   git add .
   git commit -m "Practice: add comment to README"
   ```

5. **Push to your fork**
   ```bash
   git push -u origin fix-typo-readme
   ```

6. **Sync with upstream**
   ```bash
   git checkout main
   git fetch upstream
   git merge upstream/main
   git push origin main
   ```

### Success Criteria
- [ ] Fork created successfully
- [ ] Both origin and upstream remotes configured
- [ ] Feature branch pushed to your fork
- [ ] Main branch synced with upstream

---

## Exercise 4: Professional README Creation (25 min)

### Objective
Create a comprehensive README for a real project.

### Requirements

Create a README.md with ALL of these sections:

```markdown
# Project Name

One-sentence description of what this project does.

[![GitHub stars](https://img.shields.io/github/stars/user/repo)](https://github.com/user/repo/stargazers)
[![License](https://img.shields.io/github/license/user/repo)](LICENSE)

## Features

- Feature 1
- Feature 2
- Feature 3

## Quick Start

```bash
# Installation
npm install project-name

# Usage
project-name start
```

## Installation

Detailed installation instructions...

## Usage

Code examples showing how to use...

## Configuration

Environment variables or config options...

## Contributing

1. Fork the repository
2. Create your branch (`git checkout -b feature/amazing`)
3. Commit changes
4. Push to branch
5. Open a Pull Request

## License

MIT License - see [LICENSE](LICENSE) file.
```

### Create for one of:
- A portfolio project
- A utility library you use
- The git-practice repo from Exercise 1

### Success Criteria
- [ ] All required sections present
- [ ] Code blocks properly formatted
- [ ] Badges (if applicable)
- [ ] Clear installation instructions
- [ ] Contribution guidelines

---

## Exercise 5: GitHub Pages Setup (15 min)

### Objective
Host a simple static website using GitHub Pages.

### Steps

1. **Create a new repo for your site**
   ```bash
   gh repo create my-github-pages --public --clone
   cd my-github-pages
   ```

2. **Create a simple HTML site**
   ```bash
   cat > index.html << 'EOF'
   <!DOCTYPE html>
   <html>
   <head>
       <title>My Site</title>
   </head>
   <body>
       <h1>Welcome to My Site</h1>
       <p>This is hosted on GitHub Pages!</p>
   </body>
   </html>
   EOF
   ```

3. **Commit and push**
   ```bash
   git add .
   git commit -m "Add website files"
   git push
   ```

4. **Enable GitHub Pages**
   - Go to Settings → Pages
   - Source: Deploy from a branch
   - Branch: main / (root)
   - Click Save

5. **Wait 2-3 minutes, then visit:**
   ```
   https://YOUR-USERNAME.github.io/my-github-pages
   ```

### Success Criteria
- [ ] Repository created
- [ ] Website deployed
- [ ] Site accessible at username.github.io URL

---

## Challenge Exercise: Multi-Remote Setup (30 min)

### Objective
Set up a project with multiple remote configurations for backup purposes.

### Scenario
You want to push your code to both GitHub and GitLab (or a backup GitHub account).

### Steps

1. **Create primary repo (GitHub)**
   ```bash
   mkdir multi-remote-project && cd multi-remote-project
   git init
   echo "# Multi Remote Demo" > README.md
   git add . && git commit -m "Initial commit"
   ```

2. **Add GitHub as origin**
   ```bash
   # Create this repo on GitHub first, then:
   git remote add origin https://github.com/USERNAME/repo.git
   git push -u origin main
   ```

3. **Add backup remote**
   ```bash
   # Create backup repo on another GitHub account or GitLab, then:
   git remote add backup https://gitlab.com/user/project.git
   ```

4. **Verify remotes**
   ```bash
   git remote -v
   # Should show both origin and backup
   ```

5. **Push to both**
   ```bash
   git push origin main
   git push backup main
   ```

### Success Criteria
- [ ] Two remotes configured
- [ ] Pushes to both remotes successful
- [ ] Can view commits on both platforms

---

## Review Questions

Answer these to verify understanding:

1. What is the difference between Git and GitHub?
   _______________________________________________

2. What does the `-u` flag do in `git push -u origin main`?
   _______________________________________________

3. In a fork workflow, what is the purpose of `upstream` remote?
   _______________________________________________

4. What command shows all configured remotes?
   _______________________________________________

5. Why should you create `.gitignore` before your first commit?
   _______________________________________________
