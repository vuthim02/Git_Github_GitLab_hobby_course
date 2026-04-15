# Day 33: Common Mistakes - GitHub Actions Intro

## Mistake 1: Wrong Node Version

**Wrong:**
```yaml
- uses: actions/setup-node@v4
  with:
    node-version: '17'  # Not LTS, might fail
```

**Right:**
```yaml
- uses: actions/setup-node@v4
  with:
    node-version: '20'  # LTS version
```

**Why:** Non-LTS versions may not be available.

---

## Mistake 2: Forgetting to Checkout

**Wrong:**
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - run: npm ci  # No code!
```

**Right:**
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - run: npm ci
```

**Why:** Need code before building.

---

## Mistake 3: Not Using Cache

**Problem:** Workflows take too long.

**Solution:**
```yaml
- uses: actions/setup-node@v4
  with:
    node-version: '20'
    cache: 'npm'
```

**Why:** Caches node_modules between runs.

---

## Mistake 4: Incorrect YAML Indentation

**Wrong:**
```yaml
jobs:
build:     # Wrong! Needs 2 more spaces
  runs-on: ubuntu-latest
```

**Right:**
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
```

**Why:** YAML is space-sensitive.

---

## Mistake 5: Using Wrong Action Version

**Wrong:**
```yaml
- uses: actions/setup-node@v1  # Outdated
```

**Right:**
```yaml
- uses: actions/setup-node@v4  # Current
```

**Why:** Old versions may have bugs.

---

## Mistake 6: Not Using needs

**Problem:** Jobs run in random order.

**Solution:**
```yaml
jobs:
  test:
    needs: lint
    runs-on: ubuntu-latest
    steps:
    - run: npm test
```

**Why:** Dependencies not clear.

---

## Mistake 7: Hardcoding Secrets in Workflow

**Wrong:**
```yaml
- run: npm run deploy
  env:
    API_KEY: "abc123"  # Never do this!
```

**Right:**
```yaml
- run: npm run deploy
  env:
    API_KEY: ${{ secrets.API_KEY }}
```

**Why:** Secrets should be in repository settings.

---

## Mistake 8: Not Using fail-fast

**Problem:** Matrix runs all stop on first failure.

**Solution:**
```yaml
strategy:
  fail-fast: false
  matrix:
    node-version: [18, 20, 22]
```

**Why:** See all test results.

---

## Mistake 9: Wrong Trigger

**Problem:** Workflow runs on every push.

**Solution:**
```yaml
on:
  push:
    branches: [main]  # Only main branch
```

**Why:** Save resources.

---

## Mistake 10: No Timeout

**Problem:** Workflow stuck running forever.

**Solution:**
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    timeout-minutes: 10
```

**Why:** Prevent infinite runs.

---

## Mistake 11: Using Latest Without Version

**Problem:** Unpredictable behavior.

**Wrong:**
```yaml
- uses: actions/checkout@master  # Risky!
```

**Right:**
```yaml
- uses: actions/checkout@v4  # Specific version
```

**Why:** master could break.

---

## Mistake 12: Not Filtering Paths

**Problem:** Workflow runs for docs changes.

**Solution:**
```yaml
on:
  push:
    paths:
      - 'src/**'
      - 'tests/**'
```

**Why:** Only run when code changes.

---

## Lesson Learned

> "GitHub Actions makes CI/CD accessible to everyone. Start simple, iterate."

**Golden Rules:**
1. Always checkout code first
2. Use specific action versions
3. Add caching for speed
4. Use jobs and dependencies
5. Store secrets in settings
6. Test locally with PRs first