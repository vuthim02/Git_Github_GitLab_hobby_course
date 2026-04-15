# Day 36 Exercises: GitLab Overview

## Exercise 1: Create GitLab Account (10 min)
Visit gitlab.com, register, verify email

## Exercise 2: Create Project (15 min)
New Project → Blank → Add README

## Exercise 3: Push local to GitLab (20 min)
```bash
mkdir my-project && cd my-project
git init
echo "# Test" > README.md
git add . && git commit -m "Initial"
git remote add origin https://gitlab.com/USERNAME/my-project.git
git push -u origin main
```