#!/bin/bash
echo "Deployment - GitLab CI/CD"

# Deploy staging
deploy staging:
  stage: deploy
  script: ./deploy.sh staging
  environment:
    name: staging

# Deploy production  
deploy production:
  stage: deploy
  script: ./deploy.sh production
  environment:
    name: production
  only:
    - main