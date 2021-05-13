# Taylor’s law of fluctuation scaling for semivariances and higher moments of heavy-tailed data

This repository contains R programs for the article, “Testing for positive quadrant dependence.” 
This article has been submitted for publication. 
Prior to using R programs on this repository, please download the main R program [EL_PQD_Library.R](https://raw.githubusercontent.com/cftang9/PQD/master/EL_PQD_Library.R) or source it in R using the command ``source("https://raw.githubusercontent.com/cftang9/PQD/master/EL_PQD_Library.R")`` 
which requires installing `R` packages `Rcpp` and `copula`. We would like to point out that loading or executing functions in `Rcpp` packages may encounter some technical problems for Windows users if your `R` software was recently updated to the latest version. One may run these codes in `Rstudio` and follow what it suggests to solve the problem.  After successfully loading the main R program, the function `IndvsPQD` will automate critical value calculations for the practitioner. To better understand the use of our R program, we start with an illustrative example.

## Part 1:  Illustration

### 1.1  A simple example

Below generates a random sample of size 10 from a Clayton copula, with a user-specified Kendall's tau, to test for independence versus positive quadrant dependence (PQD). 
```R
# Source the main R program
source("https://raw.githubusercontent.com/cftang9/PQD/master/EL_PQD_Library.R")
# Set the sample size n and the Kendall's tau
n = 10; tau = 0.2
# Generate a sample of size n
# For illustration, we set the seed to be 100
set.seed(100)
Sample = RV_CopTau(n, tau, Copula="Clayton")
# Name the sample by X and Y
X=Sample[,1];Y=Sample[,2]
# Run the test
IndvsPQD(X,Y,graph=TRUE)
```

A scatter plot and a plot of the corresponding pseudo-observations between `X` and `Y` will be produced. 
![Optional Text](../master/Example.png)

Our proposed empirical-likelihood-based test (EL) and three distance-based tests (KS, CvM, and AD) for PQD along with the Kendall and Spearman rank tests will be performed. Results include the value of each test statistic, the corresponding p-value, reject independence (1) or not (0), and the critical value at significance level 0.05:
```
         test statistic p-value reject independence critical value
EL           0.39887816  0.5200                   0      1.4329523
KS           0.31884122  0.8956                   0      0.6664304
CvM          0.03267605  0.8528                   0      0.1961564
AD           1.98834920  0.7074                   0      7.8084519
spearman    -0.17575758  0.6902                   0      0.5515152
kendall     -0.20000000  0.7611                   0      0.4222222
```

The argument `Copula="Calyton"` in the function `RV_CopTau` above can be changed to `Copula="Frank"` and `Copula="Gumbel"` to generate a random sample from the Frank and Gumbel copulas, respectively. The Gaussian copula can also be considered. See these details in [IllustrativeExamples.R](https://raw.githubusercontent.com/cftang9/PQD/master/IllustrativeExamples.R).

For a quick illustration, we set n=10 above. Other sample sizes can be considered as well. However, When the sample size is large, it will take a longer time to run.


### 1.2 For your own data
Please use these R commands after naming the data by X and Y:
```R
source("https://raw.githubusercontent.com/cftang9/PQD/master/EL_PQD_Library.R")
# name your data by X and Y
IndvsPQD(X,Y,graph=TRUE)
```

## Part 2: To reproduce the simulation results

### 2.1 Table 1 in Section 3 of the manuscript 
To reproduce Table 1, which involves four classic copulas: Clayton, Frank, Gumbel, and Gaussian, please run this R program:
[Clayton_Frank_Gumbel_and_Gaussian_n=100.R](https://raw.githubusercontent.com/cftang9/PQD/master/Restricted_t_FGM_and_CA_n%3D100.R).
But be aware of that, because the number of replications is 10,000, this program might take a long time to finish. As stated in our manuscript, our calculation of Table 1 took approximately 73 minutes on a computer with a 3.1GHz processor and 16GB of memory. 

### 2.2 Tables C.1 and C.2 in Web Appendix C

Table 1 considers n=100. We also included the same table but with n=50 and 200 in Web Appendix C. To reproduce those two tables. Please run [Clayton_Frank_Gumbel_and_Gaussian_n=50.R](https://raw.githubusercontent.com/cftang9/PQD/master/Restricted_t_FGM_and_CA_n%3D50.R)
and
[Clayton_Frank_Gumbel_and_Gaussian_n=200.R](https://raw.githubusercontent.com/cftang9/PQD/master/Restricted_t_FGM_and_CA_n%3D200.R), respectively.

### 2.3 Tables C.3-C.5 in Web Appendix C

In addition to the Clayton, Frank, Gaussian, and Gumbel copulas, we have also considered the FGM and CA copulas and a restricted bivariate t distribution family. The results are presented in Tables C.3-C.5 in Web Appendix C. To reproduce these tables, please run
[Restricted_t_FGM_and_CA n=50.R](https://raw.githubusercontent.com/cftang9/PQD/master/Restricted_t_FGM_and_CA_n%3D100.R),
[Restricted_t_FGM_and_CA n=100.R](https://raw.githubusercontent.com/cftang9/PQD/master/Restricted_t_FGM_and_CA_n%3D50.R),
and
[Restricted_t_FGM_and_CA_n=200.R](https://raw.githubusercontent.com/cftang9/PQD/master/Restricted_t_FGM_and_CA_n%3D200.R).

## Part 3: To reproduce the real data analysis results in Section 4 of the manuscript
We applied all tests in this manuscript to three data applications. To reproduce the results of our analysis (Table 2 and Figures 2-4), please run the R program for each. The data included in the CSV file will be automatically read by the corresponding R program.


### 3.1 Twins Data

Data: [TwinsData.csv](https://raw.githubusercontent.com/cftang9/PQD/master/TwinsData.csv) 
(R program: [TwinsData.R](https://raw.githubusercontent.com/cftang9/PQD/master/TwinsData.R))

### 3.2 Education data

Data: [EducationData.csv](https://raw.githubusercontent.com/cftang9/PQD/master/EducationData.csv)
(R program: [EducationData.R](https://raw.githubusercontent.com/cftang9/PQD/master/EducationData.R))


### 3.3 Stock Data

Data: [StockData.csv](https://raw.githubusercontent.com/cftang9/PQD/master/StockData.csv) 
(R program: [StockData.R](https://raw.githubusercontent.com/cftang9/PQD/master/StockData.R))






