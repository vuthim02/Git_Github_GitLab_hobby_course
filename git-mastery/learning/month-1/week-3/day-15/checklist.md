# Day 15 Checklist: Git Remote Basics

## Pre-Lesson

- [ ] Day 14 concepts reviewed
- [ ] Understanding of local repos
- [ ] Git installed

## Remote Commands

- [ ] `git remote -v` - List remotes
- [ ] `git remote add <name> <url>` - Add remote
- [ ] `git remote remove <name>` - Remove remote
- [ ] `git remote rename <old> <new>` - Rename
- [ ] `git remote set-url <name> <url>` - Change URL
- [ ] `git remote show <name>` - Show details

## Remote URLs

### HTTPS
```
https://github.com/user/repo.git
```
Requires username/password each time (or token)

### SSH
```
git@github.com:user/repo.git
```
Uses SSH keys, no password needed

## Naming Conventions

- `origin` - Your fork/main remote
- `upstream` - Original repository (for forks)
- `production` - Production server
- Custom names allowed

## Post-Lesson

- [ ] Can add remotes
- [ ] Can remove remotes
- [ ] Can change URLs
- [ ] Ready for Day 16: Cloning & Fetching
