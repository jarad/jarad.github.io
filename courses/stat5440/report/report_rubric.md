---
layout: page
title: STAT 544
subtitle: Report rubric
---

The report will be graded on a scale of 0-10 for each of 10 categories: on-time, length, grammar, design, clarity, figure(s), table(s), math, accuracy, and Bayesian. 
The description below discuss what I am looking for in each of the 10 categories. 

## On-time

The report needs to be submitted to Canvas by the due date and time in pdf format.
One point deducted for each hour after the deadline. 

## Length

The report is a maximum of 5 pages, singled-spaced with 12 pt font. 
Use

    \usepackage{fullpage}
    
to avoid excessive margins. 


Figures, tables, and their captions can be put later and will not count against the page limit. 
Put figures and tables at the end of the report.
To do this in LaTeX use 

    \usepackage[nomarkers]{endfloat}

Do not use a title. Do not report the author. 

## Grammar

The report should use proper English grammar.
I suggest you read [The Elements of Style](http://www.bartleby.com/141/) and follow the suggestions therein. 
In particular, make sure 
- words are not misspelled,
- complete sentences are used,
- capitalization is correct, e.g. Bayesian, Table 1, first word in a sentence, etc.,
- don't start sentences with mathematical symbols, and
- thoughts are broken up into paragraphs.


## Design

The report should follow a logical progression.
I suggest the following sections Introduction, Data, Methods, Results, and Discussion.

See details of the [outline](../outline.html).

Avoid through away statements like "is one of the most popular" or 
"is very popular". 

## Clarity

The report should be written so I can understand what you are doing. 
Specifically, I should be able to understand what your data are and what your model is.
I should be able to understand your interpretation and conclusion. 

You do not need to tell me extraneous information such as the name of your data file or how variables are encoded in your data set. 
Only describe the data you actually used.

Define acronyms before using the acronym. Capitalize acronyms. 

## Figure(s) 

The report should have at least one figure. 
All figures and their captions should be legible.
Captions should contain enough pertinent information to be able to understand the figure outside of the text.
The figure should demonstrate the point(s) you are trying to make.


## Table(s) 

The report should have at least one table. 
All tables and their captions should be legible.
Captions should contain enough pertinent information to be able to understand the table outside of the text.
The table should demonstrate the point(s) you are trying to make.

Reduce the number of significant digits you use. 

## Math 

The report should provide THE model used (note there should be only one model).
The mathematics used to describe this model as well as elsewhere in the report should be thoroughly described. 
In particular, the report should make clear the relationship between the terms in the model and the data being modeled.

Use informative subscripts, e.g. [b]atch, [r]eplicate, [g]enotype, etc, rather 
than the generic i, j, k, l. 

## Accuracy

The report should use an appropriate analysis, interpret the results correctly, 
and reach the correct scientific conclusion based on the data and the analysis used.

## Bayesian

The report should use a fully Bayesian approach and show posterior probabilities, posterior distributions, and credible intervals where appropriate. 
The report should not report on pvalues, MLEs, or confidence intervals. 

If you are using MCMC, you must make a statement about convergence. 
If providing convergence diagnostics, put them in an appendix at the end of the document. 
Indicate how many iterations were used for burn-in/warm-up and how many were
used for inference. 

No comparison to alternative estimation methods should be included. 
