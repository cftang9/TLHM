# Taylor’s law of fluctuation scaling for semivariances and higher moments of heavy-tailed data

This repository contains R programs for the article, “Taylor’s law of fluctuation scaling for semivariances and higher moments of heavy-tailed data.” 
This article has been submitted for publication. 

Prior to using R programs on this repository, please download the main R program [TL_Library.R](https://raw.githubusercontent.com/cftang9/TLHM/main/TL_Library.R?token=AK5HQA6Q4B5CG23Z6JUG5FLBOBB3I). R packages, ```stabledist``` and ```xtable```, are used to generate random sample from one-sided stable law F(c,&alpha;) with c>0 and 0<&alpha;<1, and organize simulation results, respectively.  

## Part 1. Tail-index estimator comparison. 
Here we generate random samples from F(1,&alpha;) and evaluate the performance of the proposed tail-index estimators of &alpha; from the Bias (x 10^3; average of estimate minus true &alpha;) and MSE (mean squared \[estiamte minus true &alpha;\]). 
### 1.1. Bias and MSE of the estimators with 0<&alpha;<1 and c=1 (Tables 1 and 2 in manuscript). 
For the Bias and MSE of the estimators, B1, B2, B3, HI.N, HI.M, HI.Opt, and MHB3 with 0<&alpha;<1, c=1, and sample size n=10<sup>4</sup> based on 10<sup>4</sup> independent repetitions, one can use the ```R``` codes
[Table 1-2](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_01-02.R?token=AK5HQA4J3HLEWRVYUUCPWLTBOCIRY) to reproduce Tables 1 and 2. 
Our calculation took approximately 10 minutes for n=10<sup>5</sup> on a computer with a 3.0GHz processor and 64GB of memory.

### 1.2. Bias and MSE of the estimators with 0<&alpha;<1 and c=0.5,1,2 (Tables 1-6 in Supporting Information).
For the Bias and MSE of the estimators, B1, B2, B3, HI.N, HI.M, HI.Opt, and MHB3 with 0<&alpha;<1, one can use the rcodes [Table 1-2 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_01-02.R?token=AK5HQA5XXBNNVMPISTSSHC3BOCHDW) for c=1, 
[Table 3-4 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_03-04.R?token=AK5HQA5BMI3SIVNZFN3ZBDDBOCHD4) for c=0.5, and 
([Table 5-6 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_05-06.R?token=AK5HQA56S5F4L7PGTGQWJ4DBOCHEA)) for c=2, based on 10<sup>4</sup>
independent repetitions. 
One can change the sample size n in the ```R``` codes to obtain the Bias and MSE for sample size n in {10<sup>2</sup>, 10<sup>3</sup>, 10<sup>4</sup>, 10<sup>5</sup>}. Our calculation took approximately 30 minutes for n=10<sup>5</sup> on a computer with a 3.0GHz processor and 64GB of memory.
## Part 2. Convergence of the number of observations exceeding the sample mean and the generalized Taylor's law. 

### 2.1. Histgrams and QQ-plot of U<sup>-&alpha;</sup>/&Gamma;(1-&alpha;) and N<sub>n</sub><sup>+</sup>/n<sup>&alpha;</sup> (Figures 1 and 2 in manuscript). 
We used the ```R``` codes 
[Figure 1](https://raw.githubusercontent.com/cftang9/TLHM/main/Manu_Figure_01.R?token=AK5HQAZYL7GRDB3HGRPBQ63BOCMF4) for the histgrams and QQ-plot of U<sup>-&alpha;</sup>/&Gamma;(1-&alpha;) and N<sub>n</sub><sup>+</sup>/n<sup>&alpha;</sup>  when &alpha;=0.25 
<img width="1194" alt="Figure 1" src="https://user-images.githubusercontent.com/45774851/138150607-d57d1fdb-fb48-4a40-bf0d-023014292882.png">
and 
[Figure 2](https://raw.githubusercontent.com/cftang9/TLHM/main/Manu_Figure_02.R?token=AK5HQA3INRWXTGWOYJ5FRALBOCMF6) for &alpha;=0.5. 
<img width="1194" alt="Figure 2" src="https://user-images.githubusercontent.com/45774851/138150614-9386328b-1a08-4718-9949-2ae6d7fa5b16.png">

### 2.2. Bias and MSE of R<sub>L</sub> to 2 (Tables 7-8 in Supporting Information)
We use 
[Table 7-8 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_07-08.R?token=AK5HQA6DFCTQ6LRAJQLRYDLBOCHEG)
to obtain the Bias and MSE to demonstrate the Taylor's law for lower semivariance when 0<&alpha;<1 based on 10<sup>4</sup> independent repetitions. 

### 2.3. Effect of sample size to the convergence of the moment ratios (Theorems 3 and 6) and N<sub>n</sub><sup>+</sup>/n<sup>&alpha;</sup> in Theorems 9 (Tables 9-11 in Supporting Information)

[Table 9 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_09.R?token=AK5HQA2CANIQ7NHIGNR4NM3BOCHLM)
[Table 10 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_10.R?token=AK5HQAY5UXXDRHP73JOZY7DBOCHLO)
[Table 11 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_11.R?token=AK5HQA2L5PP64A5VDDUBCATBOCHLU)

### 2.4. Effect of smaple size to the convergence of the ratio of sample mean and lower semivariance in Theorem 1, the  Taylor's Laws for semivariances (Tables 12 in Supporting Information)
[Table 12 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_12.R?token=AK5HQA7KQ3245FYW4R77BFLBOCHLY)


