# Day 52 Exercises: Submodules & Subtrees

## Exercise 1: Add a Submodule (20 min)

### Objective
Add another repo as a submodule.

### Steps

1. **Add submodule**
   ```bash
   git submodule add https://github.com/user/library.git libs/library
   ```

2. **Check result**
   ```bash
   ls libs/library
   cat .gitmodules
   git submodule status
   ```

3. **Commit**
   ```bash
   git add .gitmodules libs/library
   git commit -m "Add library submodule"
   ```

### Success Criteria
- [ ] Submodule added
- [ ] .gitmodules created
- [ ] Committed

---

## Exercise 2: Clone Repo with Submodules (15 min)

### Steps

1. **Clone**
   ```bash
   git clone https://github.com/user/main-repo.git
   cd main-repo
   ```

2. **Initialize submodules**
   ```bash
   git submodule init
   git submodule update
   # OR
   git clone --recurse-submodules https://github.com/user/main-repo.git
   ```

3. **Update submodules later**
   ```bash
   git submodule update --remote libs/library
   ```

### Success Criteria
- [ ] Submodules initialized
- [ ] Code available

---

## Exercise 3: Remove a Submodule (15 min)

### Steps

1. **Deinit**
   ```bash
   git submodule deinit libs/library
   ```

2. **Remove from git**
   ```bash
   git rm libs/library
   ```

3. **Commit**
   ```bash
   git commit -m "Remove library submodule"
   ```

### Success Criteria
- [ ] Submodule removed
- [ ] Files removed
- [ ] Committed
