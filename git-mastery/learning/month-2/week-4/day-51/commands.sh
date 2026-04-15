#!/bin/bash

# Day 51: Bisect for Bug Finding

# Start bisect
git bisect start

# Mark current as bad
git bisect bad

# Mark known good commit
git bisect good v1.0.0

# Test and mark
git bisect good  # or git bisect bad
# Repeat until found

# Exit bisect
git bisect reset