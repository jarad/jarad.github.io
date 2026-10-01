# Turns the CV data (https://github.com/jarad/cv) into HTML for the website.
#
# The cv repository is the source of truth. This file finds a checkout of it,
# sources its shared rules (R/cvdata.R) and adds only what is specific to
# HTML. Base R only, so the build needs nothing beyond knitr and rmarkdown.

# ---- locating the CV data ---------------------------------------------------

# CV_DIR wins; otherwise _cv (where the GitHub Action checks it out) or a
# sibling clone at ../cv. A clone only counts if it has R/cvdata.R, which a
# cv checkout from before that file existed (an old master) does not.
cv_dir = function() {
  tried = character(0)
  # tolerate quotes, a trailing carriage return from a Windows editor, and ~
  env = path.expand(gsub('^["\']|["\']$', "", trimws(Sys.getenv("CV_DIR"))))
  for (d in c(env, "_cv", "../cv")) {
    if (!nzchar(d)) next
    if (file.exists(file.path(d, "R", "cvdata.R"))) return(normalizePath(d))
    tried = c(tried, if (!dir.exists(d)) paste0("  ", d, ": no such folder")
                     else paste0("  ", d, ": exists, but has no R/cvdata.R ",
                                 "(is the cv clone on an old branch? try `git pull`)"))
  }
  stop("Cannot find the cv repository.\n",
       "CV_DIR is ", if (nzchar(Sys.getenv("CV_DIR"))) paste0('"', Sys.getenv("CV_DIR"), '"') else "not set", ".\n",
       "Looked in:\n", paste(tried, collapse = "\n"), "\n",
       "Clone https://github.com/jarad/cv next to this repository, or set CV_DIR ",
       "in _environment.local to the folder containing its data/ and R/.", call. = FALSE)
}
CV = cv_dir()
source(file.path(CV, "R", "cvdata.R"))
cv = function(name) cv_read(name, CV)

people      = cv("people")
committees  = cv("studentcommittees")
spellings   = cv_spellings(people, cv("aliases"))
advisee_ids = cv_advisee_ids(committees)

# a column that may not exist yet in an older checkout of the cv data
col = function(d, name) if (name %in% names(d)) d[[name]] else rep(NA_character_, nrow(d))

# ---- HTML -------------------------------------------------------------------

h = function(x) {
  x = gsub("&", "&amp;", x, fixed = TRUE)
  x = gsub("<", "&lt;",  x, fixed = TRUE)
  x = gsub(">", "&gt;",  x, fixed = TRUE)
  gsub("\"", "&quot;", x, fixed = TRUE)
}
# plain text with Markdown *italics*, as the CV data is written
txt = function(x) ifelse(is.na(x), "", gsub("\\*([^*]+)\\*", "<em>\\1</em>", h(x)))
link = function(text, href, class = NULL) {
  if (is.na(href) || !nzchar(href)) return(text)
  paste0('<a href="', h(href), '"', if (!is.null(class)) paste0(' class="', class, '"'), '>', text, '</a>')
}
# lower-case text that the page's search box matches against
search_text = function(...) {
  x = paste(..., sep = " ")
  tolower(h(gsub("<[^>]+>|\\*", "", x)))
}
# emit raw HTML from an `output: asis` chunk without Pandoc reinterpreting it
emit = function(...) cat("\n```{=html}\n", ..., "\n```\n\n", sep = "")

# my name in bold, advisees starred, everyone else as written
authors_html = function(s) vapply(s, function(x)
  decorate_names(x, spellings, advisee_ids, escape = h,
                 me      = function(n) paste0('<strong class="me">', n, '</strong>'),
                 advisee = function(n) paste0(n, '<span class="advisee" title="Student advisee">*</span>')),
  character(1), USE.NAMES = FALSE)

has_advisee = function(s) vapply(s, function(x)
  any(vapply(spellings$spelling[spellings$person_id %in% advisee_ids],
             function(n) grepl(n, x, fixed = TRUE), logical(1))),
  logical(1), USE.NAMES = FALSE)

# "Apr 2026" for a day or month, "2026" for a year, as recorded
month_year = function(d) vapply(as.character(d), function(x) {
  if (is.na(x)) return("")
  if (nchar(x) == 4) return(x)
  format(iso_floor(x), "%b %Y")
}, character(1), USE.NAMES = FALSE)

