#In a customer satisfaction survey, 
#20 customers were asked whether they are satisfied with a product. 
#Suppose the population fraction of satisfied customers is p= 0.8. 
#Use bootstrap to obtain the approximate distribution for the sample satisfied fraction.

rm(list = ls())
n = 20 # Sample size
p = .8 # Probability of success
N = c(50, 200, 2000)
original = rbinom(n, 1, p)# Original sample
windows()
par(mfrow = c(3,2)) # Creating a 6-panel graph
for (i in 1:length(N)){
  x = matrix(0,N[i],1) # Create a martrix to store the estimates of p
for (j in 1:N[i]) {
  x[j] = mean(sample(original, n, T)) # Make bootstrap samples
}
  hist(x, col = "red", probability = T, main = paste("Histogram of p N = ", N[i]))
  qqnorm(x, col = "yellow", main = paste("Normal Probability Plot N = ", N[i]));
  qqline(x)
}
par(mfrow = c(1,1))