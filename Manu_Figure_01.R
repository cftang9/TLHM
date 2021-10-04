rm(list=ls(all=TRUE))
library(stabledist)
library(fBasics)
library(StableEstim)
library(libstableR)
library(evd)
library(extremefit)
library(xtable)
source("TL_Library.R")

n = 10^6; 

B = 1000; 

alpha = 0.25



M = array(,B); V=M; V.Upper=M; V.Local.Upper=M; V.Lower=M; N.Upper=M; 
st.time = Sys.time()
set.seed(03282021)
for(b in 1:B){
  X = rstable(n, 
              alpha=alpha, 
              beta=1, 
              gamma=abs(1-complex(imaginary=1)*tan(pi*alpha/2))^(-1/alpha), 
              delta=0,pm=1)
  #X = rfrechet(n,loc=0,scale=1,shape=alpha)
  #X = rpareto(n, a=alpha, loc=0, scale=1)
  in.time = (Sys.time()-st.time)/b
  N.Upper[b] = Num.Upper(X)
  if(b%%100==0){
    print(b)
    print(Sys.time())
    print(Sys.time()+(B-b)*in.time)
  }
}

pdf(file = "025pp.pdf",   # The directory you want to save the file in
    width = 11, # The width of the plot in inches
    height = 5)

par(mfrow=c(1,2))
#par(mar=c(4,4,2,1))
hist(N.Upper/n^(alpha), col="red", 20,
     ylim = c(0,B), 
     xlab="", 
     main = expression(
       paste("Histogram of ", U^-alpha/Gamma(1-alpha), " and ", N[n]^"+"/n^alpha))
)
set.seed(03282021)
U = rstable(B,alpha=alpha, 
            beta=1, 
            gamma=abs(1-complex(imaginary=1)*tan(pi*alpha/2))^(-1/alpha), 
            delta=0,pm=1)
hist(U^(-alpha)/gamma(1-alpha), add=T, col=rgb(0, 1, 0, 0.5))
legend("topright", # places a legend at the appropriate place c(“Health”,”Defense”), # puts text in the legend
       c(expression(U^-alpha/Gamma(1-alpha)), expression(N[n]^"+"/n^alpha)), 
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5),col=c(rgb(0, 1, 0, 0.5),"red"))



ks.test(N.Upper/n^(alpha), U^(-alpha)/gamma(1-alpha))

ks.test(log(N.Upper/n^(alpha)), log(U^(-alpha)/gamma(1-alpha)))

plot((sort(N.Upper/n^(alpha))), (sort(U^(-alpha)/gamma(1-alpha))), 
     xlab = expression(paste(N[n]^"+"/n^alpha)),
     ylab = expression(paste(U^-alpha/Gamma(1-alpha))),
     main = expression(
       paste("qqplot of ", U^-alpha/Gamma(1-alpha), " and ", N[n]^"+"/n^alpha)))
abline(0,1,lty=3)

par(mfrow=c(1,1))

dev.off()

