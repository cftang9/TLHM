# Taylor’s law of fluctuation scaling for semivariances and higher moments of heavy-tailed data

This repository contains R programs for the article, “Taylor’s law of fluctuation scaling for semivariances and higher moments of heavy-tailed data.” 
This article has been submitted for publication. 

Prior to using R programs on this repository, please download the main R program [TL_Library.R](https://raw.githubusercontent.com/cftang9/TLHM/main/TL_Library.R?token=AK5HQA6Q4B5CG23Z6JUG5FLBOBB3I). R packages, ```stabledist``` and ```xtable```, are used to generate random sample from one-sided stable law F(c,&alpha;) with c>0 and 0<&alpha;<1, and organize simulation results, respectively.  

## Part 1. Tail-index estimator comparison. 
Here we generate random samples from F(1,&alpha;) and evaluate the performance of the proposed tail-index estimators of &alpha; from the Bias (x 10^3; average of estimate minus true &alpha;) and MSE (mean squared \[estiamte minus true &alpha;\]). 
### 1.1. Bias and MSE of the estimators with 0<&alpha;<1 and c=1 (Tables 1 and 2 in manuscript). 
Bias and MSE of the estimators, B1, B2, B3, HI.N, HI.M, HI.Opt, and MHB3 with 0<&alpha;<1 and c=1 (Tables 1 and 2 in manuscript). 
[Table 1-2](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_01-02.R?token=AK5HQA4J3HLEWRVYUUCPWLTBOCIRY)

### 1.2. Bias and MSE of the estimators with 0<&alpha;<1 and c=0.5,1,2 (Tables 1-6 in Supporting Information).
For the Bias and MSE of the estimators, B1, B2, B3, HI.N, HI.M, HI.Opt, and MHB3 with 0<&alpha;<1 and c=1 (Tables 1 and 2 in SI), 
[Table 1-2 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_01-02.R?token=AK5HQA5XXBNNVMPISTSSHC3BOCHDW) 

Bias and MSE of the estimators, B1, B2, B3, HI.N, HI.M, HI.Opt, and MHB3 with 0<&alpha;<1 and c=0.5 (Tables 1 and 2 in manuscript). 
[Table 3-4 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_03-04.R?token=AK5HQA5BMI3SIVNZFN3ZBDDBOCHD4)

Bias and MSE of the estimators, B1, B2, B3, HI.N, HI.M, HI.Opt, and MHB3 with 0<&alpha;<1 and c=2 (Tables 1 and 2 in manuscript). 
[Table 5-6 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_05-06.R?token=AK5HQA56S5F4L7PGTGQWJ4DBOCHEA)

## Part 2. Convergence of the number of observations exceeding the sample mean and the generalized Taylor's law 

### 2.1. Histgrams of U<sup>-&alpha;</sup>/&Gamma;(1-&alpha;) and N<sub>n</sub><sup>+</sup>/n<sup>&alpha;</sup> (Figures 1 and 2 in manuscript).
[Figure 1](https://raw.githubusercontent.com/cftang9/TLHM/main/Manu_Figure_01.R?token=AK5HQAZYL7GRDB3HGRPBQ63BOCMF4)
<img width="1194" alt="Figure 1" src="https://user-images.githubusercontent.com/45774851/138150607-d57d1fdb-fb48-4a40-bf0d-023014292882.png">

[Figure 2](https://raw.githubusercontent.com/cftang9/TLHM/main/Manu_Figure_02.R?token=AK5HQA3INRWXTGWOYJ5FRALBOCMF6)
<img width="1194" alt="Figure 2" src="https://user-images.githubusercontent.com/45774851/138150614-9386328b-1a08-4718-9949-2ae6d7fa5b16.png">

<--- ## Part 3. More of convergence speeds of the generalized Taylor's law and the number of observations exceeding the sample mean. ---> 

### 2.2. (Tables 7-8 in Supporting Information)
[Table 7-8 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_07-08.R?token=AK5HQA6DFCTQ6LRAJQLRYDLBOCHEG)
### 2.3. (Tables 9-11 in Supporting Information)

[Table 9 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_09.R?token=AK5HQA2CANIQ7NHIGNR4NM3BOCHLM)
[Table 10 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_10.R?token=AK5HQAY5UXXDRHP73JOZY7DBOCHLO)
[Table 11 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_11.R?token=AK5HQA2L5PP64A5VDDUBCATBOCHLU)
### 2.4. (Tables 12 in Supporting Information)
[Table 12 in SI](https://raw.githubusercontent.com/cftang9/TLHM/main/Supp_Table_12.R?token=AK5HQA7KQ3245FYW4R77BFLBOCHLY)


