#compare student t-distribution and normal distribution
rm(list = ls())
x = seq(-6,6,.01)
y1 = dnorm(x)
y2 = dt(x,3)
y3 = dt(x,9)
y4 = dt(x,24)
windows()
plot(x,y1,xlim = c(-6,6), ylim = c(-.05,.4),col = "red", type = "l")
lines(x,y2, col = "green")
lines(x,y3, col = "blue")
lines(x,y4, col = "yellow")

#From a sample of 5 solder brick volumes 
#(they follow normal distribution), the sample average 
#and standard deviation were 0.19 mm3and 0.014 mm3.
#find CI (both normal and student-t)
rm(list = ls())
n = 5
mu = .19
s = .014
alpha = .05
L = mu + qt(alpha / 2, n-1) * s / sqrt(n)
U = mu + qt(1 - alpha / 2, n-1) * s / sqrt(n)
cat("The 95% CI using the T is [", L, ", ", U, "] \n")
L = mu + qnorm(alpha / 2) * s / sqrt(n)
U = mu + qnorm(1 - alpha / 2) * s / sqrt(n)
cat("The 95% CI using the Z is [", L, ", ", U, "] \n")