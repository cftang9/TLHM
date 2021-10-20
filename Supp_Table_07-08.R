rm(list=ls(all=TRUE))
library(stabledist)
library(fBasics)
library(StableEstim)
library(xtable)
source("TL_Library.R")

n = 100; alpha.vec = seq(0.1,0.9,by=0.1); 
na = length(alpha.vec); 
Bias = array(,na)
MSE = array(,na)

B = 10000; Tail.Est = array(,B)
set.seed(03042021)
start.time0 = Sys.time()
for(i in 1:na){
  start.time = Sys.time()
  for(b in 1:B){
    X = rstable(n, 
                alpha=alpha.vec[i], 
                beta=1, 
                gamma=abs(1-complex(imaginary=1)*tan(pi*alpha.vec[i]/2))^(-1/alpha.vec[i]), 
                delta=0,pm=1)
    m = mean(X); 
    Tail.Est[b] = log(Var.Lower(X))/log(m)
    
    end.time = Sys.time()
    ave.time = (end.time - start.time)/b
    # if(b%%500 == 0){
    #   print(c(alpha.vec[i],b))
    #   print(start.time0)
    #   print(Sys.time() + ave.time*(B-b) + ave.time*B*(na - i))
    # }
  }
  Bias[i] = mean(Tail.Est-2)
  MSE[i] = mean((Tail.Est-2)^2)
}

round(Bias,5)*10^3
round(MSE,5)*10^3

