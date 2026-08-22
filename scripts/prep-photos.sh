#!/bin/bash
# Resize kitchen photos for the gallery page.
#
#   ./scripts/prep-photos.sh ~/Desktop/reprise-photos
#
# File names do not matter. Every image in the folder is resized to 1400px and
# written to assets/gallery/ as photo-01.jpg, photo-02.jpg, ... in sorted order.
# HEIC, JPEG and PNG all work.

set -euo pipefail
SRC="${1:-$HOME/Desktop/reprise-photos}"
if [ ! -d "$SRC" ]; then
  echo "No such folder: $SRC" >&2
  echo "usage: $0 [folder-with-photos]" >&2
  exit 1
fi
HERE="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$HERE/assets/gallery"
mkdir -p "$OUT"
rm -f "$OUT"/photo-*.jpg

n=0
while IFS= read -r f; do
  n=$((n+1))
  dest="$(printf '%s/photo-%02d.jpg' "$OUT" "$n")"
  sips -s format jpeg -s formatOptions 84 -Z 1400 "$f" --out "$dest" >/dev/null 2>&1 || {
    echo "  skipped (unreadable): $(basename "$f")"; n=$((n-1)); continue; }
  printf '  %-38s -> assets/gallery/photo-%02d.jpg  (%s KB)\n' \
    "$(basename "$f")" "$n" "$(( $(stat -f%z "$dest") / 1024 ))"
done < <(find "$SRC" -maxdepth 1 -type f \
           \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.heic' \) | sort)

echo
if [ "$n" -eq 0 ]; then
  echo "No images found in $SRC"
else
  echo "$n photo(s) ready in assets/gallery/."
  echo "Tell Claude they are in place and it will match them to the gallery captions."
fi
