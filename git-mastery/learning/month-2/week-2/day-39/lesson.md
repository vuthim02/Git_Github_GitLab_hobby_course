# Day 39: Pipelines

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 39                                ║
║                            PIPELINES                                        ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand pipeline structure
- [ ] Create advanced pipelines
- [ ] Use pipeline components
- [ ] Manage dependent jobs
- [ ] Use rules

---

## Theory: GitLab Pipelines

### Pipeline Structure

A pipeline is the top-level element in GitLab CI/CD. Each pipeline runs in its own container.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       PIPELINE ARCHITECTURE                                 │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   ┌───────────────────────────────────────────┐                            │
│   │              PIPELINE                       │                            │
│   │                                           │                            │
│   │  Stage 1: test                            │                            │
│   │  ├── test:lint                            │                            │
│   │  ├── test:unit                            │                            │
│   │  └── test:e2e                             │                            │
│   │         │                                 │                            │
│   │         ▼                                 │                            │
│   │  Stage 2: build                           │                            │
│   │  └── build                                │                            │
│   │         │                                 │                            │
│   │         ▼                                 │                            │
│   │  Stage 3: deploy                          │                            │
│   │  └── deploy                               │                            │
│   │                                           │                            │
│   └───────────────────────────────────────────┘                            │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Advanced Pipeline Features

#### Rules

```yaml
deploy:
  stage: deploy
  script:
    - deploy.sh
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
    - if: $CI_COMMIT_TAG
```

#### Workflow

```yaml
workflow:
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
    - if: $CI_MERGE_REQUEST_IID
    - if: $CI_COMMIT_TAG
```

#### extends

```yaml
.test_base:
  script:
    - echo "Running tests..."

test:unit:
  extends: .test_base
  script:
    - npm run test:unit
```

### Pipeline Optimization

```yaml
stages:
  - build
  - test
  - deploy

# Parallel jobs
test:1:
  stage: test
  script: npm run test:suite1
test:2:
  stage: test
  script: npm run test:suite2
test:3:
  stage: test
  script: npm run test:suite3
test:4:
  stage: test
  script: npm run test:suite4
```

---

## Reading References

### GitLab Pipeline Documentation
- [Pipeline Configuration Reference](https://docs.gitlab.com/ee/ci/yaml/)
- [Pipeline Architecture](https://docs.gitlab.com/ee/ci/pipelines/)
- [Pipeline DAG (Directed Acyclic Graph)](https://docs.gitlab.com/ee/ci/directed_acyclic_graph/)
- [Multi-Project Pipelines](https://docs.gitlab.com/ee/ci/multi_project_pipelines.html)
- [Parent-Child Pipelines](https://docs.gitlab.com/ee/ci/pipelines/parent_child_pipelines.html)

---

## Practice Exercises

### Exercise 1: Optimize Pipeline (20 min)

1. Split tests into parallel jobs
2. Add to .gitlab-ci.yml

### Exercise 2: Rules (15 min)

Add rules to control when to run jobs.

---

## Checklist

- [ ] Can create advanced pipelines
- [ ] Can use rules
- [ ] Can optimize with parallel jobs