doi_url = function(d) ifelse(is.na(d), NA_character_,
                             ifelse(grepl("^https?://", d), d, paste0("https://doi.org/", d)))

# ---- terms ------------------------------------------------------------------

TERM_ORDER = c(Winter = 1, Spring = 2, Summer = 3, Fall = 4,
               Jan = 1, Feb = 1, Mar = 2, Apr = 2, May = 2, Jun = 3,
               Jul = 3, Aug = 4, Sep = 4, Oct = 4, Nov = 4, Dec = 4)

# the academic term a date falls in, as courses.csv names it
term_of = function(date = Sys.Date()) {
  m = as.integer(format(date, "%m"))
  list(term = if (m <= 5) "Spring" else if (m <= 7) "Summer" else "Fall",
       year = as.integer(format(date, "%Y")))
}

# ---- publications -----------------------------------------------------------

published = function() {
  p = cv("publications")
  p = p[p$status == "published", ]
  first = pmin(iso_floor(p$date_online), iso_floor(p$date_print), na.rm = TRUE)
  p$first_public = as.Date(ifelse(is.na(first), as.Date(sprintf("%04d-01-01", p$year)), first))
  p = p[order(-p$year, -as.numeric(p$first_public)), ]
  # BibTeX keys, with a, b, ... where two papers would otherwise share one
  k = vapply(seq_len(nrow(p)), function(i) bib_key(p[i, ]), "")
  dup = k %in% k[duplicated(k)]
  k[dup] = paste0(k[dup], ave(k[dup], k[dup], FUN = function(x) letters[seq_along(x)]))
  p$bib_key = k
  p
}

# BibTeX authors: "A, B, and C" -> "A and B and C"; a byline truncated with
# "..." or "[n other authors]" ends in "others"; a group name is braced so it
# is not split into first and last names
bib_authors = function(a) {
  parts = trimws(strsplit(gsub("\\s+(and|&)\\s+", ", ", a), ",")[[1]])
  parts = parts[nzchar(parts)]
  truncated = grepl("^\\.\\.\\.$|^\\[.*\\]$", parts)
  parts = parts[!truncated]
  parts = ifelse(grepl("Group|Consortium|Hub", parts), paste0("{", parts, "}"), parts)
  paste(c(parts, if (any(truncated)) "others"), collapse = " and ")
}

bib_key = function(p) {
  first = trimws(strsplit(p$authors, ",| and ")[[1]][1])
  last  = tail(strsplit(first, " ")[[1]], 1)
  word  = setdiff(tolower(strsplit(gsub("[^A-Za-z ]", "", p$title), " ")[[1]]),
                  c("a", "an", "the", "of", "on", "for", "in", "and", "to", "with", ""))[1]
  letters_only = function(x) tolower(gsub("[^A-Za-z]", "", iconv(x, to = "ASCII//TRANSLIT")))
  paste0(letters_only(last), p$year, letters_only(word))
}

bibtex = function(p) {
  f = c(author  = bib_authors(p$authors),
        title   = paste0("{", gsub("\\*", "", p$title), "}"),
        journal = p$journal, year = p$year, volume = p$volume,
        number  = p$issue,
        pages   = if (!is.na(p$pages)) gsub("-+", "--", p$pages) else p$number,
        doi     = if (!is.na(p$doi)) sub("^https?://(dx\\.)?doi\\.org/", "", p$doi) else NA,
        url     = p$url)
  f = f[!is.na(f) & nzchar(f)]
  paste0("@article{", p$bib_key, ",\n",
         paste0("  ", format(names(f)), " = {", f, "}", collapse = ",\n"), "\n}")
}

# "Journal 117(6):e70243, 1-10"
venue_html = function(p) {
  v = paste0("<em>", txt(p$journal), "</em>")
  if (is.na(p$volume)) return(paste0(v, ", online ahead of print"))
  v = paste0(v, " ", h(p$volume))
  if (!is.na(p$issue))  v = paste0(v, "(", h(p$issue), ")")
  if (!is.na(p$number)) v = paste0(v, ":", h(p$number))
  if (!is.na(p$pages))  v = paste0(v, ", ", h(gsub("-+", "&ndash;", p$pages)))
  v
}

