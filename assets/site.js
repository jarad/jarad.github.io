// Search and filter for the publication and presentation lists, and the
// BibTeX toggles. Each list is a .filterable block: .filter-controls holds the
// inputs; each .item carries data-text (lower-case, searchable) and data-tags.
(function () {
  document.querySelectorAll(".filterable").forEach(function (block) {
    var search  = block.querySelector(".filter-search");
    var buttons = block.querySelectorAll(".filter-tag");
    var flags   = block.querySelectorAll(".filter-flag input");
    var count   = block.querySelector(".filter-count");
    var items   = block.querySelectorAll(".item");
    var empty   = block.querySelector(".empty-filter");
    var tag = "";

    function apply() {
      var terms = (search ? search.value : "").toLowerCase().split(/\s+/).filter(Boolean);
      var need = Array.prototype.filter.call(flags, function (f) { return f.checked; })
                                       .map(function (f) { return f.dataset.tag; });
      if (tag) need.push(tag);
      var shown = 0;
      items.forEach(function (it) {
        var tags = (it.dataset.tags || "").split(" ");
        var ok = terms.every(function (t) { return it.dataset.text.indexOf(t) !== -1; }) &&
                 need.every(function (t) { return tags.indexOf(t) !== -1; });
        it.hidden = !ok;
        if (ok) shown++;
      });
      block.querySelectorAll(".year-group").forEach(function (g) {
        g.hidden = !g.querySelector(".item:not([hidden])");
      });
      if (count) count.textContent = shown === items.length
        ? items.length + " total" : shown + " of " + items.length;
      if (empty) empty.hidden = shown !== 0;
    }

    if (search) search.addEventListener("input", apply);
    flags.forEach(function (f) { f.addEventListener("change", apply); });
    buttons.forEach(function (b) {
      b.addEventListener("click", function () {
        buttons.forEach(function (o) { o.classList.toggle("active", o === b); });
        tag = b.dataset.tag;
        apply();
      });
    });
    apply();
  });

  document.addEventListener("click", function (e) {
    var t = e.target.closest(".bib-toggle");
    if (t) {
      var box = t.closest(".item").querySelector(".bibtex");
      box.hidden = !box.hidden;
      t.setAttribute("aria-expanded", String(!box.hidden));
      return;
    }
    var c = e.target.closest(".copy-bib");
    if (c && navigator.clipboard) {
      navigator.clipboard.writeText(c.parentNode.querySelector("pre").textContent).then(function () {
        c.textContent = "Copied";
        setTimeout(function () { c.textContent = "Copy"; }, 1500);
      });
    }
  });
})();
