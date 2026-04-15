#!/bin/bash

# Day 38: GitLab CI/CD - Commands

echo "GitLab CI/CD Pipeline"

# .gitlab-ci.yml
cat > .gitlab-ci.yml << 'EOF'
stages:
  - build

build:
  stage: build
  script:
    - npm ci
    - npm test
EOF

# Push to trigger pipeline
git add .gitlab-ci.yml
git commit -m "Add CI pipeline"
git push