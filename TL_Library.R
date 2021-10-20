Summary.stat = function(Data.HT){
  n = length(Data.HT); M1 = mean(Data.HT); Var.all = var(Data.HT); 
  Data.upper = Data.HT[Data.HT>M1];
  Data.lower = Data.HT[Data.HT<=M1];
  Num.upper = length(Data.upper);   
  Var.upper = 1; 
  Var.lower = 1; 
  Var.upper.local = 1; 
  Hill.est = 1; 
  if(Num.upper>=1){
    Var.upper = sum(Data.upper-M1)^2/(n-1);
    Var.lower = sum(Data.lower-M1)^2/(n-1);
    Var.upper.local = Var.upper*(n-1)/Num.upper; 
    Hill.est = mean(log(Data.upper)-log(M1))
  }
  return(list(M1 = M1, 
              Var.all = Var.all, 
              Num.upper = Num.upper, 
              Hill.est = Hill.est,
              Var.upper = Var.upper, 
              Var.lower = Var.lower, 
              Var.upper.local = Var.upper.local))
}


Tail.estimators = function(Data.HT){
  n = length(Data.HT); M1 = mean(Data.HT); Var.all = var(Data.HT); 
  Data.upper = Data.HT[Data.HT>M1]; 
  Num.upper = length(Data.upper);   
  Var.upper = 1; Var.upper.local = 1; 
  Hill.est = 1; 
  if(Num.upper>=1){
    Var.upper = sum(Data.upper-M1)^2/(n-1);      
    Var.upper.local = Var.upper*(n-1)/Num.upper; 
    Hill.est = mean(log(Data.upper)-log(M1))
  }
  R1 = log(Var.all)/log(M1);
  R2 = log(Var.upper)/log(M1); 
  R3 = log(Var.upper.local)/log(M1); 
  
  if(R1>=2) B1 = (R1 - 2)/(R1 - 1); 
  if(R1< 2) B1 = 1; 
  if(R2>=2) B2 = (R2 - 2)/(R2 - 1); 
  if(R2< 2) B2 = 1; 
  if(R3>=2) B3 = (R3 - sqrt(R3^2 - 4*(R3-2)))/2; 
  if(R3< 2) B3 = 1; 
  
  B4 = log(Num.upper)/log(n); 
  B5 = log(n / Num.upper) / log(M1);
  
  B6 = (1 + log(M1)/log(n) )^(-1)
  
  B7 = (sum(log(Data.upper/M1))/Num.upper)^(-1)
  
  return(c(B1,B2,B3,B4,B5,B6,B7))
}


Var.Upper = function(X){
  m = mean(X);
  X.U = X[X>m];
  Var.Upper = sum(X.U - m)^2/(length(X)-1); 
  return(Var.Upper)
}

Var.Local.Upper = function(X){
  m = mean(X);
  X.U = X[X>m];
  Var.Local.Upper = sum(X.U - m)^2/(length(X.U)); 
  return(Var.Local.Upper)
}

Var.Lower = function(X){
  m = mean(X);
  X.L = X[X<=m];
  Var.Lower = sum((X.L - m)^2)/(length(X)-1); 
  return(Var.Lower)
}

Num.Upper = function(X){
  m = mean(X);
  Num.Upper = sum(X>m);
  return(Num.Upper)
}

HI = function(X){
  m = mean(X);
  Data.upper = X[X>m]
  Num.upper = length(Data.upper);
  HI = (sum(log(Data.upper/m))/Num.upper)^(-1)
  return(HI)
}

pv = function(MS){
  #MS = R1.linear.fit.2
  modelSummary <- MS
  modelCoeffs <- modelSummary$coefficients  
  beta.estimate <- modelCoeffs[2:3]  # get beta estimate for speed
  std.error <- sqrt(sum(MS$residuals^2)/MS$df.residual)  # get std.error for speed
  t_value <- beta.estimate/std.error  # calc t statistic
  pv <- 2*pt(-abs(t_value), df=MS$df.residual)
  return(pv)
}

Supporting.TL = function(MS){
  #MS = R1.linear.fit.2
  modelSummary <- MS
  modelCoeffs <- modelSummary$coefficients  
  beta.estimate <- modelCoeffs[2:3]  # get beta estimate for speed
  std.error <- sqrt(sum(MS$residuals^2)/MS$df.residual)  # get std.error for speed
  t_value <- beta.estimate/std.error  # calc t statistic
  pv <- 2*pt(-abs(t_value), df=MS$df.residual)
  Supporting.TL = as.logical(pv[1]<0.05 & pv[2]>=0.05 )
  return(Supporting.TL)
}


