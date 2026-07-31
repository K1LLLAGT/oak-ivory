#!/usr/bin/env bash
# GWT site update — safe to run on any repo state (idempotent).
#   1) Removes the portfolio (page + homepage feature + links) if still present
#   2) Installs the new Duraseal stain gallery
# Run from inside your repo:  bash update-site.sh
set -e

# --- 1. Portfolio removal (no-ops if already done) ---
sed -i '/<li><a href="portfolio.html">Portfolio<\/a><\/li>/d' *.html
sed -i 's|<li><a href="portfolio.html">Project Portfolio</a></li>||g' *.html
sed -i 's|<a class="btn btn--ghost" href="portfolio.html">See our work</a>|<a class="btn btn--ghost" href="services.html">Explore our services</a>|' index.html
perl -0777 -i -pe 's/    <!-- FEATURED PROJECT -->.*?    <\/section>\n\n//s' index.html
sed -i 's|Our WheatStone Oak finish in the portfolio came from|Our WheatStone Oak finish came from|' faq.html
sed -i 's|The WheatStone Oak finish in our portfolio was|Our WheatStone Oak finish was|' services.html
rm -f portfolio.html

# --- 2. Install the new Duraseal stain gallery ---
cat > stain-gallery.html << 'GWTEOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Duraseal Stain Colors — Hardwood Floor Stain Gallery | GWT Hardwood Floors</title>
  <meta name="description" content="The full Duraseal hardwood stain lineup we work from — from Country White and Golden Oak to Jacobean and True Black — plus our signature WheatStone Oak custom blend.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500;9..144,600;9..144,700&family=Hanken+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <script>document.documentElement.classList.add('js');</script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <nav class="nav" aria-label="Primary">
        <a class="brand" href="index.html"><span class="brand-mark">GWT</span><span><span class="brand-name">GWT Hardwood Floors</span><span class="brand-sub">Pontiac · Metro Detroit</span></span></a>
        <button class="nav-toggle" aria-label="Toggle menu" aria-expanded="false" aria-controls="nav-links"><span></span></button>
        <ul class="nav-links" id="nav-links">
          <li><a href="index.html">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="stain-gallery.html" class="active">Stain Gallery</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="faq.html">FAQ</a></li>
          <li><a href="floor-care.html">Floor Care</a></li>
          <li><a href="pricing.html">Pricing</a></li>
          <li class="nav-cta"><a class="btn" href="pricing.html#quote">Get a quote</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <main>
    <section class="page-hero">
      <div class="container">
        <span class="eyebrow">Stain Gallery</span>
        <h1>The Duraseal colors we work from</h1>
        <p>We finish almost every floor with Duraseal stains — a deep, reliable line we know inside and out. Below is the full Duraseal range to get your eye going. The same stain looks different on every species, grain, and room's light, so we always prove your final color on a sample board milled from your own floor.</p>
      </div>
    </section>

    <!-- INTRO + WHEATSTONE HIGHLIGHT -->
    <section class="section">
      <div class="container">
        <div class="split reveal">
          <div>
            <span class="eyebrow">Why custom?</span>
            <h2>The same stain, two different floors</h2>
            <p>Wood is a living material. A color that reads warm on white oak can turn pink on red oak; a gray that looks perfect in showroom light can go cold in a north-facing room. That's why we treat a color chart as a starting point, never a final answer.</p>
            <p style="margin-top:1rem">We blend from the full Duraseal line and prove the result on sample boards built from your actual floor — next to your cabinets, your trim, and your daylight. Some of our best colors, like our signature WheatStone Oak, are two Duraseal stains mixed by hand.</p>
          </div>
          <div class="stain-card" style="align-self:start">
            <div class="swatch swatch-grain" style="height:190px;background:linear-gradient(135deg,#c8b294,#b39c7e 55%,#a8927a)"></div>
            <div class="stain-body">
              <div class="stain-name">WheatStone Oak</div>
              <div class="stain-formula">Our signature blend · Duraseal Nutmeg + Country White (1:1)</div>
              <p style="font-size:.9rem;color:var(--muted);margin-top:.7rem">A desaturated light-brown with gray, green-neutralizing, and soft pink-oak undertones — modern, high-end, and equally at home with warm or cool interiors.</p>
              <span class="stain-tag">Hand-mixed from two Duraseal stains</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- DURASEAL FAMILIES -->
    <section class="section section--paper">
      <div class="container">
        <div class="section-head reveal">
          <span class="eyebrow">The Duraseal range</span>
          <h2>Find a direction for your floor</h2>
          <p>The full Duraseal stain line, grouped by tone. These swatches are on-screen approximations to help you narrow things down — for each color photographed on real White Oak and Red Oak, see Duraseal's official gallery linked below. Your final color is always proven on a sample board first.</p>
          <div style="margin-top:1.4rem"><a class="btn btn--ghost" href="https://www.duraseal.com/stain-gallery/" target="_blank" rel="noopener">View Duraseal's official gallery →</a></div>
        </div>

        <div class="stain-family reveal">
          <h3>Whites &amp; Neutrals</h3>
          <p>Pickled and near-natural tones that keep the floor bright and open.</p>
          <div class="swatch-grid">
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#e3d4b8,#d3c09f)"></div><div class="tile-body"><div class="tile-name">Neutral</div><div class="tile-note">Clear, near-natural</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#d9c8ad,#c7b48f)"></div><div class="tile-body"><div class="tile-name">Country White</div><div class="tile-note">Soft whitewash</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#cbb491,#b39a73)"></div><div class="tile-body"><div class="tile-name">Rustic Beige</div><div class="tile-note">Light warm beige</div></div></div>
          </div>
        </div>

        <div class="stain-family reveal">
          <h3>Grays</h3>
          <p>Cool, contemporary grays — from soft driftwood to deep charcoal.</p>
          <div class="swatch-grid">
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#b6ab9d,#9d9285)"></div><div class="tile-body"><div class="tile-name">Silvered Gray</div><div class="tile-note">Pale silvery gray</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#aaa298,#918980)"></div><div class="tile-body"><div class="tile-name">Classic Gray</div><div class="tile-note">Neutral light gray</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#a2978a,#887d70)"></div><div class="tile-body"><div class="tile-name">Warm Gray</div><div class="tile-note">Soft greige</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#b1a58f,#978b75)"></div><div class="tile-body"><div class="tile-name">Weathered Oak</div><div class="tile-note">Driftwood gray-tan</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#8d8070,#6f6453)"></div><div class="tile-body"><div class="tile-name">Aged Barrel</div><div class="tile-note">Weathered gray-brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#6e6962,#4f4b46)"></div><div class="tile-body"><div class="tile-name">Dark Gray</div><div class="tile-note">Deep charcoal gray</div></div></div>
          </div>
        </div>

        <div class="stain-family reveal">
          <h3>Golden &amp; Light Browns</h3>
          <p>Warm, sunlit browns — the traditional, most-requested range for oak.</p>
          <div class="swatch-grid">
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#c89a5a,#b1843e)"></div><div class="tile-body"><div class="tile-name">Golden Oak</div><div class="tile-note">Light golden</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#bd8b4f,#a3723a)"></div><div class="tile-body"><div class="tile-name">Golden Pecan</div><div class="tile-note">Warm golden-brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#b78a5c,#9e6e42)"></div><div class="tile-body"><div class="tile-name">Fruitwood</div><div class="tile-note">Light reddish tan</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#9c6f44,#835830)"></div><div class="tile-body"><div class="tile-name">Early American</div><div class="tile-note">Classic light brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#b17a3f,#97612a)"></div><div class="tile-body"><div class="tile-name">Colonial Maple</div><div class="tile-note">Golden amber</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#97653a,#7c4f28)"></div><div class="tile-body"><div class="tile-name">Golden Brown</div><div class="tile-note">Warm golden brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#8a5a33,#6e4426)"></div><div class="tile-body"><div class="tile-name">Nutmeg</div><div class="tile-note">Warm mid-brown</div></div></div>
          </div>
        </div>

        <div class="stain-family reveal">
          <h3>Warm Browns</h3>
          <p>Rich mid-browns with depth — timeless and forgiving in most homes.</p>
          <div class="swatch-grid">
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#6f4f35,#553a25)"></div><div class="tile-body"><div class="tile-name">Special Walnut</div><div class="tile-note">Even medium brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#7a5536,#5e4027)"></div><div class="tile-body"><div class="tile-name">Provincial</div><div class="tile-note">Balanced brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#7c5232,#613c22)"></div><div class="tile-body"><div class="tile-name">Chestnut</div><div class="tile-note">Reddish mid-brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#6a4329,#4e301c)"></div><div class="tile-body"><div class="tile-name">English Chestnut</div><div class="tile-note">Deep warm brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#74502f,#593b21)"></div><div class="tile-body"><div class="tile-name">Medium Brown</div><div class="tile-note">True medium brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#6f4a2c,#55371f)"></div><div class="tile-body"><div class="tile-name">Spice Brown</div><div class="tile-note">Warm spiced brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#5c3c25,#422a18)"></div><div class="tile-body"><div class="tile-name">Heritage Brown</div><div class="tile-note">Deep heritage tone</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#543824,#3b2718)"></div><div class="tile-body"><div class="tile-name">Antique Brown</div><div class="tile-note">Dark warm brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#8a4f31,#6d3a22)"></div><div class="tile-body"><div class="tile-name">Gunstock</div><div class="tile-note">Reddish brown</div></div></div>
          </div>
        </div>

        <div class="stain-family reveal">
          <h3>Reds &amp; Mahogany</h3>
          <p>Red-driven tones that bring warmth and a classic, formal character.</p>
          <div class="swatch-grid">
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#8a4630,#6c3120)"></div><div class="tile-body"><div class="tile-name">Sedona Red</div><div class="tile-note">Earthy red-brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#8f4733,#723221)"></div><div class="tile-body"><div class="tile-name">Cherry</div><div class="tile-note">Warm reddish</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#6e3322,#511e15)"></div><div class="tile-body"><div class="tile-name">Red Mahogany</div><div class="tile-note">Deep red-brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#5e2a1f,#431912)"></div><div class="tile-body"><div class="tile-name">Royal Mahogany</div><div class="tile-note">Rich mahogany</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#4e2820,#351812)"></div><div class="tile-body"><div class="tile-name">Rosewood</div><div class="tile-note">Dark red-brown</div></div></div>
          </div>
        </div>

        <div class="stain-family reveal">
          <h3>Rich Darks</h3>
          <p>Dramatic, high-contrast color — beautiful on oak and demanding to apply evenly, which is exactly our kind of work.</p>
          <div class="swatch-grid">
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#4a3221,#2e1f14)"></div><div class="tile-body"><div class="tile-name">Coffee Brown</div><div class="tile-note">Deep coffee brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#4a3526,#2e2017)"></div><div class="tile-body"><div class="tile-name">Dark Walnut</div><div class="tile-note">Classic dark walnut</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#3a2a1e,#211610)"></div><div class="tile-body"><div class="tile-name">Jacobean</div><div class="tile-note">Very dark brown</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#332218,#1c120d)"></div><div class="tile-body"><div class="tile-name">Espresso</div><div class="tile-note">Near-black warmth</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#241c16,#13100b)"></div><div class="tile-body"><div class="tile-name">Ebony</div><div class="tile-note">Deep near-black</div></div></div>
            <div class="swatch-tile"><div class="swatch swatch-grain" style="background:linear-gradient(135deg,#1a1714,#0c0a09)"></div><div class="tile-body"><div class="tile-name">True Black</div><div class="tile-note">Solid black</div></div></div>
          </div>
        </div>

      </div>
    </section>

    <!-- OFFICIAL GALLERY NOTE -->
    <section class="section section--tight">
      <div class="container center reveal" style="max-width:720px">
        <p class="lead" style="color:var(--muted)">Screens and printers show color differently, so treat these as a guide. Duraseal's official gallery photographs every color on real White Oak and Red Oak — and we'll mix and prove your exact color on a board from your own floor before any finish goes down.</p>
        <div style="margin-top:1.5rem"><a class="btn" href="https://www.duraseal.com/stain-gallery/" target="_blank" rel="noopener">See every Duraseal color →</a></div>
      </div>
    </section>

    <section class="section section--dark">
      <div class="container center reveal">
        <span class="eyebrow">Find your color</span>
        <h2>Let's make a sample board</h2>
        <p class="lead" style="margin-top:1rem">Bring us a cabinet door, a trim sample, or just an idea. We'll blend Duraseal stains and test until the color is unmistakably yours.</p>
        <div style="margin-top:1.8rem"><a class="btn" href="pricing.html#quote">Start with a consultation →</a></div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="footer-grid">
        <div class="footer-brand"><a class="brand" href="index.html"><span class="brand-mark">GWT</span><span><span class="brand-name" style="color:var(--cream)">GWT Hardwood Floors</span></span></a><p>Second-generation hardwood flooring craftsmanship — refinishing, installation, and custom stain work across Pontiac and Metro Detroit.</p></div>
        <div><h4>Explore</h4><ul class="footer-links"><li><a href="services.html">Services</a></li><li><a href="stain-gallery.html">Stain Gallery</a></li><li><a href="about.html">About Us</a></li></ul></div>
        <div><h4>Helpful</h4><ul class="footer-links"><li><a href="faq.html">FAQ</a></li><li><a href="floor-care.html">Floor Care Guide</a></li><li><a href="pricing.html">Pricing Guide</a></li><li><a href="pricing.html#quote">Request a Quote</a></li></ul></div>
        <div><h4>Contact</h4><div class="footer-contact"><span class="tel">Gary · 248-379-6826</span><span class="tel">Jake · 248-632-3244</span><span class="tel">Greg · 947-957-4996</span><a href="mailto:gwthardwoodfloors@gmail.com">gwthardwoodfloors@gmail.com</a><span>Serving all of Michigan</span></div></div>
      </div>
      <div class="footer-bottom"><span>© 2026 GWT Hardwood Floors · Family-owned, Michigan-built</span><span>Glitsa · Duraseal · Pallmann · Bona · Loba</span></div>
    </div>
  </footer>
  <script src="main.js"></script>
</body>
</html>
GWTEOF

echo "Update complete: portfolio removed + Duraseal stain gallery installed."

