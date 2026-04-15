#!/bin/bash
# Day 40: Variables & Secrets

echo "Variables and Secrets"

# Predefined
echo $CI_PROJECT_NAME
echo $CI_COMMIT_SHA

# Custom in .gitlab-ci.yml
variables:
  MY_VAR: "value"

# Secrets in settings
# Settings → CI/CD → Variables