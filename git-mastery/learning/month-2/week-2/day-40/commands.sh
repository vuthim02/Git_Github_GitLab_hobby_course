#!/bin/bash
echo "Variables & Secrets - GitLab CI/CD"

# Predefined variables
echo $CI_PROJECT_NAME
echo $CI_COMMIT_SHA 
echo $CI_COMMIT_BRANCH

# Custom variables in .gitlab-ci.yml:
# variables:
#   DEPLOY_ENV: "staging"

# Secrets in Settings → CI/CD → Variables