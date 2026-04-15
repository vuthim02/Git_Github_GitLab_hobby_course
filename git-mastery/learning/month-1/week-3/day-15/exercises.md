# Day 15 Exercises: Git Remote Basics

## Exercise 1: Initial Remote Setup

1. Create a new directory `remote-basics`
2. Initialize Git
3. Check for existing remotes
4. Add a remote named `origin`
5. Verify with `git remote -v`

## Exercise 2: Multiple Remotes

Configure both origin and upstream:
```bash
git remote add origin https://github.com/you/repo.git
git remote add upstream https://github.com/original/repo.git
```

Verify both show with `git remote -v`

## Exercise 3: Remote Information

Run these commands and note the differences:
```bash
git remote -v          # List with URLs
git remote show origin # Detailed info
git remote -vv         # With push/fetch URLs
```

## Exercise 4: Change Remote URL

Change from HTTPS to SSH:
```bash
git remote set-url origin git@github.com:user/repo.git
```

Then change back to HTTPS.

## Exercise 5: Rename and Remove

Practice renaming:
```bash
git remote rename origin github
git remote -v
git remote rename github origin
```

Practice removing:
```bash
git remote remove origin
git remote -v
```

## Challenge

Create a script that:
1. Creates a new repo
2. Adds a remote
3. Shows remote info
4. Cleans up
