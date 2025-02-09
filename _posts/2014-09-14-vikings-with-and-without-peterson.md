---
layout: post
title: "Vikings with and without Peterson"
description: ""
category: [Teaching]
tags: [R,STAT 401A,football]
---
{% include JB/setup %}

While watching the Minnesota Vikings football game today, the following statistics were discussed concerning the Minnesota Vikings performance since 2007 with and without Adrian Peterson. 

<!-- html table generated in R 3.4.1 by xtable 1.8-2 package -->
<!-- Thu Nov 16 09:42:14 2017 -->
<table border=1>
<tr> <th> Statistic </th> <th> With Peterson </th> <th> Without Peterson </th>  </tr>
  <tr> <td> # of games </td> <td align="right">  </td> <td align="right"> 9.0 </td> </tr>
  <tr> <td> Win % </td> <td align="right"> 49.5 </td> <td align="right"> 44.4 </td> </tr>
  <tr> <td> Points/game </td> <td align="right"> 23.1 </td> <td align="right"> 25.9 </td> </tr>
  <tr> <td> Rushing yards/game </td> <td align="right"> 142.1 </td> <td align="right"> 141.0 </td> </tr>
   </table>

The commentators main point was that there was no practical significance in the difference in the numbers (although perhaps the win percentage is lower) when Peterson is playing vs when he is not playing. The commentators did point out that due to the low number of games without Peterson the results are ``skewed.'' I think they really mean that there is a lot of uncertainty in the estimates relative to their true values with Peterson not playing. Below I will talk about statistical significance, but the main point of the commentators is that there is no practical significant difference between the results with and without Peterson.

These data are an example of two-sample data. The data are not a random sample from a population but are rather the whole population of games without Peterson. But presumably the question of interest is how the Vikings will fair in the **next** game without Peterson. So the population of interest is always ``all games except the next'' and clearly our sample is not a random sample from this population. Although the treatment, i.e. whether Peterson plays or not, is not determined according to a pseudo-random number generator, Peterson's playing or not is likely determined mainly by injuries which may be reasonably random. Therefore, we may believe that the differences observed is due to Peterson's playing or not.

To determine statistical significance of these numbers, we need two more pieces of information:

1. The number of games without Peterson
2. The standard deviations of the data associated with the statistic column

The number of games without Peterson can be estimated by the [number of games in the regular season of which there are typically 16](https://answers.yahoo.com/question/index?qid=20110628185815AAG2kQu) and there have been 7 seasons since 2007. So there have been about 112 games and this estimate will be sufficient for our purposes. The standard deviation of the win percentage (p) is 'p(1-p)' from [properties of the binomial distribution](http://en.wikipedia.org/wiki/Binomial_distribution). The standard deviations for the points and rushing yards could be estimated from either the standard deviations for the entire NFL or the Vikings specifically (both of these should be pretty close). With this information, you could determine whether there is a significant difference in the Vikings play when Peterson is playing and when he isn't. Of course, the whole point from the commentators is that even if these are [significantly different, they don't appear to be practically significant](https://answers.yahoo.com/question/index?qid=20130216205755AAYdszo). 



