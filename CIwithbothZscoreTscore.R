#Suppose the twist angle of rotor blades follows N(10, ??2)
#with ?? unknown (use ??= 0.3 when generating the sample)

#Step 1: Generate n= 25 observations

#Step 2: Calculate sample mean and SD. Build two-sided 95% CIs using zand tscores, denoted by CIzand CIt

#Step 3: Let Yz= 1 if CIzcovers ??=10, and 0 o.w. Let Yt= 1 if CItcovers ??=10, and 0 o.w.

#Step 4: Repeat Steps 1-3 for N=10000.

#Calculate the mean and variance of Yzand Ytto obtain the statistic performance of coverage

#Calculate the mean and SD of CI width

rm(list = ls())
n = 25
mu = 10
sigma = .3
N = 10000
alpha = .05
CIz = matrix(0,N,2)
CIt = matrix(0, N, 2)
Yz = matrix(0, N, 1)
Yt = matrix(0, N, 1)
for (i in 1:N){
  temp = rnorm(n, mu, sigma)
  xbar = mean(temp)
  stdev = sd(temp)
  CIz[i,1] = xbar + qnorm(alpha / 2)*sigma / sqrt(n)
  CIz[i,2] = xbar + qnorm(1 - alpha / 2)*sigma / sqrt(n)
  Yz[i] = (CIz[i,1] < mu && CIz[i,2] > mu)
  CIt[i,1] = xbar + qt(alpha / 2, n-1)*stdev/sqrt(n)
  CIt[i,2] = xbar + qt(1 - alpha / 2, n-1)*stdev/sqrt(n)
  Yt[i] = (CIt[i,1] < mu && CIt[i,2 ] > mu)
}
cat("The mean of CI coverage using Z = ", mean(Yz), "and the variance = ",var(Yz),"\n")
cat("The mean of CI coverage using t = ", mean(Yt), "and the variance = ",var(Yt),"\n")
cat("The mean with of the CI using Z = ", mean(CIz[,2] - CIz[,1]), "and the stand. dev. = ", sd(CIz[,2] - CIz[,1]),"\n")
cat("The mean with of the CI using t = ", mean(CIt[,2] - CIt[,1]), "and the stand. dev. = ", sd(CIt[,2] - CIt[,1]),"\n")
