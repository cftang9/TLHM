rm(list=ls(all=TRUE))
library(stabledist)
library(xtable)
source("TL_Library.R")

n = 10^6; alpha = 0.50

B = 1000; 
M = array(,B); N.Upper = M; 

### Generating random samples from F(1,\alpha) and calculate the number of observations exceeding the sample mean
st.time = Sys.time()
set.seed(03282021)
for(b in 1:B){
  X = rstable(n, 
              alpha=alpha, 
              beta=1, 
              gamma=abs(1-complex(imaginary=1)*tan(pi*alpha/2))^(-1/alpha), 
              delta=0,pm=1)
  in.time = (Sys.time()-st.time)/b
  N.Upper[b] = Num.Upper(X)
  if(b%%100==0){
    print(b)
    print(Sys.time())
    print(Sys.time()+(B-b)*in.time)
  }
}

### Drawing Figure 1 
par(mfrow=c(1,2))
hist(N.Upper/n^(alpha), col="red", 20,
     ylim = c(0,B), 
     xlab="", 
     main = expression(
       paste("Histogram of ", U^-alpha/Gamma(1-alpha), " and ", N[n]^"+"/n^alpha))
)
set.seed(03282021)
###### Generating random sample U_1,...U_B from F(1,\alpha). 
U = rstable(B,alpha=alpha, 
            beta=1, 
            gamma=abs(1-complex(imaginary=1)*tan(pi*alpha/2))^(-1/alpha), 
            delta=0,pm=1)
hist(U^(-alpha)/gamma(1-alpha), add=T, col=rgb(0, 1, 0, 0.5))
legend("topright", 
       c(expression(U^-alpha/Gamma(1-alpha)), expression(N[n]^"+"/n^alpha)), 
       lty=c(1,1), 
       lwd=c(2.5,2.5),col=c(rgb(0, 1, 0, 0.5),"red"))
###### Performing two-sample Kolmogorov–Smirnov test
ks.test(N.Upper/n^(alpha), U^(-alpha)/gamma(1-alpha))
###### QQ plots for N.Upper/n^alpha versus U^(-alpha)/gamma(1-alpha)
plot((sort(N.Upper/n^(alpha))), (sort(U^(-alpha)/gamma(1-alpha))), 
     xlab = expression(paste(N[n]^"+"/n^alpha)),
     ylab = expression(paste(U^-alpha/Gamma(1-alpha))),
     main = expression(
       paste("qqplot of ", U^-alpha/Gamma(1-alpha), " and ", N[n]^"+"/n^alpha)))
abline(0,1,lty=3)
par(mfrow=c(1,1))
