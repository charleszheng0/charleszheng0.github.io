#!/bin/sh
# Copy the live site files from portfolio-prototype, then commit and push.
set -e
P=/Users/charleszheng/Desktop/claudeworkspace/portfolio-prototype
S=$(cd "$(dirname "$0")" && pwd)
{ printf '<!doctype html>\n<html lang="en">\n'; cat "$P/apartment.html"; } > "$S/index.html"
cp "$P/classic.html" "$P/resume.pdf" "$S/"
cp "$P"/models/*.json "$S/models/"
rsync -a --delete --exclude .DS_Store "$P/img/" "$S/img/"
touch "$S/.nojekyll"
cd "$S"; git add -A
git diff --cached --quiet || { git commit -m "Update site" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"; git push; }
