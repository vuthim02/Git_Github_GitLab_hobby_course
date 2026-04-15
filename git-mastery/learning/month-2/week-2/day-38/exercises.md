# Day 38 Exercises: GitLab CI/CD

## Exercise 1: Create First Pipeline (20 min)

1. Create .gitlab-ci.yml
2. Add basic build stage
3. Commit and push
4. View in CI/CD → Pipelines

```yaml
stages:
  - build

build:
  stage: build
  script:
    - echo "Building..."
```

## Exercise 2: Add Test Stage (25 min)

Add test stage with caching:

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

test:
  stage: test
  script:
    - npm test
```

## Exercise 3: Full Pipeline (30 min)

Create complete pipeline:

```yaml
stages:
  - lint
  - build
  - test

lint:
  stage: lint
  script:
    - npm ci
    - npm run lint

build:
  stage: build
  script:
    - npm ci
    - npm run build
  artifacts:
    paths:
      - dist/

test:
  stage: test
  script:
    - npm ci
    - npm test
```

## Challenge Exercise
Add coverage reporting and environment deployment.

---

## Review Questions

1. What is GitLab CI/CD?
2. What are stages?
3. What are artifacts?