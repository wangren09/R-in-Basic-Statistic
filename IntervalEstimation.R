#For the sample of 25 rotor blades, 
#with sample mean of 10 degrees, 
#find a 95% confidence interval on the population mean. 
#Assume the population standard deviation is 0.3 degrees.

rm(list = ls())
n = 25 # Sample size
alpha = .05
mu = 10 # Mean of distribution
sigma = .3 # Standard deviation of distribution
N = 10000 # Number of replications
x = matrix(0, N, 2) # Matrix to hold L and U
y = matrix (0, N, 1) # Matrix of CI coverage
for (i in 1:N){
  samplemean = mean(rnorm(n, mu, sigma)) # Calculate sample mean
  x[i,1] = samplemean + qnorm(alpha/2) * sigma / sqrt(n)  # Lower CI
  x[i,2] = samplemean + qnorm(1 - alpha/2) * sigma / sqrt(n)  # Upper CI
  y[i] = (x[i,1] < mu && x[i,2] > mu)
}
mean(y)