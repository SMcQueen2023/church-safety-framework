param(
  [Parameter(Mandatory=$true)][string]$Plan,
  [string]$Version = "",
  [string]$OutDir = "exports"
)
# export.ps1 — minimal exporter for church-safety-framework
# Usage:
#   pwsh scripts/export.ps1 -Plan security-team
#   pwsh scripts/export.ps1 -Plan medical-team -Version 0.2.0
#   pwsh scripts/export.ps1 -Plan parking-team -OutDir exports
#
# Notes:
# - Reads from:   plans/<Plan>.md
# - Writes to:    <OutDir>/<Plan>.md (+ .pdf if Pandoc is installed)
# - If -Version:  also writes to <OutDir>/releases/v<Version>/ and updates <OutDir>/latest/

$src = Join-Path "plans" "$Plan.md"
if (-not (Test-Path $src)) {
  Write-Error "Error: $src not found."
  exit 2
}

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$mdOut  = Join-Path $OutDir "$Plan.md"
$pdfOut = Join-Path $OutDir "$Plan.pdf"

# 1) Copy Markdown (single-file plans)
Copy-Item -Path $src -Destination $mdOut -Force

# 2) Optionally build PDF with pandoc
if (Get-Command pandoc -ErrorAction SilentlyContinue) {
  pandoc $mdOut -o $pdfOut
} else {
  Write-Host "pandoc not found; skipped PDF for $Plan."
}

# 3) Versioned release + latest (if provided)
if ($Version -ne "") {
  $relDir = Join-Path $OutDir ("releases/v" + $Version)
  New-Item -ItemType Directory -Force -Path $relDir | Out-Null
  Copy-Item $mdOut -Destination $relDir -Force
  if (Test-Path $pdfOut) { Copy-Item $pdfOut -Destination $relDir -Force }

  $latestDir = Join-Path $OutDir "latest"
  New-Item -ItemType Directory -Force -Path $latestDir | Out-Null
  Copy-Item $mdOut  -Destination (Join-Path $latestDir "$Plan.md") -Force
  if (Test-Path $pdfOut) { Copy-Item $pdfOut -Destination (Join-Path $latestDir "$Plan.pdf") -Force }
}

Write-Host ("Done -> {0} {1}" -f $mdOut, (Test-Path $pdfOut ? "and $pdfOut" : ""))
