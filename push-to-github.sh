#!/bin/bash
# Replace or set REPO_URL if needed. For PAT auth, export GITHUB_TOKEN and uncomment the token line below.
REPO_URL="https://github.com/Abdulsami12166/Weather-Web-App.git"
# REPO_URL="https://${GITHUB_TOKEN}@github.com/Abdulsami12166/Weather-Web-App.git"

# Run from project root: bash push-to-github.sh
set -e

# Initialize repo if not already
if [ ! -d .git ]; then
  git init
fi

git add .
git commit -m "Add Weather app" || echo "No changes to commit"

git branch -M main
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

# Try to fetch/pull then push (safe for existing remote)
git fetch origin || true
git pull --rebase origin main || true
git push -u origin main
