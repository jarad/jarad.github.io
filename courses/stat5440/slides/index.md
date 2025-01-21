---
layout: page
title: STAT 544
tagline: slides
---
{% include JB/setup %}

Below are source (Rnw) and handouts for all course lectures. 
In order to compile these documents, you will need the 
[frontmatter.tex](https://github.com/jarad/jarad.github.io/tree/master/courses/stat544/slides/frontmatter.tex)
and 
[commands.tex](https://github.com/jarad/jarad.github.io/tree/master/courses/stat544/slides/commands.tex) 
files which are available 
[where all the source files can be found](https://github.com/jarad/jarad.github.io/tree/master/courses/stat544/slides).
Instructions for compiling the Rnw files can be found below.

## Schedule

The following provides the weekly schedule of material 


|Chapter|Topic|Source|Handouts|
|:-----:|-----|---|---|
|1|Bayesian statistics|[Ch01.Rnw](Ch01/Ch01.Rnw)|[Ch01.pdf](Ch01/Ch01.pdf)|
|2|Binomial model/priors|[Ch02a.Rnw](Ch02/Ch02a.Rnw)|[Ch02a.pdf](Ch02/Ch02a.pdf)|
| |Normal model/computation|[Ch02b.Rnw](Ch02/Ch02b.Rnw)|[Ch02b.pdf](Ch02/Ch02b.pdf)|
|3|Independent binomials/normal|[Ch03a.Rnw](Ch03/Ch03a.Rnw)|[Ch03a.pdf](Ch03/Ch03a.pdf)|
| |Multinomial/multivariate normal|[Ch03b.Rnw](Ch03/Ch03b.Rnw)|[Ch03b.pdf](Ch03/Ch03b.pdf)|
|4|Data asympotitics|[Ch04.Rnw](Ch04/Ch04.Rnw)|[Ch04.pdf](Ch04/Ch04.pdf)|
|5|Binomial hierarchical model|[Ch05a.Rnw](Ch05/Ch05a.Rnw)|[Ch05a.pdf](Ch05/Ch05a.pdf)|
| |de Finetti/normal hierarchical model|[Ch05b.Rnw](Ch05/Ch05b.Rnw)|[Ch05b.pdf](Ch05/Ch05b.pdf)|
|6|Model checking|[Ch06.Rnw](Ch06/Ch06.Rnw)|[Ch06.pdf](Ch06/Ch06.pdf)|
|7|Hypothesis testing|[Ch07a.Rnw](Ch07/Ch07a.Rnw)|[Ch07a.pdf](Ch07/Ch07a.pdf)|
| |Comparison to LRTs|[Ch07b.Rnw](Ch07/Ch07b.Rnw)|[Ch07b.pdf](Ch07/Ch07b.pdf)|
|R|Amazon reviews analysis|[AmazonReview.Rnw](AmazonReviews/AmazonReviews.Rnw)|[AmazonReview.pdf](AmazonReviews/AmazonReviews.pdf)|
| |Midterm review|[MidtermReview.Rnw](MidtermReview/MidtermReview.Rnw)|[MidtermReview.pdf](MidtermReview/MidtermReview.pdf)|
| |Bayesian model averaging|[BMA.Rnw](BMA/BMA.Rnw)|[BMA.pdf](BMA/BMA.pdf)|
|9|Decision theory|[Ch09.Rnw](Ch09/Ch09.Rnw)|[Ch09.pdf](Ch09/Ch09.pdf)|
|10|Bayesian computation|[Ch10a.Rnw](Ch10/Ch10a.Rnw)|[Ch10a.pdf](Ch10/Ch10a.pdf)|
||ARS and Importance sampling|[Ch10b.Rnw](Ch10/Ch10b.Rnw)|[Ch10b.pdf](Ch10/Ch10b.pdf)|
|11|Metropolis-Hastings|[Ch11a.Rnw](Ch11/Ch11a.Rnw)|[Ch11a.pdf](Ch11/Ch11a.pdf)|
||Gibbs sampling|[Ch11b.Rnw](Ch11/Ch11b.Rnw)|[Ch11b.pdf](Ch11/Ch11b.pdf)|
||Markov chains|[Ch11c.Rnw](Ch11/Ch11c.Rnw)|[Ch11c.pdf](Ch11/Ch11c.pdf)|
||Markov chain Monte Carlo|[Ch11d.Rnw](Ch11/Ch11d.Rnw)|[Ch11d.pdf](Ch11/Ch11d.pdf)|
|14|Bayesian regression|[Ch14a.Rnw](Ch14/Ch14a.Rnw)|[Ch14a.pdf](Ch14/Ch14a.pdf)|
||Bayesian regression (cont.)|[Ch14b.Rnw](Ch14/Ch14b.Rnw)|[Ch14a.pdf](Ch14/Ch14b.pdf)|
|15|Hierarchical linear models|[Ch15a.Rnw](Ch15/Ch15a.Rnw)|[Ch15a.pdf](Ch15/Ch15a.pdf)|
||Hierarchical linear models (cont.)|[Ch15b.Rnw](Ch15/Ch15b.Rnw)|[Ch15b.pdf](Ch15/Ch15b.pdf)|
|16|Hierarchical linear models|[Ch16a.Rnw](Ch16/Ch16a.Rnw)|[Ch16a.pdf](Ch16/Ch16a.pdf)|
|||[Ch16b.Rnw](Ch16/Ch16b.Rnw)|[Ch16a.pdf](Ch16/Ch16b.pdf)|

  
Below are to be organized:
  
- [Chapter 16b](Ch16/Ch16b.Rnw)


## Rnw compilation instructions

The following files contain code to create slides for the associated chapters of [Bayesian Data Analysis, 3rd edition](../textbook.html). You will need to have the R package `knitr` installed, i.e. 

    install.packages('knitr')

To obtain the pdf, you will need to have [LaTeX installed](http://en.wikibooks.org/wiki/LaTeX/Installation) and in the path (etc). Then download the Rnw file (as an example, I will use `Ch01.Rnw`) and run

    knitr::knit2pdf('Ch01.Rnw')

Alternatively, you can install [RStudio](http://www.rstudio.com/) and click on the `Compile PDF` button.

To extract the R code, run 

    knitr::knit('Ch01.Rnw', tangle=TRUE)
