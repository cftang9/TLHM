rm(list=ls(all=TRUE))
library(stabledist)
library(fBasics)
library(StableEstim)
library(xtable)

source("TL_Library.R")

alpha.vec = seq(0.1,0.9,by=0.1); 
n = 10^5; 
L = 1000; 
hs = c(1,2,3,4); 

B = 1000; 

mX = array(,B); 
vX = array(,B); 
LvX = array(,B); 

pow = c(1,2,3,4); 
pX = array(,c(B,length(pow))); 
pU = array(,c(B,length(pow))); 

num.uX = array(,B); 

BB = 100; 
power.ks.test = array(0,c(length(alpha.vec),6+1)); 

for(k in 1:length(alpha.vec)){
  alpha = alpha.vec[k]
  start.time = Sys.time() 
  for(bb in 1:BB){
    set.seed(07312021+bb)
    for(b in 1:B){
      # Approximate a random variable from the asymptotic distribution by LePage et al. (1981). 
      E = rexp(L); 
      G = cumsum(E); 
      pU[b,] = slp(G,-pow/alpha); 
      
      # Generating a random sample from the stable law. 
      X = rstable(n, 
                  alpha = alpha, 
                  beta = 1, 
                  gamma = abs(1-complex(imaginary=1)*tan(pi*alpha/2))^(-1/alpha), 
                  delta = 0, pm = 1)
      
      # sample mean, variance, and moments
      mX[b] = mean(X);
      vX[b] = var(X);
      pX[b,] = slp(X,pow)/n; 
      
      num.uX[b] = sum(X>mX[b])
      
      # partial moments: 
      # UX: the observations larger than the sample mean
      # VX: the observations larger than the sample mean
      # UX = X[X>mX[b]]; 
      # LX = X[X<=mX[b]]; 
      # Lower and upper semi-variances
      # LvX[b] = sum( (LX-mX[b])^2 )/n;
      # UvX[b] = sum( (UX-mX[b])^2 )/n;
      # Lower moments and upper moments
      # pUX[b,] = slp(UX,pow)/n; 
      # pLX[b,] = slp(LX,pow)/n; 
    }
    
    #(1,2), (1,3), (1,4), (2,3), (2,4), (3,4) 
    ind.p = rbind(c(pow[1],pow[2]),
                  c(pow[1],pow[3]),
                  c(pow[1],pow[4]),
                  c(pow[2],pow[3]),
                  c(pow[2],pow[4]),
                  c(pow[3],pow[4]))
    ind = rbind(c(1,2),
                c(1,3),
                c(1,4),
                c(2,3),
                c(2,4),
                c(3,4))
    for(j in 1:6){
      ind1 = ind[j,1]; ind2 = ind[j,2]; 
      h1 = pow[ind1]; h1;
      h2 = pow[ind2]; h2;
      RXh12 = pX[,ind2]/(pX[,ind1])^(agh(alpha,h2,h1))
      RUh12 = cthm6(alpha,h2,h1)*pU[,ind2]/(pU[,ind1])^(agh(alpha,h2,h1))
      power.ks.test[k,j] = c(ks.test(RXh12,RUh12)$p.value<=0.05)/BB + power.ks.test[k,j]
    }
    
    U = rstable(n, 
                alpha = alpha, 
                beta = 1, 
                gamma = abs(1-complex(imaginary=1)*tan(pi*alpha/2))^(-1/alpha), 
                delta = 0, pm = 1)
    power.ks.test[k,7] = c(ks.test(num.uX[b]/n^(alpha), U^(-alpha)/gamma(1-alpha))$p.value<=0.05)/BB + power.ks.test[k,7]
    
    temp.time = Sys.time() 
    int.time = (temp.time - start.time)/bb
    if(bb%%10==0){
      print(start.time)
      print(c(alpha,bb))
      print(Sys.time() + int.time*(BB-bb) + (length(alpha.vec) - k)*int.time*BB )
    }
  }
}


xtable(data.frame(cbind(alpha.vec,power.ks.test)))

