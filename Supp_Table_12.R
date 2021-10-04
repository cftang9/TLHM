rm(list=ls(all=TRUE))
library(stabledist)
library(fBasics)
library(StableEstim)
library(xtable)

source("TL_Library.R")

n = 10^8; 

B = 100; 


alpha.vec = seq(0.1,0.9,by=0.1)

Sortino.ratio = array(,c(length(alpha.vec),B))


for(k in 1:length(alpha.vec)){
  alpha = alpha.vec[k]
  set.seed(07312021 + k)
  start.time = Sys.time()
  for(b in 1:B){
    X = rstable(n, 
                alpha = alpha, 
                beta = 1, 
                gamma = abs(1-complex(imaginary=1)*tan(pi*alpha/2))^(-1/alpha), 
                delta = 0, pm = 1)
    #X = rpareto(n, a=alpha, loc=0, scale=1/(gamma(1-alpha))^(1/alpha))
    mX = mean(X)
    
    if(1==1){
      #upper.X = X[X>mX]
      #lower.X = X[X<=mX]
      #upper.var.X = sum((upper.X - mX)^2)/(n-1)
      lower.var.X = sum((X[X<mX] - mX)^2)/(n-1)
      
      Sortino.ratio[k,b] = (lower.var.X)/mX^2  
    }
    temp.time = Sys.time()
    int.time = (temp.time - start.time)/b
    if(b%%10==0){
      print(c(alpha,b))
      print(start.time)
      print(Sys.time()+(B-b)*int.time + (length(alpha.vec)-k)*B*int.time)
    }
  }
}

xtable(t(apply(abs(Sortino.ratio-1),1,PropTol)))
