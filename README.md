# jarad.me

Source for [jarad.me](https://jarad.me), built with [Quarto](https://quarto.org).

The publications, presentations, students, teaching and homepage news are not
written here: they are generated from the CSV files in
[jarad/cv](https://github.com/jarad/cv), the same data the CV PDF is built
from. To change one of those lists, change the CV data.

## Layout

    index.qmd                homepage: bio, news, this term's courses
    publications.qmd         from cv/data/publications.csv (published only)
    presentations.qmd        from cv/data/presentations.csv
    students.qmd             from cv/data/studentcommittees.csv and people.csv
    teaching.qmd             from cv/data/courses.csv
    R/site.R                 CV data -> HTML; sources cv/R/cvdata.R for the
                             rules it shares with the CV (bylines, advisees, dates)
    styles/                  theme: Iowa State cardinal and gold, light and dark
    assets/site.js           search and filters, BibTeX buttons
    assets/people/           student photos, named <person_id>.jpg|png|webp
    courses/, consulting/    older pages, rendered as they are
    research/                papers, slides and theses served as files

## Previewing locally

The site looks for the cv repository in `CV_DIR`, then `_cv/`, then `../cv`.
The simplest setup is to clone it next to this repository, so nothing needs
setting:

    git clone https://github.com/jarad/cv ../cv
    quarto preview

If your clone lives elsewhere, put its path in `_environment.local` (which is
not committed); Quarto reads it on every render and preview:

    CV_DIR=/path/to/cv

R needs only `knitr` and `rmarkdown`.

## Publishing

`.github/workflows/publish.yml` renders the site on every push, every pull
request and every night, and publishes it from `master`. It requires
**Settings → Pages → Source: GitHub Actions**. The nightly run is what carries
CV data changes to the site; to publish one immediately, run the workflow from
the Actions tab.

A branch here is built against the branch of the same name in `jarad/cv` when
one exists, so a change spanning both repositories can be checked together.

## Old addresses

Pages that moved list their old address under `aliases:` in their front
matter, and Quarto writes a redirect there; for example
`research/publications.html` now redirects to `publications.html`.
