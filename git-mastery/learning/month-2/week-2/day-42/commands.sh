#!/bin/bash

# Day 42: Week 6 Review - Commands Reference

echo "╔═══════════════════════════════════════════════════════════════════════╗"
echo "║              Week 6 Review - Commands Reference                    ║"
echo "╚═══════════════════════════════════════════════════════════════════════╝"
echo ""

echo "GitLab CI/CD Commands:"
echo "----------------------------------------"
cat << 'EOF'
# Basic pipeline
gitlab-ci.yml structure:
  stages:
    - build
    - test
    - deploy

  job_name:
    stage: build
    script:
      - npm install
      - npm run build

# Variables
variables:
  APP_NAME: "my-app"

# Artifacts
artifacts:
  paths:
    - build/
  expire_in: 1 week
EOF
echo ""

echo "GitLab CLI (glab):"
echo "----------------------------------------"
cat << 'EOF'
# Install
brew install gitlab-cli  # macOS
sudo apt install gitlab-cli  # Linux

# Authenticate
glab auth login

# Commands
glab repo clone user/repo
glab mr create
glab mr list
glab pipeline list
EOF
