#!/bin/bash

echo "📁 Restructuring gwthardwoodfloors folder..."

mkdir -p public nginx public/images

# Move HTML files
mv *.html public/ 2>/dev/null

# Move CSS + JS
mv style.css public/ 2>/dev/null
mv main.js public/ 2>/dev/null

# Move NGINX configs
mv default.conf nginx/ 2>/dev/null
mv nginx.conf nginx/ 2>/dev/null

echo "✅ Folder restructure complete."
