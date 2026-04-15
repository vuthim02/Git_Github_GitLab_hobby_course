# Day 48: Release Management

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 48                                ║
║                          RELEASE MANAGEMENT                                ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand versioning
- [ ] Create releases
- [ ] Automate releases
- [ ] Use tags

---

## Theory: Release Management

### Semantic Versioning

```
MAJOR.MINOR.PATCH
1.0.0

- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes
```

### Tagging Releases

```bash
# Create tag
git tag v1.0.0 -m "Release 1.0.0"

# Push tag
git push origin v1.0.0

# List tags
git tag -l
```

### GitHub Releases

1. Go to repository
2. Click "Releases"
3. Click "Draft a new release"
4. Select tag
5. Add release notes
6. Publish

### Release Workflow

```bash
# Update version
npm version patch
# or: npm version minor
# or: npm version major

# Tag automatically created
# Push with tags
git push --follow-tags
```

---

## Automatic Changelogs

```yaml
# changelog.json
{
  "github_token": "...",
  "projects": ["owner/repo"]
}
```

---

## Reading References

### Git SCM Documentation
- [Git Tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging)
- [Releasing](https://git-scm.com/book/en/v2/Distributed-Git-Maintaining-a-Project)

### GitHub Docs
- [Managing Releases](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/about-releases)

## Checklist

- [ ] Use semantic versioning
- [ ] Create releases
- [ ] Use tags