pub_item = function(p, bib = TRUE) {
  links = c(link("DOI",      doi_url(p$doi),   "pill"),
            link("Article",  p$url,            "pill"),
            link("Preprint", p$`pre-print`,    "pill"))
  links = links[grepl("<a ", links)]
  if (bib) links = c(links, '<button type="button" class="pill bib-toggle" aria-expanded="false">BibTeX</button>')
  tags = c(if (has_advisee(p$authors)) "advisee")
  paste0(
    '<li class="item pub" data-tags="', paste(tags, collapse = " "), '" data-text="',
      search_text(p$title, p$authors, p$journal, p$year), '">',
    '<div class="item-title">', txt(p$title), '</div>',
    '<div class="item-byline">', authors_html(p$authors), '</div>',
    '<div class="item-meta">', venue_html(p), ' &middot; ', p$year, '</div>',
    if (length(links)) paste0('<div class="item-links">', paste(links, collapse = " "), '</div>'),
    if (bib) paste0('<div class="bibtex" hidden><pre>', h(bibtex(p)), '</pre>',
                    '<button type="button" class="pill copy-bib">Copy</button></div>'),
    '</li>')
}

# ---- presentations ----------------------------------------------------------

presentations = function() {
  d = cv("presentations")
  d[order(d$date, decreasing = TRUE, na.last = TRUE), ]
}

talk_item = function(d) {
  poster = d$kind == "poster"
  who = if (poster) authors_html(name_list(c(d$presenting_author,
          if (!is.na(d$work_authors)) trimws(strsplit(d$work_authors, ",")[[1]])))) else ""
  badges = c(if (poster) '<span class="badge-soft">Poster</span>',
             if (!is.na(d$solicitation) && d$solicitation == "invited")
               '<span class="badge-soft">Invited</span>',
             if (!is.na(d$date) && iso_floor(d$date) > Sys.Date())
               '<span class="badge-soft upcoming">Upcoming</span>')
  slides = col(d, "slides_url")
  tags = c(d$kind, if (!is.na(d$solicitation) && d$solicitation == "invited") "invited")
  paste0(
    '<li class="item talk" data-tags="', paste(tags, collapse = " "), '" data-text="',
      search_text(d$title, d$venue, d$work_authors, d$date), '">',
    '<div class="item-title">', txt(d$title), ' ', paste(badges, collapse = " "), '</div>',
    if (nzchar(who)) paste0('<div class="item-byline">', who, '</div>'),
    '<div class="item-meta">', txt(d$venue),
      if (!is.na(d$date)) paste0(' &middot; ', h(fmt_date(d$date))),
      if (!is.na(d$notes)) paste0(' &middot; ', txt(d$notes)), '</div>',
    if (!is.na(slides)) paste0('<div class="item-links">', link("Slides", slides, "pill"), '</div>'),
    '</li>')
}

# ---- grouped, filterable lists ----------------------------------------------

# items under a heading per year, newest first
by_year = function(items, years) {
  out = character(0)
  for (y in unique(years)) {
    lbl = if (is.na(y)) "Undated" else y
    out = c(out, '<section class="year-group"><h2 class="year">', lbl, '</h2><ol class="items">',
            items[years %in% y], '</ol></section>')
  }
  paste(out, collapse = "\n")
}

# a search box, optional buttons that filter by one tag, optional checkboxes
# that require a tag; assets/site.js does the filtering
filter_controls = function(label, buttons = NULL, flags = NULL) {
  b = if (length(buttons)) paste0(
        '<div class="btn-group filter-buttons" role="group" aria-label="Show">',
        paste0('<button type="button" class="filter-tag', ifelse(names(buttons) == "", " active", ""),
               '" data-tag="', names(buttons), '">', buttons, '</button>', collapse = ""),
        '</div>')
  f = if (length(flags)) paste0(
        '<label class="filter-flag"><input type="checkbox" data-tag="', names(flags), '"> ',
        flags, '</label>', collapse = "")
  paste0('<div class="filter-controls">',
         '<input type="search" class="form-control filter-search" placeholder="Search ', label,
         '" aria-label="Search ', label, '">', b, f,
         '<span class="filter-count" aria-live="polite"></span></div>')
}

# ---- students ---------------------------------------------------------------

