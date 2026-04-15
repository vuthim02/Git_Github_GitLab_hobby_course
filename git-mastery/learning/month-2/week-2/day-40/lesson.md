# Day 40: Variables & Secrets

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 40                                ║
║                         VARIABLES & SECRETS                                   ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand CI/CD variables
- [ ] Use predefined variables
- [ ] Define custom variables
- [ ] Manage secrets
- [ ] Use masked variables

---

## Theory: Variables

### Predefined Variables

```yaml
build:
  script:
    - echo $CI_PROJECT_NAME
    - echo $CI_COMMIT_SHA
    - echo $CI_COMMIT_BRANCH
```

### Custom Variables

```yaml
variables:
  MY_VARIABLE: "hello"

build:
  script:
    - echo $MY_VARIABLE
```

### Secrets

Use GitLab CI/CD Settings → Variables:
- CI_DEBUG_TRACE: true/false
- API_TOKEN: masked variable

### Example Pipeline with Variables

```yaml
stages:
  - build

variables:
  DEPLOY_ENV: "staging"

build:
  stage: build
  script:
    - echo "Deploying to $DEPLOY_ENV"
    - deploy.sh $DEPLOY_ENV
  environment:
    name: $DEPLOY_ENV
```

---

## Reading References

### GitLab Variables Documentation
- [CI/CD Variables](https://docs.gitlab.com/ee/ci/variables/)
- [Predefined Variables Reference](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html)
- [Creating Custom Variables](https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable)
- [Masked Variables](https://docs.gitlab.com/ee/ci/variables/#mask-a-cicd-variable)

### Security Best Practices
- [CI/CD Security](https://docs.gitlab.com/ee/ci/secrets/)
- [CI_JOB_TOKEN](https://docs.gitlab.com/ee/api/project_job_artifacts.html)

---

## Checklist

- [ ] Can use predefined variables
- [ ] Can define custom variables
- [ ] Can manage secrets