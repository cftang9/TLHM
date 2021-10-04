rm(list=ls(all=TRUE))
library(stabledist)
library(fBasics)
library(StableEstim)
library(libstableR)
library(evd)
library(extremefit)
library(xtable)
library(evt0)
source("TL_Library.R")


n = 100; alpha.vec = seq(0.1,0.9,by=0.1); 
na = length(alpha.vec); 
Bias = array(,c(na,24))
MSE = array(,c(na,24))

B = 10000; Tail.Est = array(,c(B,24))
colnames(Tail.Est) <- c("B1", "B2", "B3", "B4", "B5", "B6", "B7",
                        "HI", "KE", "PK", "MM", "GH", 
                        "PP", "GP", "MX", "HI'", "PK'", "MM'", "GP'", "MX'","HIO","M3","M4","Com")
row.names(Bias) = alpha.vec
colnames(Bias) <- c("B1", "B2", "B3", "B4", "B5", "B6", "B7",
                    "HI", "KE", "PK", "MM", "GH", 
                    "PP", "GP", "MX", "HI'", "PK'", "MM'", "GP'", "MX'","HIO","M3","M4","Com")
row.names(MSE) = alpha.vec
colnames(MSE) <- c("B1", "B2", "B3", "B4", "B5", "B6", "B7",
                   "HI", "KE", "PK", "MM", "GH", 
                   "PP", "GP", "MX", "HI'", "PK'", "MM'", "GP'", "MX'","HIO","M3","M4","Com")
set.seed(03042021)
start.time0 = Sys.time()
for(i in 1:na){
  start.time = Sys.time()
  for(b in 1:B){
    X = rstable(n, 
                alpha=alpha.vec[i], 
                beta=1, 
                gamma=abs(1-complex(imaginary=1)*tan(pi*alpha.vec[i]/2))^(-1/alpha.vec[i])/2, 
                delta=0,pm=1)
    temp = Tail.ESTS(X)
    
    Tail.Est[b,1] = temp$B1
    Tail.Est[b,2] = temp$B2
    Tail.Est[b,3] = temp$B3
    Tail.Est[b,4] = temp$B4
    Tail.Est[b,5] = temp$B5
    Tail.Est[b,6] = temp$B6
    Tail.Est[b,7] = temp$B7
    
    Tail.Est[b,8] = temp$Hi
    Tail.Est[b,9] = temp$KE
    Tail.Est[b,10] = temp$PK 
    Tail.Est[b,11] = temp$MM
    Tail.Est[b,12] = temp$GH 
    
    Tail.Est[b,13] = temp$PP  
    Tail.Est[b,14] = temp$GP
    Tail.Est[b,15] = temp$Mi
    
    Tail.Est[b,16] = temp$Hi.p
    Tail.Est[b,17] = temp$PK.p
    Tail.Est[b,18] = temp$MM.p
    Tail.Est[b,19] = temp$GP.p
    Tail.Est[b,20] = temp$Mi.p
    
    Tail.Est[b,21] = temp$Hi.opt
    Tail.Est[b,22] = temp$B8
    Tail.Est[b,23] = temp$B9
    
    Tail.Est[b,24] = min(temp$Hi.opt, temp$B3)
    
    end.time = Sys.time()
    ave.time = (end.time - start.time)/b
    if(b%%500 == 0){
      print(c(alpha.vec[i],b))
      print(start.time0)
      print(Sys.time() + ave.time*(B-b) + ave.time*B*(na - i))
    }
  }
  Bias[i,] = apply(Tail.Est-alpha.vec[i],2,mean) 
  MSE[i,] = apply((Tail.Est-alpha.vec[i])^2,2,mean)
  print(Bias)
  print(MSE)
}


colnames(Tail.Est) <- c("B1", "B2", "B3", "B4", "B5", "B6", "B7",
                        "HI", "KE", "PK", "MM", "GH", 
                        "PP", "GP", "MX", "HI'", "PK'", "MM'", "GP'", "MX'","HI.Opt","M3","M4","min(B3,HI.Opt)")
colnames(Bias) <- c("B1", "B2", "B3", "B4", "B5", "B6", "B7",
                    "HI", "KE", "PK", "MM", "GH", 
                    "PP", "GP", "MX", "HI'", "PK'", "MM'", "GP'", "MX'","HI.Opt","M3","M4","min(B3,HI.Opt)")
colnames(MSE) <- c("B1", "B2", "B3", "B4", "B5", "B6", "B7",
                   "HI", "KE", "PK", "MM", "GH", 
                   "PP", "GP", "MX", "HI'", "PK'", "MM'", "GP'", "MX'","HI.Opt","M3","M4","min(B3,HI.Opt)")

round(Bias,5)*10^3
round(MSE^(1/2),5)*10^3

TabInd = c(1,2,3,4,5,6,11,12,15,8,16,21,22,23,24)
xtable(cbind(log(n,10),round(Bias[,TabInd],5)*10^3))
xtable(cbind(log(n,10),round((MSE[,TabInd])^(1/2),5)*10^3))

TabInd = c(3,21,24)
xtable(cbind(log(n,10),round(Bias[,TabInd],5)*10^3))
xtable(cbind(log(n,10),round((MSE[,TabInd])^(1/2),5)*10^3))

# TabB = c(1,2,3,4,5,6); 
# xtable(cbind(log(n,10),round(Bias[,TabB],5)*10^3))
# xtable(cbind(log(n,10),round((MSE[,TabB])^(1/2),5)*10^3))
# 
# TabN = c(11,12,15,8,16)
# xtable(cbind(log(n,10),round(Bias[,TabN],5)*10^3))
# xtable(cbind(log(n,10),round((MSE[,TabN])^(1/2),5)*10^3))

#save.image("CCC05n102B104HIK23.Rdata")