SCMoment = function(X,Order=2,ind="all"){
  if(ind=="all"){
    SCMoment = mean((X-mean(X))^Order)
    return(SCMoment)
  }
  if(ind=="neg"){
    nn = sum(X<=mean(X))
    SCMoment = sum( ( min(X-mean(X),0) )^Order )/nn
    return(SCMoment)
  }
  if(ind=="pos"){
    np = sum(X>mean(X))
    SCMoment = sum( ( max(X-mean(X),0) )^Order )/np
    return(SCMoment)
  }
}



TEs = function(Data.HT){
  n = length(Data.HT); M1 = mean(Data.HT); Var.all = var(Data.HT); 
  Data.upper = Data.HT[Data.HT>M1]; 
  Num.upper = length(Data.upper);   
  Var.upper = 1; Var.upper.local = 1; 
  Hill.est = 1; 
  if(Num.upper>=1){
    Var.upper = sum(Data.upper-M1)^2/(n-1);      
    Var.upper.local = Var.upper*(n-1)/Num.upper; 
    Hill.est = mean(log(Data.upper)-log(M1))
  }
  R1 = log(Var.all)/log(M1);
  R2 = log(Var.upper)/log(M1); 
  R3 = log(Var.upper.local)/log(M1); 
  
  if(R1>=2) B1 = (R1 - 2)/(R1 - 1); 
  if(R1< 2) B1 = 1; 
  if(R2>=2) B2 = (R2 - 2)/(R2 - 1); 
  if(R2< 2) B2 = 1; 
  if(R3>=2) B3 = (R3 - sqrt(R3^2 - 4*(R3-2)))/2; 
  if(R3< 2) B3 = 1; 
  
  B4 = log(Num.upper)/log(n); 
  B5 = log(n / Num.upper) / log(M1);
  B6 = (1 + log(M1)/log(n) )^(-1)
  B7 = (sum(log(Data.upper/M1))/Num.upper)^(-1)
  
  return(list(B1=B1,B2=B2,B3=B3,B4=B4,B5=B5,B6=B6,B7=B7))
}


Tail.HI = function(X){
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; 
  j = 1:k; 
  xi.HI = sum(log(X[n-j+1]) - log(X[n-k]))/k
  Tail.HI = 1/xi.HI
  return(Tail.HI)
}

Ker = function(u,unif,Kernel = "Gauss"){
  if(Kernel == "unif") Ker = c(u<1 & u>0) #K = pmin(pmax(0, u),1); 
  if(Kernel == "Gauss") Ker = dnorm(u); 
  return(Ker); 
}

Tail.KE = function(X){
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; 
  j = 1:k; 
  xi.KE = sum((j/k)*Ker(j/k)*(log(X[n-j+1]) - log(X[n-j])))/ ((1/k)*sum(Ker(j/k)))
  Tail.KE = 1/xi.KE
  return(Tail.KE)
}

Tail.PK = function(X){
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; 
  xi.PK = (X[n - ceiling(k/4)] - X[n - ceiling(k/2)])/(X[n - ceiling(k/2)] - X[n - k])/log(2)
  Tail.PK = 1/xi.PK
  return(Tail.PK)
}

Tail.MM = function(X){
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; j = 1:k; 
  Mk1 = sum( (log(X[n-j+1]) - log(X[n-k]))^1 ) / k
  Mk2 = sum( (log(X[n-j+1]) - log(X[n-k]))^2 ) / k
  
  xi.MM = Mk1 + 1 - (1-Mk1^2/Mk2)^(-1)/2
  Tail.MM = 1/xi.MM
  return(Tail.MM)
}

Tail.GH = function(X){
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; j = 1:k; xiHjn = array(,k)
  for(l in 1:(k+1)){
    xiHjn[l] = sum(log(X[(n-l+1):n])- log(X[n-l]))/l
  }
  UH = X[n-c(j,k+1)]*xiHjn; 
  xi.GH = sum(log(UH) - log(UH[k+1]))/k
  Tail.GH = 1/xi.GH
  return(Tail.GH)
}

Tail.GPPWM = function(X){
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; j = 1:k; 
  
  as1 = sum( ((j-1)/(k-1))^1 * (X[n-j+1] - X[n-k]) )/k
  as0 = sum( ((j-1)/(k-1))^0 * (X[n-j+1] - X[n-k]) )/k
  
  xi.GPPWM = 1 - 2*as1/(as0-2*as1)
  Tail.GPPWM = 1/xi.GPPWM
  return(Tail.GPPWM)
}

