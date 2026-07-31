#!/usr/bin/env bash
# Removes the portfolio (page + homepage featured project + all links) from the GWT site.
# Run this from inside your repo folder: bash remove_portfolio.sh
set -e

# 1. Remove the "Portfolio" link from the top nav on every page
sed -i '/<li><a href="portfolio.html">Portfolio<\/a><\/li>/d' *.html

# 2. Remove the "Project Portfolio" link from the footer on every page
sed -i 's|<li><a href="portfolio.html">Project Portfolio</a></li>||g' *.html

# 3. Repoint the hero "See our work" button (was the portfolio) to Services
sed -i 's|<a class="btn btn--ghost" href="portfolio.html">See our work</a>|<a class="btn btn--ghost" href="services.html">Explore our services</a>|' index.html

# 4. Remove the entire "Featured project" section from the homepage
perl -0777 -i -pe 's/    <!-- FEATURED PROJECT -->.*?    <\/section>\n\n//s' index.html

# 5. Drop the two body-text mentions of "portfolio" so nothing references the dead page
sed -i 's|Our WheatStone Oak finish in the portfolio came from|Our WheatStone Oak finish came from|' faq.html
sed -i 's|The WheatStone Oak finish in our portfolio was|Our WheatStone Oak finish was|' services.html

# 6. Delete the portfolio page itself
rm -f portfolio.html

echo "Done. Portfolio fully removed."

