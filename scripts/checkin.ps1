param(
  [Parameter(Mandatory=$true)][string]$GhUser,
  [string]$GhRepo = "numberle",
  [switch]$UseSsh
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path .git)) { git init | Out-Null }

git add . | Out-Null
try { git commit -m "feat: initial Numberle release" | Out-Null } catch { Write-Host "[info] Nothing to commit" }

git branch -M main | Out-Null

try {
  git remote get-url origin | Out-Null
} catch {
  if (Get-Command gh -ErrorAction SilentlyContinue) {
    try { gh repo view "$GhUser/$GhRepo" | Out-Null } catch { gh repo create "$GhUser/$GhRepo" --public -y | Out-Null }
  }
  if ($UseSsh) {
    git remote add origin ("git@github.com:{0}/{1}.git" -f $GhUser, $GhRepo)
  } else {
    git remote add origin ("https://github.com/{0}/{1}.git" -f $GhUser, $GhRepo)
  }
}

git push -u origin main
Write-Host "[ok] Pushed to https://github.com/$GhUser/$GhRepo (branch: main)"
