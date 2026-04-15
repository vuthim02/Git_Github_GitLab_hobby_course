# Day 42 Reflections: Week 6 Review - GitLab & CI/CD

## What I Learned This Week

### Key Takeaways

1. **GitLab Overview**
   - GitLab is a complete DevOps platform
   - Self-hosted option available
   - Built-in CI/CD without extra cost

2. **GitLab Merge Requests**
   - Similar to GitHub Pull Requests
   - Created via CLI (`glab`) or web
   - Review, approve, and merge workflow

3. **GitLab CI/CD**
   - Uses `.gitlab-ci.yml` for pipeline configuration
   - Pipelines consist of stages and jobs
   - Jobs run on Runners
   - Artifacts pass data between jobs

4. **Pipelines**
   - Top-level CI/CD configuration
   - Stages run in order
   - Jobs within stages run in parallel
   - DAG (Directed Acyclic Graph) for dependencies

5. **Variables & Secrets**
   - Predefined variables (`$CI_COMMIT_SHA`, etc.)
   - Custom variables defined in `variables:`
   - Masked variables for secrets
   - Protected variables for sensitive data

6. **Deployment**
   - Environments (staging, production)
   - Deployment strategies
   - Protected environments
   - GitLab Deploy Boards

### GitLab vs GitHub Comparison

| Feature | GitLab | GitHub |
|---------|--------|--------|
| Repository | ✅ | ✅ |
| Built-in CI/CD | ✅ (free) | Actions (limited free) |
| Self-hosted | ✅ (CE/EE) | Enterprise only |
| Merge Requests | ✅ | Pull Requests |
| Container Registry | ✅ Built-in | Separate |
| Project Management | ✅ Built-in | Projects (beta) |

### Commands Mastered

```bash
# GitLab CLI (glab)
glab auth login
glab mr create --title "Title"
glab mr list
glab mr merge 1

# CI/CD
# .gitlab-ci.yml structure
stages:
  - build
  - test
  - deploy

build:
  stage: build
  script:
    - npm install
    - npm run build
```

### Pipeline Example

```yaml
stages:
  - test
  - build
  - deploy

test:
  stage: test
  script:
    - npm test

build:
  stage: build
  script:
    - npm run build
  artifacts:
    paths:
      - dist/

deploy:
  stage: deploy
  script:
    - deploy.sh
  environment:
    name: production
  only:
    - main
```

### Aha Moments

- "GitLab CI/CD is free with GitLab CE - no extra cost for CI/CD!"
- "GitLab's `.gitlab-ci.yml` is similar to GitHub Actions workflow files"
- "Environments in GitLab make tracking deployments visual"
- "Merge Requests and Pull Requests are essentially the same concept"

### Questions to Explore Further

1. How do I set up self-hosted GitLab Runner?
2. What's the difference between GitLab CI/CD and GitHub Actions?
3. How do I use GitLab's Kubernetes integration?
4. What's GitLab Duo and how does AI assist in development?

### Week 7 Preview

**Week 7: Team Workflows**

Next week I'll learn:
- Git Flow
- GitHub Flow
- GitLab Flow
- Code reviews best practices
- Commit conventions (conventional commits)
- Release management

### Confidence Check

Rate your understanding (1-5):
- [ ] GitLab platform: ____
- [ ] GitLab CI/CD basics: ____
- [ ] Pipeline configuration: ____
- [ ] Variables and secrets: ____
- [ ] Deployment with environments: ____

## Practice Log

This week I practiced by:
1. ______________________________________
2. ______________________________________
3. ______________________________________

## Notes

- ______________________________________
- ______________________________________
- ______________________________________

## Week 6 Completion

### Skills Assessment

| Skill | Rating (1-5) | Notes |
|-------|--------------|-------|
| GitLab basics | ___ | |
| Merge Requests | ___ | |
| CI/CD pipelines | ___ | |
| Pipeline optimization | ___ | |
| Variables & secrets | ___ | |
| Deployment | ___ | |
| **Week 6 Total** | ___/30 | |

### What's Next?

- [ ] Review weak areas from Week 6
- [ ] Start Week 7: Team Workflows
- [ ] Practice GitLab CI/CD in real project
- [ ] Set up GitLab account if not done

---

## Resources Referenced This Week

- [GitLab Documentation](https://docs.gitlab.com/)
- [GitLab CI/CD](https://docs.gitlab.com/ee/ci/)
- [Pipeline YAML Reference](https://docs.gitlab.com/ee/ci/yaml/)
- [Environments](https://docs.gitlab.com/ee/ci/environments/)

---

## Week 6 Complete!

**Course Progress**: 42/56 days complete (75%)

**Week 7 Next**: Team Workflows - Git Flow, GitHub Flow, and team collaboration

---

**Week 6 Status**: ✅ Complete  
**Week 6 Grade**: ___/100  
**Next**: Week 7 - Team Workflows
