---
layout: page
title: Software
header: Software
group: 
---

This page contains link to software that I or my students have created. 
Most of this software is proof-of-principle rather than production quality 
software and 

> THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## [fbseq](https://github.com/wlandau/fbseq)

This R package provides a front-end for fully Bayesian analysis of a 
hierarchical, overdispersed, count regression model. 
The user indicates a model matrix, similar to the model matrix for any 
regression model, and the hierarchical model borrows strength across the genes
to estimate the coefficients for that model matrix. 
The package then uses a Markov chain Monte Carlo (MCMC) procedure built 
primarily with a univariate slice-sampler, 
similar to the approach used in [JAGS](http://mcmc-jags.sourceforge.net/),
to estimate the parameters in the model. 

The [fbseq](https://github.com/wlandau/fbseq) front-end can be utilized with 
two backends: [fbseqOpenMP](https://github.com/wlandau/fbseqOpenMP) and [fbseqCUDA](https://github.com/wlandau/fbseqCUDA).
The OpenMP background allows parallelization across cores and therefore is not
suitable for analyzing tens of thousands of genes, but it can be used to 
quickly test code on a subset of genes.
If your computer has a [CUDA-capable NVIDIA graphics processing unit](https://developer.nvidia.com/cuda-gpus), then you can use the CUDA 
back-end to perform a GPU-accelerated version of the MCMC. 

More details can be found in the [fbseq README](https://github.com/wlandau/fbseq/blob/master/README.md). 

## [STRIPS R Package](https://github.com/ISU-STRIPS/STRIPS)

[STRIPS](https://www.nrem.iastate.edu/research/STRIPs/) is a project 
devoted to understanding the impact planting prairie strips within 
agricultural fields has on crop yield, water runoff, insect and bee response, 
etc. 
The [STRIPS R Package](https://github.com/ISU-STRIPS/STRIPS) provides an easy
interface to access the public-released data from the STRIPS project. 
This package is just a shell that installs/loads a number of PI-specific 
packages listed in the [DESCRIPTION file](https://github.com/ISU-STRIPS/STRIPS/blob/master/DESCRIPTION).


## [smcUtils](https://cran.r-project.org/web/packages/smcUtils/index.html)

This R package, which can be installed directly from CRAN, provides utility
functions for sequential Monte Carlo (SMC). 
In particular, it provides the `resample` function which can perform stratified,
residual, multinomial, systematic, and branching resampling and can also 
determine whether resampling should be done by comparing the effective
sample size, coefficient of variation, or entropy to a user-defined threshold.
The package provides both R and C implementations of the resampling and measures
of non-uniformity, but in my tests the C implementation was no faster than the R
implementation and thus the main purpose of providing the code is so that those
who are writing their on SMC sampler in C, can take and use the code. 
(I believe it is no faster because the bottleneck in the computation is writing
the data to and from C.)
