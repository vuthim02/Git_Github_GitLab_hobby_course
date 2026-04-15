# Day 38: GitLab CI/CD

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 38                                ║
║                           GITLAB CI/CD                                        ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand GitLab CI/CD
- [ ] Create .gitlab-ci.yml pipeline
- [ ] Define stages
- [ ] Run jobs
- [ ] Understand pipeline structure
- [ ] Cache dependencies
- [ ] Use artifacts

---

## Theory: GitLab CI/CD

### What is GitLab CI/CD?

GitLab CI/CD is GitLab's **built-in continuous integration** system. It's included with GitLab - no extra cost!

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    GITLAB CI/CD ARCHITECTURE                                │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   .gitlab-ci.yml                                                         │
│        │                                                                 │
│        ▼                                                                 │
│   ┌─────────┐  ┌─────────┐  ┌─────────┐                                 │
│   │  STAGE  │  │  STAGE  │  │  STAGE  │                                 │
│   │  test   │  │ build   │  │ deploy  │                                 │
│   └────┬────┘  └────┬────┘  └────┬────┘                                 │
│        │             │             │                                        │
│   ┌────┴────┐ ┌────┴────┐ ┌────┴────┐                                 │
│   │  Job 1  │  │  Job 1  │  │  Job 1  │                                 │
│   │  Job 2  │  │         │  │         │                                 │
│   └────┬────┘ └────────┘ └────────┘                                 │
│        │                                                              │
│        ▼                                                              │
│   ┌────────────────────────────────┐                                   │
│   │         PIPELINE             │                                   │
│   │  Runs automatically on push   │                                   │
│   └────────────────────────────────┘                                   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Key Concepts

| Concept | Description |
|---------|-------------|
| Pipeline | Full CI/CD workflow |
| Stage | Group of jobs that run together |
| Job | Individual task that runs |
| Runner | Server that executes jobs |
| Artifact | Files passed between jobs |

---

## Creating .gitlab-ci.yml

### Basic Pipeline

```yaml
# .gitlab-ci.yml (root of repository)

stages:
  - build
  - test
  - deploy

build:
  stage: build
  script:
    - echo "Building..."
    - npm ci
    - npm run build

test:
  stage: test
  script:
    - echo "Testing..."
    - npm test

deploy:
  stage: deploy
  script:
    - echo "Deploying..."
  only:
    - main
```

### Structure

```yaml
job-name:
  stage: stage-name
  script:
    - command 1
    - command 2
  tags:
    - tag-name
  only:
    - branch names
  except:
    - branch names
  variables:
    - KEY: value
```

---

## Pipeline Examples

### Node.js Pipeline

```yaml
image: node:lts

stages:
  - lint
  - test
  - build

cache:
  paths:
    - node_modules/

lint:
  stage: lint
  script:
    - npm ci
    - npm run lint

test:
  stage: test
  script:
    - npm ci
    - npm test
  coverage: '/Coverage: \d+\.\d+%/'

build:
  stage: build
  script:
    - npm ci
    - npm run build
  artifacts:
    paths:
      - dist/
    expire_in: 1 week
```

### Python Pipeline

```yaml
image: python:3.11

stages:
  - test
  - build

cache:
  paths:
    - .venv/

before_script:
  - python -m venv .venv
  - source .venv/bin/activate
  - pip install -r requirements.txt

test:
  stage: test
  script:
    - pytest
  coverage: '/TOTAL.*\s (\d+%)/'

build:
  stage: build
  script:
    - python setup.py sdist
  artifacts:
    paths:
      - dist/
```

---

## Advanced Features

### Multiple Jobs in Stage

```yaml
stages:
  - test

test:unit:
  stage: test
  script:
    - npm run test:unit

test:integration:
  stage: test
  script:
    - npm run test:integration

test:e2e:
  stage: test
  script:
    - npm run test:e2e
```

### Dependencies and Artifacts

```yaml
build:
  stage: build
  script:
    - npm run build
  artifacts:
    paths:
      - build/
    expire_in: 1 week

test:
  stage: test
  script:
    - npm test
  dependencies:
    - build
```

### Only/Except

```yaml
deploy:
  stage: deploy
  script:
    - deploy.sh
  only:
    - main
    - tags

nightly:
  stage: test
  script:
    - run nightly tests
  only:
    - schedules
```

### Environment

```yaml
deploy staging:
  stage: deploy
  script:
    - deploy staging
  environment:
    name: staging
    url: https://staging.example.com

deploy production:
  stage: deploy
  script:
    - deploy production
  environment:
    name: production
    url: https://example.com
  only:
    - main
```

---

## GitLab CI/CD vs GitHub Actions

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       CI/CD COMPARISON                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   GITHUB ACTIONS (.github/workflows/):                                      │
│   ├─ Trigger: on: push, pull_request                                        │
│   ├─ Uses: actions/xxxx@v4                                                 │
│   ├─ Matrix: strategy.matrix                                                │
│   └─ Secrets: secrets.XXX                                                  │
│                                                                             │
│   GITLAB CI/CD (.gitlab-ci.yml):                                            │
│   ├─ Trigger: only/except                                                  │
│   ├─ Uses: image + script                                                   │
│   ├─ Matrix: matrix-job                                                    │
│   └─ Variables: CI/CD settings or .gitlab-ci.yml                          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Practice Exercises

### Exercise 1: First Pipeline (20 min)

1. Create .gitlab-ci.yml
2. Add basic stages
3. Push to GitLab
4. View pipeline in GitLab

```yaml
stages:
  - build

build:
  script:
    - echo "Hello CI/CD!"
    - npm --version
```

### Exercise 2: Add Full Pipeline (25 min)

1. Add build, test stages
2. Add caching
3. Push and watch pipeline

```yaml
stages:
  - build
  - test

cache:
  paths:
    - node_modules/

build:
  stage: build
  script:
    - npm ci
    - npm run build

test:
  stage: test
  script:
    - npm ci
    - npm test
```

### Exercise 3: Multiple Jobs (20 min)

1. Add parallel jobs
2. Add dependencies
3. Use artifacts

---

## Reading References

### GitLab CI/CD Documentation
- [GitLab CI/CD](https://docs.gitlab.com/ee/ci/)
- [GitLab CI/CD Quick Start](https://docs.gitlab.com/ee/ci/quick_start/)
- [GitLab CI/CD YAML Reference](https://docs.gitlab.com/ee/ci/yaml/)
- [CI/CD Pipeline Architecture](https://docs.gitlab.com/ee/ci/pipelines/)
- [GitLab CI/CD Variables](https://docs.gitlab.com/ee/ci/variables/)
- [GitLab Runners](https://docs.gitlab.com/ee/ci/runners/)

### External Resources
- [GitLab CI/CD Examples](https://gitlab.com/gitlab-org/gitlab-foss/-/tree/master/lib/gitlab/ci/templates)
- [Awesome GitLab CI](https://github.com/awesome-gitlab-ci/awesome-gitlab-ci)

---

## Checklist

- [ ] Can create .gitlab-ci.yml
- [ ] Can define stages
- [ ] Can run jobs
- [ ] Can use cache
- [ ] Can pass artifacts
- [ ] Can use environment

---

## Navigation

← [Day 37: Merge Requests](../day-37/lesson.md) | [Dashboard](../../dashboard.md) | [Day 39: Pipelines](../day-39/lesson.md) →

---

**Estimated Time**: 4 hours  
**Your Progress**: Day 38 of 56 (Week 6 - Day 3)  
**Next**: Pipelines