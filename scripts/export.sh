#!/usr/bin/env bash
# export.sh — minimal exporter for church-safety-framework
# Usage:
#   bash scripts/export.sh <plan> [-v <version>] [-o <outdir>]
# Examples:
#   bash scripts/export.sh security-team
#   bash scripts/export.sh medical-team -v 0.2.0
#   bash scripts/export.sh parking-team -o exports
#
# Notes:
# - Reads from:   plans/<plan>.md
# - Writes to:    <outdir>/<plan>.md (+ .pdf if Pandoc is installed)
# - If -v is set: also writes to <outdir>/releases/v<version>/ and updates <outdir>/latest/

set -euo pipefail

usage() {
  echo "Usage: $0 <plan> [-v <version>] [-o <outdir>]" >&2
  exit 1
}

PLAN="${1:-}"
shift || true

VERSION=""
OUTDIR="exports"

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    -v|--version)
      VERSION="${2:-}"; shift 2 || usage ;;
    -o|--outdir)
      OUTDIR="${2:-}"; shift 2 || usage ;;
    -h|--help)
      usage ;;
    *)
      echo "Unknown option: $1" >&2; usage ;;
  esac
done

[[ -z "$PLAN" ]] && usage

SRC="plans/${PLAN}.md"
[[ -f "$SRC" ]] || { echo "Error: $SRC not found." >&2; exit 2; }

mkdir -p "$OUTDIR"

MD_OUT="${OUTDIR}/${PLAN}.md"
PDF_OUT="${OUTDIR}/${PLAN}.pdf"

# 1) Copy Markdown (this repo uses single-file plans)
cp "$SRC" "$MD_OUT"

# 2) Optionally build PDF if pandoc is available
if command -v pandoc >/dev/null 2>&1; then
  pandoc "$MD_OUT" -o "$PDF_OUT"
else
  echo "pandoc not found; skipped PDF for ${PLAN}."
fi

# 3) Versioned release + latest pointers (if version provided)
if [[ -n "${VERSION}" ]]; then
  REL_DIR="${OUTDIR}/releases/v${VERSION}"
  mkdir -p "$REL_DIR"
  cp "$MD_OUT" "$REL_DIR/"
  [[ -f "$PDF_OUT" ]] && cp "$PDF_OUT" "$REL_DIR/" || true

  LATEST_DIR="${OUTDIR}/latest"
  mkdir -p "$LATEST_DIR"
  cp "$MD_OUT" "$LATEST_DIR/${PLAN}.md"
  [[ -f "$PDF_OUT" ]] && cp "$PDF_OUT" "$LATEST_DIR/${PLAN}.pdf" || true
fi

echo "Done -> ${MD_OUT} $( [[ -f "$PDF_OUT" ]] && echo "and ${PDF_OUT}" )."
