# Numberle — 5‑Digit Wordle with Target Sum

Live (after setup): `https://<your-username>.github.io/numberle/`

## What’s inside
- Single-file **index.html** (React UMD, Tailwind CDN, Help modal, pastel UI)
- **.nojekyll** to disable Jekyll
- **LICENSE** (MIT, 2025 © Pankaj) — edit if needed
- **CNAME** (optional) for custom domain
- Scripts: Bash + PowerShell to **check in** and **configure GitHub Pages**
- Optional **GitHub Actions** workflow to deploy on every push to `main`

## Quick start (Bash)
```bash
export GH_USER=<your-github-username>
export GH_REPO=numberle
./scripts/checkin.sh
./scripts/deploy-gh-pages.sh
# Open: https://$GH_USER.github.io/$GH_REPO/
```

## Quick start (PowerShell)
```powershell
./scripts/checkin.ps1 -GhUser <your-github-username> -GhRepo numberle
./scripts/deploy-gh-pages.ps1 -GhUser <your-github-username> -GhRepo numberle
# Open: https://<your-github-username>.github.io/numberle/
```

## Manual Pages setup (if you don’t use scripts)
Repo → **Settings → Pages** → Source: **Deploy from a branch** → Branch: `main` → Folder: `/ (root)` → Save.

## Custom domain (optional)
- Create DNS **CNAME** for `numberle.yourdomain.com` → `<your-username>.github.io`
- Put the exact domain in the repo **CNAME** file
