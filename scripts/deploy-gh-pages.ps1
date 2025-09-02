param(
  [Parameter(Mandatory=$true)][string]$GhUser,
  [string]$GhRepo = "numberle"
)
$ErrorActionPreference = "Stop"

if (Get-Command gh -ErrorAction SilentlyContinue) {
  Write-Host "[i] Configuring Pages via GitHub CLI..."
  try {
    gh api -X GET "repos/$GhUser/$GhRepo/pages" | Out-Null
    gh api -X PUT "repos/$GhUser/$GhRepo/pages" -f source[branch]=main -f source[path]=/
  } catch {
    gh api -X POST "repos/$GhUser/$GhRepo/pages" -f source[branch]=main -f source[path]=/
  }
  Write-Host "[✓] Pages configured: https://$GhUser.github.io/$GhRepo/"
} else {
  Write-Host "[i] gh not found. In the repo UI: Settings → Pages → Source: Deploy from a branch → Branch: main → /(root)."
}
