# Day 41 Exercises: Deployment

## Exercise 1: Create Deployment Pipeline (30 min)

### Steps

1. **Create staging deploy job**
```yaml
deploy_staging:
  stage: deploy
  script:
    - echo "Deploying to staging"
    - ./deploy.sh staging
  environment:
    name: staging
  only:
    - develop
```

2. **Create production deploy job**
```yaml
deploy_production:
  stage: deploy
  script:
    - echo "Deploying to production"
    - ./deploy.sh production
  environment:
    name: production
  only:
    - main
```

3. **Test the pipeline**
```bash
git push origin develop  # Should deploy staging
git push origin main     # Should deploy production
```

---

## Exercise 2: Add Approval Gate (20 min)

```yaml
deploy_production:
  stage: deploy
  script:
    - ./deploy.sh production
  environment:
    name: production
    url: https://production.example.com
  when: manual  # Requires manual approval
  only:
    - main
```
