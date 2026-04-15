#!/bin/bash
echo "Day 45: GitLab Flow"

# Environment branches
# Push to staging
git push origin main:staging

# After testing, promote to production
git push origin main:production