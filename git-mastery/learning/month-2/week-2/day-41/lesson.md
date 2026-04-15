# Day 41: Deployment

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 41                                ║
║                          DEPLOYMENT                                        ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand deployment strategies
- [ ] Deploy to different environments
- [ ] Use GitLab environments
- [ ] Implement CI/CD deployment
- [ ] Use deployment jobs

---

## Theory: Deployment

### Environments

```yaml
deploy staging:
  stage: deploy
  script:
    - deploy.sh staging
  environment:
    name: staging
    url: https://staging.example.com

deploy production:
  stage: deploy
  script:
    - deploy.sh production
  environment:
    name: production
    url: https://example.com
  only:
    - main
```

### Deployment Strategies

| Strategy | Description |
|----------|-------------|
| Blue-Gold | Switch traffic between old/new |
| Canary | Gradual rollout |
| Rolling | Replace gradually |
| Recreate | Delete and recreate |

### Deployment Example

```yaml
deploy:
  stage: deploy
  script:
    - docker build -t app:$CI_COMMIT_SHA .
    - docker push registry
    - kubectl apply -f deployment.yaml
  environment:
    name: production
    on_stop: stop_deploy
  only:
    - main
```

---

## Reading References

### GitLab Deployment Documentation
- [Environments and Deployments](https://docs.gitlab.com/ee/ci/environments/)
- [Deployment Approvals](https://docs.gitlab.com/ee/ci/environments/deployment_approvals.html)
- [Protected Environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)
- [Kubernetes Deployment](https://docs.gitlab.com/ee/integration/kubernetes/)
- [GitLab Deploy Boards](https://docs.gitlab.com/ee/ci/environments/deploy_boards.html)

---

## Checklist

- [ ] Can create environments
- [ ] Can deploy to staging/production
- [ ] Can use deployment strategies