#!/usr/bin/env bash
# Build Flutter web and publish to the gh-pages branch (GitHub Pages).
set -euo pipefail

REPO_NAME="${GITHUB_REPOSITORY_NAME:-trainer-portfolio}"
BASE_HREF="/${REPO_NAME}/"

flutter pub get
flutter analyze
flutter test
flutter build web --release --base-href "${BASE_HREF}"
touch build/web/.nojekyll

WORK_DIR="$(mktemp -d)"
cp -a build/web/. "${WORK_DIR}/"

cd "${WORK_DIR}"
git init -b gh-pages
git add .
git commit -m "Deploy Flutter web ($(date -u +%Y-%m-%dT%H:%M:%SZ))"

REMOTE="${GITHUB_PAGES_REMOTE:-}"
if [[ -z "${REMOTE}" ]]; then
  echo "Set GITHUB_PAGES_REMOTE to your repo URL, e.g."
  echo "  GITHUB_PAGES_REMOTE=https://github.com/<user>/trainer-portfolio.git"
  exit 1
fi

git remote add origin "${REMOTE}"
git push -f origin gh-pages

echo "Published. Enable Pages: branch gh-pages, folder / (if not already)."
