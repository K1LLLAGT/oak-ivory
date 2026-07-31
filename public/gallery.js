function renderGallery(containerId, images) {
  const container = document.getElementById(containerId);
  if (!container || !images) return;

  images.forEach(item => {
    const wrapper = document.createElement("div");
    const img = document.createElement("img");
    const caption = document.createElement("p");

    img.src = item.src;
    img.alt = item.label;
    caption.textContent = item.label;
    caption.style.textAlign = "center";
    caption.style.marginTop = "6px";

    wrapper.appendChild(img);
    wrapper.appendChild(caption);
    container.appendChild(wrapper);
  });

  document.querySelectorAll(`#${containerId} img`).forEach(img => {
    img.addEventListener("click", () => {
      const overlay = document.createElement("div");
      overlay.className = "lightbox";
      overlay.innerHTML = '<img src="' + img.src + '">';
      overlay.onclick = () => overlay.remove();
      document.body.appendChild(overlay);
    });
  });
}

document.addEventListener("DOMContentLoaded", () => {
  if (typeof stainImages !== "undefined") {
    renderGallery("stain-gallery", stainImages);
  }
  if (typeof portfolioImages !== "undefined") {
    renderGallery("portfolio-gallery", portfolioImages);
  }
});
