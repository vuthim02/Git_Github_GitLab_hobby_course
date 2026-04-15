# Day 41: Common Mistakes - Deployment

## Mistake 1: Wrong Environment

**Wrong:**
```yaml
deploy_production:
  stage: deploy
  environment: production
  # deployed in production from feature branch!
```

**Right:**
```yaml
deploy_staging:
  stage: deploy
  environment: staging
  
deploy_production:
  stage: deploy
  environment: production
  only:
    - main
```

---

## Mistake 2: Not Using Protected Variables

**Problem:**
Secrets in plain .gitlab-ci.yml

**Solution:**
- Use CI/CD Variables (masked)
- Mark as protected
- Never commit secrets

---

## Lesson Learned

> "Deploy carefully. Test in staging, verify in production. Use protected variables for secrets."

**Golden Rules:**
1. Test before deploy
2. Use environment protection
3. Protect secrets
4. Monitor deployments