photo_for = function(id) {
  f = list.files("assets/people", pattern = paste0("^", id, "\\.(jpe?g|png|webp)$"))
  if (length(f)) file.path("assets/people", f[1]) else NA_character_
}

initials = function(name) {
  w = strsplit(gsub("\"[^\"]*\"", "", name), "\\s+")[[1]]
  toupper(paste0(substr(w[1], 1, 1), substr(tail(w, 1), 1, 1)))
}

advisees = function() {
  d = committees[!is.na(committees$Chair), ]
  d$thesis_url = col(d, "thesis_url")
  d
}

# one card per person, however many degrees they took with me
student_card = function(id, rows) {
  p = people[people$person_id == id, ]
  name = txt(p$name)
  href = if (!is.na(p$website)) p$website else p$linkedin
  img  = photo_for(id)
  pic  = if (is.na(img)) paste0('<div class="avatar initials" aria-hidden="true">', initials(p$name), '</div>')
         else paste0('<img class="avatar" src="', img, '" alt="" loading="lazy">')
  rows = rows[order(iso_floor(rows$graduation_date), na.last = TRUE), ]
  degs = vapply(seq_len(nrow(rows)), function(i) {
    r = rows[i, ]
    deg = if (r$Degree == "MA") "MS" else r$Degree
    lbl = paste0(deg, " ", if (is.na(r$graduation_date)) "in progress" else substr(r$graduation_date, 1, 4))
    if (r$School != "ISU") lbl = paste0(lbl, ", ", r$School)
    lbl = link(lbl, r$thesis_url)
    if (!is.na(r$co_chair_id))
      lbl = paste0(lbl, ', co-advised with ', txt(people$name[people$person_id == r$co_chair_id]))
    lbl
  }, character(1))
  now = if (!is.na(p$current_affiliation)) paste0('<div class="person-now">', txt(p$current_affiliation), '</div>') else ""
  paste0('<li class="person">', pic, '<div class="person-body">',
         '<div class="person-name">', link(name, href), '</div>',
         '<div class="person-degrees">', paste(degs, collapse = "<br>"), '</div>', now,
         '</div></li>')
}

# ---- courses ----------------------------------------------------------------

courses = function() {
  d = cv("courses")
  d$url = col(d, "url")
  d$rank = d$year * 10 + TERM_ORDER[d$term]
  d[order(-d$rank), ]
}

current_courses = function(d = courses(), today = Sys.Date()) {
  t = term_of(today)
  d[d$kind == "regular" & d$term == t$term & d$year == t$year, ]
}

course_label = function(d) paste0(h(d$number), " &ndash; ", txt(d$title))

# ---- news -------------------------------------------------------------------

# recent papers, talks and graduations, newest first
news = function(n = 6, today = Sys.Date()) {
  p = published()
  papers = data.frame(
    date = p$first_public,
    shown = ifelse(is.na(p$date_online) & is.na(p$date_print), as.character(p$year),
                   month_year(ifelse(is.na(p$date_online), p$date_print, p$date_online))),
    html = paste0("New paper in <em>", txt(p$journal), "</em>: ",
                  vapply(seq_len(nrow(p)), function(i)
                    link(txt(p$title[i]), or_else(doi_url(p$doi[i]), p$url[i])), "")),
    kind = "paper")
  t = presentations()
  t = t[!is.na(t$date) & t$kind == "talk", ]
  talks = data.frame(
    date = iso_floor(t$date), shown = month_year(t$date),
    html = paste0(ifelse(iso_floor(t$date) > today, "Upcoming talk", "Talk"), " at ", txt(t$venue), ": ",
                  vapply(seq_len(nrow(t)), function(i) link(txt(t$title[i]), col(t, "slides_url")[i]), "")),
    kind = "talk")
  g = advisees()
  g = g[!is.na(g$graduation_date), ]
  grads = data.frame(
    date = iso_floor(g$graduation_date), shown = month_year(g$graduation_date),
    html = paste0("Congratulations to ", txt(people$name[match(g$person_id, people$person_id)]),
                  " on completing ", ifelse(g$Degree == "PhD", "a PhD", "an MS"), "!"),
    kind = "student")
  all = rbind(papers, talks, grads)
  all = all[!is.na(all$date) & all$date <= today + 180, ]
  head(all[order(all$date, decreasing = TRUE), ], n)
}

or_else = function(a, b) if (is.na(a)) b else a
