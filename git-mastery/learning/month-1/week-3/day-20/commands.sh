#!/bin/bash

echo "=== Day 20: GitLab & Merge Requests ==="

echo ""
echo "--- GitLab Workflow Simulation ---"

cd ~
rm -rf gitlab-workflow 2>/dev/null

# Create project directory (simulates GitLab repo)
mkdir gitlab-project && cd gitlab-project
git init

echo "# GitLab Project" > README.md
git add . && git commit -m "Initial commit"

echo ""
echo "--- Clone simulation (would be from GitLab URL) ---"
git remote add origin https://gitlab.com/user/project.git
git remote -v

echo ""
echo "--- Create feature branch ---"
git switch -c feature-api
echo "API endpoint" > api.js
git add . && git commit -m "Add API endpoint"

echo ""
echo "--- Push (would push to GitLab) ---"
# In real GitLab:
# git push -u origin feature-api

echo ""
echo "--- Merge Request Workflow ---"
echo "1. Push feature branch"
echo "2. Go to GitLab -> Merge Requests -> New"
echo "3. Select source (feature-api) and target (main)"
echo "4. Add title and description"
echo "5. Add reviewers"
echo "6. Submit Merge Request"

echo ""
echo "--- MR Options in GitLab ---"
echo "- Source branch: feature-api"
echo "- Target branch: main"
echo "- Title: Add API endpoint"
echo "- Description: Implements REST API for users"
echo "- Assignee: team-lead"
echo "- Reviewers: senior-dev"

echo ""
echo "--- Approve and Merge ---"
git switch main
git merge feature-api --no-ff -m "Merge feature-api"

echo ""
echo "--- GitLab CI/CD (basic concept) ---"
cat << 'EOF'
# .gitlab-ci.yml
stages:
  - test
  - deploy

test:
  stage: test
  script:
    - npm test

deploy:
  stage: deploy
  script:
    - npm run deploy
  only:
    - main
EOF

echo ""
echo "=== Practice Complete ==="
echo "GitLab concepts covered:"
echo "- Merge Requests (MRs)"
echo "- Branch permissions"
echo "- Code review"
echo "- CI/CD pipelines"
