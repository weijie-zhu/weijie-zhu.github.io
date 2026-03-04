#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[validate] Building site"
hugo --minify >/dev/null

required_outputs=(
  "public/llms.txt"
  "public/llms-full.txt"
  "public/robots.txt"
  "public/sitemap.xml"
)

for file in "${required_outputs[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "[validate] Missing required output: $file" >&2
    exit 1
  fi
done

echo "[validate] Checking front matter quality"
missing_desc=$(rg --files content | rg '\.md$' | while read -r f; do
  [[ "$f" == "content/ai-policy.md" ]] && continue
  if rg -q '^draft:\s*true' "$f"; then
    continue
  fi
  if ! rg -q '^description:\s*".+"' "$f"; then
    echo "$f"
  fi
done)

if [[ -n "$missing_desc" ]]; then
  echo "[validate] Missing non-empty description in:" >&2
  echo "$missing_desc" >&2
  exit 1
fi

missing_summary=$(rg --files content | rg '\.md$' | while read -r f; do
  [[ "$f" == "content/ai-policy.md" ]] && continue
  if rg -q '^draft:\s*true' "$f"; then
    continue
  fi
  # View/photo pages can use description only; summary is optional there.
  if [[ "$f" == content/view/* ]]; then
    continue
  fi
  if ! rg -q '^summary:\s*".+"' "$f"; then
    echo "$f"
  fi
done)

if [[ -n "$missing_summary" ]]; then
  echo "[validate] Missing non-empty summary in:" >&2
  echo "$missing_summary" >&2
  exit 1
fi

missing_view_desc=$(rg --files content/view | rg '\.md$' | while read -r f; do
  if ! rg -q '^description:\s*".+"' "$f"; then
    echo "$f"
  fi
done)

if [[ -n "$missing_view_desc" ]]; then
  echo "[validate] Missing non-empty description in view pages:" >&2
  echo "$missing_view_desc" >&2
  exit 1
fi

echo "[validate] LLM readiness checks passed"
