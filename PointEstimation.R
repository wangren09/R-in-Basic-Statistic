#Suppose the rotor blade twist angle follows an 
#N(10, 0.3^2) distribution. 
#Use the sample average as an estimator of the 
#population mean.

rm(list = ls())
mu = 10  # Mean
N = 1000 # Replications
sigma = .3  # Standard deviation
n = c(5, 20, 100)
windows()
par(mfrow = c(3,2)) # Create a 3x2 panel for graphs
for (i in 1:length(n)){
  x = matrix(0, N, 1) # Matrix to store means
  for (j in 1:N){
    temp = rnorm(n[i], 10, .3)
    x[j, 1] = mean(temp)
  }
  hist(x[,1], col = "green", probability = T, main = paste("Histogram n = ", n[i]))
  qqnorm(x[,1], col = "blue", main = paste("Normal Probability Plot for n = ",n[i]));
  qqline(x[,1])
  cat("The bias of the sample mean when n = ",sprintf("%3.0f", n[i]),"is ",sprintf("%4.4f",mean(x[,1])-mu),"\n")
  cat("The variance of the sample mean when n = ",sprintf("%3.0f", n[i]), "is ", sprintf("%5.4f",var(x[,1])),"\n")
}
par(mfrow = c(1,1))
