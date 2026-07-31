#!/bin/bash

echo "🔧 Adding SEO meta tags to all HTML pages..."

GITHUB_URL="https://YOUR_GITHUB_PAGES_URL"

declare -A DESCRIPTIONS=(
  ["index.html"]="Premium hardwood floor installation, sanding, refinishing, stairs, and repairs in Pontiac, MI."
  ["services.html"]="Hardwood installation, sanding & refinishing, stairs, and repair services by Oak & Ivory."
  ["pricing.html"]="Transparent pricing for hardwood installation, refinishing, stairs, and repairs."
  ["portfolio.html"]="Completed hardwood flooring, refinishing, and stair projects by Oak & Ivory."
  ["stain-gallery.html"]="Explore stain colors and finish options for hardwood floors."
  ["contact.html"]="Contact Oak & Ivory Hardwood Floors for quotes, questions, and consultations."
)

for file in public/*.html; do
  filename=$(basename "$file")

  description="${DESCRIPTIONS[$filename]}"
  canonical="$GITHUB_URL/$filename"

  if grep -q "meta name=\"description\"" "$file"; then
    echo "⚠️  $filename already has SEO tags — skipping."
    continue
  fi

  echo "✨ Injecting SEO tags into $filename..."

  sed -i "/<head>/a \
<meta name=\"description\" content=\"$description\">\
<link rel=\"canonical\" href=\"$canonical\">\
<meta name=\"robots\" content=\"index,follow\">" "$file"
done

echo "✅ SEO tags added successfully."