Tail.PPWM = function(X){
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; j = 1:k; 
  
  a1 = sum( ((j-1)/(k-1))^1 * (X[n-j+1] ) )/k
  a0 = sum( ((j-1)/(k-1))^0 * (X[n-j+1] ) )/k
  
  xi.PPWM = 1 - a1/(a0-a1)
  Tail.PPWM = 1/xi.PPWM
  return(Tail.PPWM)
}

Tail.Mix = function(X){
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; j = 1:k; 
  xi.HI = sum(log(X[n-j+1]) - log(X[n-k]))/k
  Lkn1 = 1-sum(X[n-k]/X[n-j+1])/k
  pkn = (xi.HI - Lkn1)/(Lkn1^2)
  xi.Mix = (pkn-1)/(1+2*min(pkn-1,0))
  Tail.Mix = 1/xi.Mix
  return(Tail.Mix)
}


Tail.ESTS = function(Data.HT){
  n = length(Data.HT); M1 = mean(Data.HT); 
  Var.all = var(Data.HT); 
  Data.upper = Data.HT[Data.HT>M1]; 
  Num.upper = length(Data.upper);   
  Var.upper = 1; Var.upper.local = 1; 
  Hill.est = 1; 
  if(Num.upper>=1){
    Var.upper = sum(Data.upper-M1)^2/(n-1);      
    Var.upper.local = Var.upper*(n-1)/Num.upper; 
    M3.upper = sum(Data.upper-M1)^3/n;      
    M3.upper.local = M3.upper*n/Num.upper; 
    M4.upper = sum(Data.upper-M1)^4/n;      
    M4.upper.local = M4.upper*n/Num.upper; 
    Hill.est = mean(log(Data.upper)-log(M1))
  }
  R1 = log(Var.all)/log(M1);
  R2 = log(Var.upper)/log(M1); 
  R3 = log(Var.upper.local)/log(M1); 
  
  R4 = log(M3.upper)/log(M1); 
  R5 = log(M4.upper)/log(M1); 
  
  if(R1>=2) B1 = (R1 - 2)/(R1 - 1); 
  if(R1< 2) B1 = 1; 
  if(R2>=2) B2 = (R2 - 2)/(R2 - 1); 
  if(R2< 2) B2 = 1; 
  if(R3>=2) B3 = (R3 - sqrt(R3^2 - 4*(R3-2)))/2; 
  if(R3< 2) B3 = 1; 
  
  if(R4>=2) B8 = (R4 - sqrt(R4^2 - 4*(R3-3)))/2; 
  if(R4< 2) B8 = 1; 
  if(R5>=2) B9 = (R5 - sqrt(R5^2 - 4*(R5-4)))/2; 
  if(R5< 2) B9 = 1; 
  
  B4 = log(Num.upper)/log(n); 
  B5 = log(n / Num.upper) / log(M1);
  B6 = (1 + log(M1)/log(n) )^(-1)
  B7 = (sum(log(Data.upper/M1))/Num.upper)^(-1)
  
  X = sort(X); n = length(X); m = mean(X); 
  pn = sum(X>m); 
  k = pn+1; j = 1:k; jp = 1:pn; 
  
  xi.HI = sum(log(X[n-j+1]) - log(X[n-k]))/k
  Tail.HI = 1/xi.HI
  
  ko = floor(n^(2/3))
  jo = 1:ko
  xi.HI.opt = sum(log(X[n-jo+1]) - log(X[n-ko]))/ko
  Tail.HI.opt = 1/xi.HI.opt
  
  #xi.HI.p = sum(log(X[n-jp+1]/m))/pn
  xi.HI.p = sum(log(X[n-jp+1]/m))/k
  Tail.HI.p = 1/xi.HI.p
  
  xi.KE = sum((j/k)*Ker(j/k)*(log(X[n-j+1]/X[n-j])))/ ((1/k)*sum(Ker(j/k)))
  Tail.KE = 1/xi.KE
  
  xi.PK = (X[n - ceiling(k/4)] - X[n - ceiling(k/2)])/(X[n - ceiling(k/2)] - X[n-k])/log(2)
  Tail.PK = 1/xi.PK
  
  xi.PK.p = (X[n - ceiling(pn/4)] - X[n - ceiling(pn/2)])/(X[n - ceiling(pn/2)] - m)/log(2)
  Tail.PK.p = 1/xi.PK.p
  
  Mk1 = sum( (log(X[n-j+1]/X[n-k]))^1 ) / k
  Mk2 = sum( (log(X[n-j+1]/X[n-k]))^2 ) / k
  
  xi.MM = Mk1 + 1 - (1-Mk1^2/Mk2)^(-1)/2
  Tail.MM = 1/xi.MM
  
  Mk1.p = sum( (log(X[n-jp+1]/m))^1 ) / pn
  Mk2.p = sum( (log(X[n-jp+1]/m))^2 ) / pn
  
  xi.MM.p = Mk1.p + 1 - (1-Mk1.p^2/Mk2.p)^(-1)/2
  Tail.MM.p = 1/xi.MM.p
  
  xiHjn = array(,k); 
  for(l in 1:(k+1)){
    xiHjn[l] = sum(log(X[(n-l+1):n]/X[n-l]))/l
  }
  UH = X[n-c(j,k+1)]*xiHjn; 
  xi.GH = sum(log(UH) - log(UH[k+1]))/k
  Tail.GH = 1/xi.GH
  
  as1 = sum( ((j-1)/(k-1))^1 * (X[n-j+1] - X[n-k]) )/k
  as0 = sum( ((j-1)/(k-1))^0 * (X[n-j+1] - X[n-k]) )/k
  
  xi.GPPWM = 1 - 2*as1/(as0-2*as1)
  Tail.GPPWM = 1/xi.GPPWM
  
  as1.p = sum( ((jp)/(pn))^1 * (X[n-jp] - m) )/pn
  as0.p = sum( ((jp)/(pn))^0 * (X[n-jp] - m) )/pn
  
  xi.GPPWM.p = 1 - 2*as1.p/(as0.p-2*as1.p)
  Tail.GPPWM.p = 1/xi.GPPWM.p
  
  a1 = sum( ((j-1)/(k-1))^1 * (X[n-j+1] ) )/k
  a0 = sum( ((j-1)/(k-1))^0 * (X[n-j+1] ) )/k
  
  xi.PPWM = 1 - a1/(a0-a1)
  Tail.PPWM = 1/xi.PPWM
  
  xi.HI = sum(log(X[n-j+1]/X[n-k]))/k
  Lkn1 = 1-sum(X[n-k]/X[n-j+1])/k
  pkn = (xi.HI - Lkn1)/(Lkn1^2)
  xi.Mix = (pkn-1)/(1+2*min(pkn-1,0))
  Tail.Mix = 1/xi.Mix
  
  xi.HI.p = sum(log(X[n-jp+1]/m))/pn
  Lkn1.p = 1-sum(m/X[n-jp+1])/pn
  pkn.p = (xi.HI.p - Lkn1.p)/(Lkn1.p^2)
  xi.Mix.p = (pkn.p-1)/(1+2*min(pkn.p-1,0))
  Tail.Mix.p = 1/xi.Mix.p
  
  return(list(B1=B1,B2=B2,B3=B3,B4=B4,B5=B5,B6=B6,B7=B7,
              Hi = Tail.HI, 
              KE = Tail.KE,
              PK = Tail.PK,
              MM = Tail.MM,
              GH = Tail.GH,
              PP = Tail.PPWM,
              GP = Tail.GPPWM,
              Mi = Tail.Mix, 
              Hi.p = Tail.HI.p, 
              PK.p = Tail.PK.p,
              MM.p = Tail.MM.p, 
              GP.p = Tail.GPPWM.p,
              Mi.p = Tail.Mix.p, 
              Hi.opt = Tail.HI.opt,
              B8 = B8,
              B9 = B9
              ))
}


slp = function(vec,pow = c(1,2,3,4,6)){
  slp = array(,length(pow)); 
  for(j in 1:length(pow)){
    slp[j] = sum(vec^pow[j]); 
  }
  return(slp)
}

agh = function(alpha,g,h){
  if(g > alpha & h > alpha ) agh = (g-alpha)/(h-alpha);
  return(agh)
}

cthm3 = function(alpha,h){
  if(h > alpha) cthm3 = (gamma(1-alpha))^(h-1)/(1-alpha); 
  return(cthm3)
}

cthm6 = function(alpha,h2,h1){
  if(h1 > alpha & h2 > alpha ) cthm6 = (gamma(1-alpha))^((h2-h1)/(h1-alpha)); 
  return(cthm6)
}

PropTol = function(x, tol = 10^c(-3,-4,-5,-6) ){
  PropTol = array(,length(tol)); 
  for(j in 1:length(tol)){
    PropTol[j] = mean(abs(x)<tol[j])
  }
  return(PropTol)
}
