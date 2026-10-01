---
layout: page
title: STAT 330
subtitle: Probability and Statistics for Computer Science
---

This website is designed to host course material for STAT 330 - Probability and Statistics for Computer Science at 
[Iowa State University](http://www.iastate.edu).
These materials will be available even after the course is over, 
although they may be updated. 

## Course Description

Topics from probability and statistics applicable to computer science. 
Basic probability; Random variables and their distributions; 
Stochastic processes including Markov chains; Queuing models; 
Basic statistical inference; Introduction to regression.



## Prerequisite

This course requires MATH 166 (Calculus II). 
Integrals are needed to compute expectations of continuous random variables and
derivatives are needed to obtain maximum likelihood estimators (MLEs). 






## Textbook

The optional textbook for this course is 
Probability and Statistics for Computer Scientists by Michael Baron (3rd ed). 

![](baron_3rd.jpeg "Probability and Statistics for Computer Scientists by Michael Baron (3rd ed)")

The main improvement in the 3rd edition is the inclusion of R code in addition
to the MATLAB code. 
Since I use R for any code that I write, 
this is an appreciated inclusion. 


Here are some free resources that can be used:

- [OpenIntro Statistics](https://leanpub.com/openintro-statistics)
- [Online Statistics Education](http://onlinestatbook.com/2/)
- [R for Data Science](http://r4ds.had.co.nz/)
- [Data Camp](https://www.datacamp.com/)
- [Introduction to R for Data Science](https://www.edx.org/course/introduction-r-data-science-microsoft-dat204x-3)
- [Introduction to Linear Regression Analysis (5) by Montgomery, Peck, and Vining](http://iowa-primo.hosted.exlibrisgroup.com/01IASU:ComboPrimocentral:01IASU_ALMA51248876230002756)


Other resources:

- [Coursera Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science)
- [The Statistical Sleuth](http://amzn.to/2jkdmct)
- [Data Collection and Analysis](http://amzn.to/2iR692T)
- [Data Analysis for Scientists and Engineers](http://amzn.to/2j0yuUI)
- [An Introduction to Statistical Learning](http://amzn.to/2jasyWb)


## Software 

No software is required for this course, 
but the instructor will use the Statistical Software [R](https://www.r-project.org/)
when demonstrating concepts in class. 
The instructor will be using RStudio as the interface to [R](https://www.r-project.org/). 

Install links:

- [R](https://mirror.las.iastate.edu/CRAN/)
- [RStudio](https://www.rstudio.com/products/rstudio/download/) 

I am currently 
[recording videos](https://www.youtube.com/playlist?list=PLFHD4aOUZFp1wYrk8AIW0LGL4f9lBg79B) 
to help new R users.


## Videos

I have not recorded videos specifically for STAT 330, 
but my series of videos used in STAT 587 has a lot of overlap. 
Thus, the links to videos below are relevant to students in STAT 330. 
The main difference between these two courses is that, as a graduate course,
STAT 587 moves much more quickly through the content and therefore has time
within the semester to spend a lot of time on multiple regression models. 
In contrast, STAT 330 just barely has time to discuss simple linear regression
models. 

### Probability

For basic probability, I have a 
[1 hour video](https://www.youtube.com/watch?v=zBP7KBtM9vI) 
containing all the probability required for the course. 
Alternatively, I have 
[a playlist](https://www.youtube.com/playlist?list=PLFHD4aOUZFp0a_m9HXdVu3_ZnfphUY0oJ) 
that has the basic probability topics separated into individual videos.

### Discrete random variables

For random variables, I have an 
[introductory video](https://youtu.be/ajLFqrPTAcY) 
that describes the difference between discrete and continuous random variables. 
Then, I have a video about 
[general discrete random variables](https://youtu.be/FrL4Dcoy9MI)
and videos about 

- [Bernoulli](https://youtu.be/NXUkzZhrrcA),
- [binomial](https://youtu.be/cnJjKX5AHi4), and
- [Poisson](https://youtu.be/NTWD-EyTkR0)

random variables and their distributions as well as a video about 
[multiple discrete random variables](https://youtu.be/1U537aiXJzM).

### Continuous random variables

Moving on to continuous random variables, I have a video about
[general continuous random variables](https://youtu.be/KbfUnaiarps)
and videos specifically about 

- [uniform](https://youtu.be/S_tw8UZqJ6U),
- [exponential](https://youtu.be/e5vCX4uCGvY),
- [gamma](https://youtu.be/YkF3D8OHZwc), and
- [normal (or Gaussian)](https://youtu.be/c22x0xpvkyY)

random variables and their distributions.

The normal distribution is extremely important due to the result of the 
Central Limit Theorem (CLT) introduced in 
[this video](https://youtu.be/xSNg9Vp1wko) 
and made a bit more practical in 
[this follow up video](https://youtu.be/xSNg9Vp1wko).
There is a 3rd video in this CLT series, but I don't think it is too helpful
(in retrospect). 

### Stochastic processes

At the moment, I don't have videos on Markov chains, Poisson processes, and
queuing systems. 

### Statistical inference

The videos I have on statistical inference a much more in depth than we have 
time for in STAT 330. 
If you are interested in this depth, then you can following along with 
[this playlist](https://www.youtube.com/playlist?list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj). 
From this playlist, the most relevant videos are 

- [statistical inference](https://www.youtube.com/watch?v=yF92RxPS_G4&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=1),
- [graphical statistics](https://www.youtube.com/watch?v=N-7rt9QP-W0&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=4),
- [statistical modeling](https://www.youtube.com/watch?v=5KnJ-uVaoLE&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=5),
- [likelihood](https://www.youtube.com/watch?v=m7I7baoDuuo&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=6),
- [maximum likelihood estimators](https://www.youtube.com/watch?v=vz34FpuLhsA&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=7),
- [sampling distributions](https://www.youtube.com/watch?v=1nJ6j9RrIu4&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=15),
- [confidence intervals](https://www.youtube.com/watch?v=pNItyrvDGP8&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=16),
- [p-values](https://www.youtube.com/watch?v=taF2TMQXLmE&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=18), and
- [hypothesis tests](https://www.youtube.com/watch?v=IjuGeYIlH5Y&list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj&index=19).

In 
[the playlist](https://www.youtube.com/playlist?list=PLFHD4aOUZFp1PZC6SgtuS-ESq4ti1GEFj), 
I also introduce Bayesian approaches to statistical inference. 
This approach is not required for this course, 
but some students may be interested in this alternative to p-values, 
confidence intervals, and hypothesis testing. 

### Simple linear regression

For the topic of simple linear regression, 
the main videos are 

- [simple linear regression](https://www.youtube.com/watch?v=qAGZfkDzNX8&list=PLFHD4aOUZFp2xijRVpW7ucwSbToEAGBzq&index=1) and
- [regression diagnostics](https://www.youtube.com/watch?v=luvliCq6QuQ&list=PLFHD4aOUZFp2xijRVpW7ucwSbToEAGBzq&index=4).

While this is the extent of the simple linear regression model in STAT 330,
there are many other relevant videos in 
[my regression playlist](https://www.youtube.com/watch?v=qAGZfkDzNX8&list=PLFHD4aOUZFp2xijRVpW7ucwSbToEAGBzq&index=1) including the first 7 videos.
The remainder of the videos in the playlist move in to multiple regression
which, again, may be of interest to some students. 
Multiple regression models form the basis for many statistical and machine 
learning methods. 

