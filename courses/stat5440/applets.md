---
layout: page
title: STAT 544
subtitle: Applets
---

Please run these apps from r using the `runGitHub` function from the `shiny` package:

    install.packages('shiny')
    
## One parameter conjugate analysis

This app allows fully Bayesian inference using conjugate priors for univariate models including binomial, Poisson, normal, and exponential. 
To run this app use 

    shiny::runGitHub('jarad/one_parameter_conjugate')
    
## Mean height (prior elicitation activity)

This app is used in STAT 544 to illustrate the process of eliciting a prior and then also to demonstrate the difference between confidence intervals and credible intervals. 
If you are currently enrolled in STAT 544, you should not access this app until after we use it in class (just to avoid [anchoring](https://en.wikipedia.org/wiki/Anchoring)). 
To run this app use 

    shiny::runGitHub('jarad/prior_elicitation_activity/')
    
## Pvalue interpretation

This app illustrates the difficulty in interpreting pvalues by simulating data sets within the context of a normal model with unknown variance and testing the mean to be zero. 
The user selects a pvalue (technically a pvalue range) and the software will calculate what proportion of time the null hypotheses is true over a set of simulations with that pvalue. 
To run this app use

    shiny::runGitHub('jarad/pvalue')

