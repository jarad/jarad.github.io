---
layout: page
title: Lab 1
---

1. Download the [Sleuth Data Sets](http://www.science.oregonstate.edu/~schafer/Sleuth/files/sleuth3csv.zip) and extract to CyFiles U:/401A/sleuth3csv.
1. Use the SAS or R instructions below to check and make sure you have downloaded to the correct location.



## SAS instructions

1. Start SAS 9.4.
1. Paste the code below into the editor window.
1. Click on the Run button (looks like a person running).
```bash
DATA case0101;
  INFILE 'U:/401A/sleuth3csv/case0101.csv' DSD FIRSTOBS=2;
  INPUT score treatment $;
    
PROC MEANS DATA=case0101;
  VAR score;
  BY treatment;
  RUN;
```

## R instructions


1. Start R.
1. File > New Script.
1. Paste the code below into the editor window.
1. Edit > Run all.

```bash
case0101 = read.csv("U:/401A/sleuth3csv/case0101.csv")
names(case0101) = tolower(names(case0101))
by(case0101$score, case0101$treatment, summary)
```

