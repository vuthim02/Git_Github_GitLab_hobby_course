#!/bin/bash
echo "Day 44: GitHub Flow"

# Simple GitHub Flow workflow
# Branch from main
git checkout main
git pull
git checkout -b feature/my-feature

# Make changes
git add . && git commit -m "Add feature"

# Push and create PR
git push -u origin feature/my-feature

# Merge via GitHub