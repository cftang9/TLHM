rm(list=ls(all=TRUE))
library(stabledist)
source("TL_Library.R")

### change n = 100 to 10^3, 10^4, and 10^5 for the rest of the Bias and MSE for other sample sizes.  
n = 100; alpha.vec = seq(0.1,0.9,by=0.1); 
na = length(alpha.vec); 
Bias = array(,c(na,7))
MSE = array(,c(na,7))

B = 10000; Tail.Est = array(,c(B,7))
colnames(Tail.Est) <- c("B1", "B2", "B3","HI.N", "HI.M","HI.Opt","MHB3")
row.names(Bias) = alpha.vec
colnames(Bias) <- c("B1", "B2", "B3","HI.N", "HI.M","HI.Opt","MHB3")
row.names(MSE) = alpha.vec
colnames(MSE) <- c("B1", "B2", "B3","HI.N", "HI.M","HI.Opt","MHB3")
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
    temp = Tail.ESTS(X)
    
    Tail.Est[b,1] = temp$B1
    Tail.Est[b,2] = temp$B2
    Tail.Est[b,3] = temp$B3
    Tail.Est[b,4] = temp$Hi
    Tail.Est[b,5] = temp$Hi.p
    Tail.Est[b,6] = temp$Hi.opt
    Tail.Est[b,7] = min(temp$Hi.opt, temp$B3)
    
    end.time = Sys.time()
    ave.time = (end.time - start.time)/b
    # if(b%%500 == 0){
    #   print(c(alpha.vec[i],b))
    #   print(start.time0)
    #   print(Sys.time() + ave.time*(B-b) + ave.time*B*(na - i))
    # }
  }
  Bias[i,] = apply(Tail.Est-alpha.vec[i],2,mean) 
  MSE[i,] = apply((Tail.Est-alpha.vec[i])^2,2,mean)
  # print(Bias)
  # print(MSE)
}

round(Bias,5)*10^3
round(MSE,5)*10^3
