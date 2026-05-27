# Multiple GitHub Accounts on the Same Computer

Complete professional guide for using multiple GitHub accounts on Linux, Kali Linux, Ubuntu, WSL, macOS, and Windows.

---

# Table of Contents

1. Introduction
2. Requirements
3. Understanding the Problem
4. SSH Authentication Overview
5. Generate SSH Keys
6. Start SSH Agent
7. Add SSH Keys
8. Add SSH Keys to GitHub
9. Configure SSH Config
10. Test Connections
11. Clone Repositories Correctly
12. Configure Git Identity Per Repository
13. Global Git Configuration
14. Change Existing Repository Account
15. Verify Everything
16. Recommended Project Structure
17. Troubleshooting
18. Security Best Practices
19. Advanced Setup
20. Useful Commands
21. References

---

# 1. Introduction

This guide teaches you how to use multiple GitHub accounts on the same computer using SSH authentication.

Example:

- Personal GitHub account
- Work GitHub account
- School GitHub account
- Client GitHub account

This setup works perfectly for:

- Full Stack Development
- Open Source Development
- DevOps
- Team Collaboration
- Freelancing
- Enterprise Development

---

# 2. Requirements

Required software:

- Git
- OpenSSH

Verify installation:

```bash
git --version
ssh -V
```

---

# 3. Understanding the Problem

By default:

- GitHub uses one SSH identity
- Git uses one global username/email

This causes problems:

- Wrong GitHub account pushes code
- Wrong commit email
- Authentication conflicts

Solution:

- One SSH key per account
- SSH aliases
- Per-project Git configuration

---

# 4. SSH Authentication Overview

SSH authentication uses:

- Private Key
- Public Key

Files:

```text
id_ed25519          -> Private key
id_ed25519.pub      -> Public key
```

Important:

- Private key stays on your computer
- Public key goes to GitHub

---

# 5. Generate SSH Keys

Create separate keys for each account.

---

## Personal Account

```bash
ssh-keygen -t ed25519 -C "personal@example.com"
```

Save as:

```text
~/.ssh/id_ed25519_personal
```

---

## Work Account

```bash
ssh-keygen -t ed25519 -C "work@example.com"
```

Save as:

```text
~/.ssh/id_ed25519_work
```

---

## School Account

```bash
ssh-keygen -t ed25519 -C "school@example.com"
```

Save as:

```text
~/.ssh/id_ed25519_school
```

---

# 6. Start SSH Agent

Linux/macOS:

```bash
eval "$(ssh-agent -s)"
```

Windows Git Bash:

```bash
eval $(ssh-agent -s)
```

---

# 7. Add SSH Keys

Add all keys:

```bash
ssh-add ~/.ssh/id_ed25519_personal
ssh-add ~/.ssh/id_ed25519_work
ssh-add ~/.ssh/id_ed25519_school
```

Verify:

```bash
ssh-add -l
```

---

# 8. Add SSH Keys to GitHub

Display public key:

```bash
cat ~/.ssh/id_ed25519_personal.pub
```

Copy output.

Go to GitHub:

https://github.com/settings/keys

Add SSH key.

Repeat for every account.

---

# 9. Configure SSH Config

Create file:

```bash
nano ~/.ssh/config
```

---

## Example SSH Config

```ssh
# Personal GitHub
Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal

# Work GitHub
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work

# School GitHub
Host github-school
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_school
```

Save and exit.

---

# 10. File Permissions

