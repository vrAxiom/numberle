#!/usr/bin/env bash
set -euo pipefail
# Usage: GH_USER="your-username" GH_REPO="numberle" ./scripts/checkin.sh
# Optional: USE_SSH=1 to use SSH remote

GH_USER="${GH_USER:-}"
GH_REPO="${GH_REPO:-numberle}"
USE_SSH="${USE_SSH:-0}"

if [[ -z "${GH_USER}" ]]; then
  echo "[x] GH_USER is required (export GH_USER=your-github-username)" >&2
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git init
fi

git add . || true
if ! git commit -m "feat: initial Numberle release" 2>/dev/null; then
  echo "[i] Nothing to commit (working tree clean)"
fi

git branch -M main || true

if ! git remote get-url origin >/dev/null 2>&1; then
  if command -v gh >/dev/null 2>&1; then
    gh repo view "${GH_USER}/${GH_REPO}" >/dev/null 2>&1 || gh repo create "${GH_USER}/${GH_REPO}" --public -y
  fi
  if [[ "${USE_SSH}" == "1" ]]; then
    git remote add origin "git@github.com:${GH_USER}/${GH_REPO}.git"
  else
    git remote add origin "https://github.com/${GH_USER}/${GH_REPO}.git"
  fi
fi

git push -u origin main

echo "[✓] Pushed to https://github.com/${GH_USER}/${GH_REPO} (branch: main)"
