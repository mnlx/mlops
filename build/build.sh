#!/usr/bin/env bash
# Build the EPUB and PDF of "The Practical Guide to Audio Engineering"
# from the markdown chapters. Requires: pandoc, weasyprint.
set -euo pipefail
cd "$(dirname "$0")/.."

ORDER="01-what-is-sound 02-digital-audio 03-audio-formats 04-signal-chain \
05-preamps 06-cabinets 07-impulse-responses 08-nam 09-eq 10-effects \
11-effects-recipes 12-reaper appendix-a-frequency-chart appendix-b-glossary \
appendix-c-sources"

: > build/book.md
for f in $ORDER; do
  # strip inter-chapter navigation footers (lines containing "Back to Index")
  grep -v "Back to Index" "chapters/$f.md" >> build/book.md
  printf '\n\n' >> build/book.md
done

TITLE="The-Practical-Guide-to-Audio-Engineering"

pandoc build/metadata.yaml build/book.md -o "$TITLE.epub" \
  --toc --toc-depth=2 --top-level-division=chapter

pandoc build/metadata.yaml build/book.md -o "$TITLE.pdf" \
  --toc --toc-depth=2 --pdf-engine=weasyprint --css=build/style.css \
  --metadata title="The Practical Guide to Audio Engineering"

echo "Built $TITLE.epub and $TITLE.pdf"
