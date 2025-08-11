#!/usr/bin/env bash
set -euo pipefail

DATE="${1:-$(date +%F)}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

DEST="$ROOT/daily/$DATE"
TEMPLATE="$ROOT/templates/daily"

if [ -d "$DEST" ]; then
  echo "Daily folder already exists: $DEST"
  exit 0
fi

mkdir -p "$DEST"
cp "$TEMPLATE"/*.md "$DEST"/

# Replace placeholders
for f in "$DEST"/*.md; do
  # Use BSD/GNU compatible sed (creates a .bak then remove it)
  sed -i.bak -e "s/{{DATE}}/$DATE/g" "$f" && rm -f "$f.bak"
done

echo "Created $DEST"
echo "Next steps:"
echo "  1) Edit $DEST/notes.md, quiz.md, checklist.md"
echo "  2) git add daily/$DATE"
echo "  3) git commit -m \"chore(daily): scaffold $DATE\" && git push"