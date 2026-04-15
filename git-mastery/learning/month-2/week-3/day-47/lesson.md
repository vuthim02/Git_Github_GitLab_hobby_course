# Day 47: Commit Conventions

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                          GIT MASTERY - DAY 47                                ║
║                         COMMIT CONVENTIONS                                 ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

## Today's Objectives

- [ ] Understand commit message conventions
- [ ] Use conventional commits
- [ ] Write effective messages
- [ ] Automate changelog generation

---

## Theory: Commit Conventions

### Why Conventions Matter

1. **Clear history** - Understand changes
2. **Changelogs** - Generate automatically
3. **Semantic versioning** - Know impact
4. **Searchability** - Find changes

---

## Conventional Commits

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types

| Type | Description |
|------|-------------|
| feat | New feature |
| fix | Bug fix |
| docs | Documentation |
| style | Formatting |
| refactor | Code refactor |
| test | Tests |
| chore | Maintenance |

### Examples

```
feat(auth): add login form

fix(api): handle missing user

docs(readme): update installation steps

refactor(utils): simplify validation
```

---

## Writing Good Commits

### Good Commit Message

```
Add user authentication flow

- Add login/logout functionality
- Store session in localStorage
- Add protected routes
- Include form validation

Closes #123
```

### Bad Commit Message

```
fixed stuff
```

---

## Reading References

### Conventional Commits
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Git Commit Messages](https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History)

### Atlassian
- [Writing Commit Messages](https://www.atlassian.com/git/tutorials/comparing-workflows/write-a-good-commit-message)

## Checklist

- [ ] Use conventional commits
- [ ] Write descriptive messages
- [ ] Use body and footer