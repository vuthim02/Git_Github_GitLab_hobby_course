# Day 38: Common Mistakes - GitLab CI/CD

## Mistake 1: .gitlab-ci.yml Not in Root
**Fix:** Place in repository root, not in subfolder

## Mistake 2: Wrong Indentation
**Fix:** YAML is space-sensitive - use 2 spaces

## Mistake 3: No Stages Defined
**Fix:** Define stages before using them

## Mistake 4: Hardcoded Paths
**Fix:** Use correct relative paths

## Mistake 5: Not Waiting for Pipeline
**Fix:** Check pipeline status before merging

---

## Lesson: YAML formatting matters, place file in root