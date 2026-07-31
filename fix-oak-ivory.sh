#!/bin/bash

echo "🔥 Fixing Oak & Ivory GitHub Pages deployment..."
echo "-----------------------------------------------"

# Ensure public folder exists
mkdir -p public

echo "📁 Creating full Oak & Ivory website in /public..."

############################################
# INDEX.HTML
############################################
cat << 'EOF' > public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Oak & Ivory Hardwood Floors – Pontiac, MI</title>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Premium hardwood floor installation, sanding, refinishing, stairs, and repairs in Michigan.">
  <link rel="canonical" href="https://example.com/index.html">
  <meta name="robots" content="index,follow">

  <meta property="og:title" content="Oak & Ivory Hardwood Floors – Michigan">
  <meta property="og:description" content="Premium hardwood floor installation, sanding, refinishing, stairs, and repairs across Michigan.">
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://example.com/">
  <meta property="og:image" content="https://example.com/images/placeholder.jpg">

  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    "name": "Oak & Ivory Hardwood Floors",
    "description": "Hardwood floor installation, sanding, refinishing, stairs, and repairs serving all of Michigan.",
    "url": "https://example.com/",
    "areaServed": { "@type": "State", "name": "Michigan" },
    "serviceType": [
      "Hardwood installation",
      "Sanding and refinishing",
      "Stairs",
      "Repairs"
    ]
  }
  </script>

  <link rel="stylesheet" href="style.css">
</head>

<body>
  <header class="site-header">
    <div class="logo">Oak & Ivory</div>
    <nav class="nav">
      <a href="index.html">Home</a>
      <a href="services.html">Services</a>
      <a href="pricing.html">Pricing</a>
      <a href="portfolio.html">Portfolio</a>
      <a href="stain-gallery.html">Stain Gallery</a>
      <a href="floor-care.html">Floor Care</a>
      <a href="faq.html">FAQ</a>
      <a href="about.html">About</a>
      <a href="contact.html" class="nav-cta">Contact</a>
    </nav>
  </header>

  <section class="hero">
    <div class="hero-content">
      <h1>Hardwood Floors That Transform Your Home.</h1>
      <p>Installation, sanding, refinishing, stairs, and repairs—done right, the first time.</p>
      <div class="hero-actions">
        <a href="#" class="btn primary">Book with Jobber</a>
        <a href="portfolio.html" class="btn secondary">View Our Work</a>
      </div>
    </div>
  </section>

  <footer class="site-footer">
    <p>© 2026 Oak & Ivory Hardwood Floors – Pontiac, MI</p>
  </footer>
</body>
</html>
EOF

############################################
# OTHER PAGES
############################################

echo "📄 Creating additional pages..."

for page in services pricing portfolio stain-gallery floor-care faq about contact service-area; do
cat << 'EOF' > public/$page.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Oak & Ivory – PAGE</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Oak & Ivory – PAGE</h1>
  <p>Content coming soon.</p>
</body>
</html>
EOF
done

############################################
# CSS
############################################
echo "🎨 Creating style.css..."

cat << 'EOF' > public/style.css
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  background: #f8f8f8;
}
.site-header {
  background: #222;
  color: #fff;
  padding: 20px;
}
.nav a {
  color: #fff;
  margin-right: 15px;
  text-decoration: none;
}
.hero {
  background: #ddd;
  padding: 80px 20px;
  text-align: center;
}
EOF

############################################
# GITHUB PAGES WORKFLOW
############################################
echo "⚙️ Creating GitHub Pages workflow..."

mkdir -p .github/workflows

cat << 'EOF' > .github/workflows/deploy.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ "main" ]

permissions:
  contents: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Upload to GitHub Pages
        uses: actions/upload-pages-artifact@v2
        with:
          path: public

      - name: Deploy
        uses: actions/deploy-pages@v2
EOF

############################################
# CLEANUP
############################################
echo "🧹 Cleaning up old root index.html if exists..."
rm -f index.html

############################################
# GIT COMMIT & PUSH
############################################
echo "📤 Committing and pushing changes..."

git add .
git commit -m "Installed full Oak & Ivory website and GitHub Pages deployment"
git push

echo "✅ All done!"
echo "Your site will publish at:"
echo "👉 https://k1lllagt.github.io/oak-ivory/"