Fix permissions:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_ed25519*
chmod 644 ~/.ssh/*.pub
```

---

# 11. Test Connections

---

## Personal

```bash
ssh -T git@github-personal
```

Expected:

```text
Hi username! You've successfully authenticated...
```

---

## Work

```bash
ssh -T git@github-work
```

---

## School

```bash
ssh -T git@github-school
```

---

# 12. Clone Repositories Correctly

IMPORTANT:

Do NOT use:

```bash
git clone git@github.com:user/repo.git
```

Use aliases instead.

---

## Personal Repository

```bash
git clone git@github-personal:user/repo.git
```

---

## Work Repository

```bash
git clone git@github-work:company/backend.git
```

---

## School Repository

```bash
git clone git@github-school:school/project.git
```

---

# 13. Configure Git Identity Per Repository

Go into project:

```bash
cd project-name
```

---

## Personal Project

```bash
git config user.name "Personal Name"
git config user.email "personal@example.com"
```

---

## Work Project

```bash
git config user.name "Work Name"
git config user.email "work@example.com"
```

---

## School Project

```bash
git config user.name "Student Name"
git config user.email "school@example.com"
```

---

# 14. Verify Repository Configuration

```bash
git config --list
```

Check:

```text
user.name=
user.email=
```

---

# 15. Global Git Configuration

Optional default identity:

```bash
git config --global user.name "Default Name"
git config --global user.email "default@example.com"
```

Local repository settings override global settings.

---

# 16. Verify Remote URL

Check repository remote:

```bash
git remote -v
```

Correct example:

```text
origin git@github-work:company/api.git (fetch)
origin git@github-work:company/api.git (push)
```

---

# 17. Change Existing Repository Account

Change remote URL:

```bash
git remote set-url origin git@github-work:company/repo.git
```

Verify:

```bash
git remote -v
```

---

# 18. Recommended SSH Structure

```text
~/.ssh/
├── config
├── id_ed25519_personal
├── id_ed25519_personal.pub
├── id_ed25519_work
├── id_ed25519_work.pub
├── id_ed25519_school
├── id_ed25519_school.pub
```

---

# 19. Automatic SSH Agent Loading

---

## Linux/macOS

Add to:

```bash
~/.bashrc
```

or:

```bash
~/.zshrc
```

```bash
eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519_personal
ssh-add ~/.ssh/id_ed25519_work
ssh-add ~/.ssh/id_ed25519_school
```

Reload:

```bash
source ~/.bashrc
```

---

# 20. Troubleshooting

---

## Permission denied (publickey)

Solution:

```bash
ssh-add ~/.ssh/id_ed25519_personal
```

Verify:

```bash
ssh-add -l
```

---

## Wrong Account Used

Check remote:

```bash
git remote -v
```

You probably used:

```text
github.com
```

instead of:

```text
github-work
```

---

## SSH Config Ignored

Check:

```bash
cat ~/.ssh/config
```

Verify permissions:

```bash
chmod 600 ~/.ssh/config
```

---

## Git Uses Wrong Email

Check:

```bash
git config user.email
```

Fix:

```bash
git config user.email "correct@example.com"
```

---

# 21. Advanced Setup

---

## Separate SSH Keys for Clients

Example:

```ssh
Host github-clientA
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_clientA
```

---

## Use Different Signing Keys

Generate GPG key:

```bash
gpg --full-generate-key
```

Configure:

```bash
git config --global user.signingkey YOUR_KEY_ID
```

---

# 22. Security Best Practices

---

## NEVER Share Private Keys

Never share:

```text
id_ed25519
```

---

## Use Passphrases

When generating keys:

```text
Enter passphrase:
```

Use strong passphrase.

---

## Backup Keys Securely

Recommended:

- Encrypted USB
- Password manager
- Encrypted cloud backup

---

# 23. Useful Commands

---

## Show Current Repository User

```bash
git config user.name
git config user.email
```

---

## Show Global Git Config

```bash
git config --global --list
```

---

## Show Local Git Config

```bash
git config --local --list
```

---

## Show SSH Keys

```bash
ls -al ~/.ssh
```

---

## Show SSH Agent Keys

```bash
ssh-add -l
```

---

## Test SSH

```bash
ssh -T git@github-personal
```

---

# 24. Workflow Example

---

## Clone Personal Project

```bash
git clone git@github-personal:timham/frontend.git
```

---

## Clone Work Project

```bash
git clone git@github-work:company/backend.git
```

---

## Configure Identity

```bash
cd backend

git config user.name "John Doe"
git config user.email "john@company.com"
```

---

## Push Code

```bash
git add .
git commit -m "Initial commit"
git push
```

---

# 25. References

GitHub SSH Documentation:

https://docs.github.com/en/authentication/connecting-to-github-with-ssh

Git Documentation:

https://git-scm.com/doc

GitHub:

https://github.com

---

# Final Notes

Best recommended method:

- SSH authentication
- One SSH key per account
- SSH config aliases
- Per-project Git configuration

This method scales professionally for:

- Open source
- Teams
- Companies
- Freelancing
- Enterprise environments
- DevOps
- Full stack development
