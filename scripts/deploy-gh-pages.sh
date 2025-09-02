#!/usr/bin/env bash
set -euo pipefail
# Requires repo already pushed. Tries to configure Pages via GitHub CLI; otherwise prints manual steps.

GH_USER="${GH_USER:-}"
GH_REPO="${GH_REPO:-numberle}"

if [[ -z "${GH_USER}" ]]; then
  echo "[x] GH_USER is required (export GH_USER=your-github-username)" >&2
  exit 1
fi

if command -v gh >/dev/null 2>&1; then
  echo "[i] Configuring GitHub Pages to deploy from main / (root) via gh API..."
  if gh api -X GET "repos/${GH_USER}/${GH_REPO}/pages" >/dev/null 2>&1; then
    gh api -X PUT "repos/${GH_USER}/${GH_REPO}/pages" -f source[branch]=main -f source[path]=/
  else
    gh api -X POST "repos/${GH_USER}/${GH_REPO}/pages" -f source[branch]=main -f source[path]=/
  fi
  echo "[✓] Pages configured. URL should be: https://${GH_USER}.github.io/${GH_REPO}/"
else
  cat <<EOF
[i] GitHub CLI not found. Do this once in the UI:
   Repo → Settings → Pages → Source: Deploy from a branch → Branch: main → Folder: /(root) → Save.
   Your site will publish at: https://${GH_USER}.github.io/${GH_REPO}/
EOF
fi
