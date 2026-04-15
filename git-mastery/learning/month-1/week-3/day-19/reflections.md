# Day 19 Reflections: GitHub Setup & Pull Requests

## What I Learned Today

### Forking Workflow

```
Original Repo → Fork (on GitHub) → Clone (local)
                    ↑                    │
                    │                    ↓
                    ←──── PR ─────────────┘
```

### Remote Strategy

| Remote | Points to |
|--------|-----------|
| origin | Your fork |
| upstream | Original repo |

### Key Commands

```bash
git clone your-fork-url
git remote add upstream original-url
git fetch upstream
git merge upstream/main
git push origin feature
```

### Pull Request Process

1. Fork on GitHub
2. Clone locally
3. Create feature branch
4. Make changes
5. Push to your fork
6. Create PR on GitHub
7. Address feedback
8. PR merged

### Confidence Check (1-5)

- [ ] Forking repositories: ____
- [ ] Managing remotes: ____
- [ ] Syncing fork: ____
- [ ] Creating PRs: ____

### Tomorrow's Preview

Day 20: GitLab & Merge Requests
- GitLab differences from GitHub
- Merge requests (MRs)
- Similar workflows
- Code review features
