#From a sample of 5 solder brick volumes 
#(they follow normal distribution), 
#the sample average and standard deviation 
#were 0.19 mm3and 0.014 mm3.
#a)Find a two-sided 95% CI for the volume variance.
#b)Find a two-sided 95% CI for the volume standard deviation.

rm(list = ls())
n = 5
stdev = .014
alpha = .05
var_L = (n-1)*stdev^2/qchisq(1-alpha/2,n-1)
var_U = (n-1)*stdev^2/qchisq(alpha/2,n-1)
st_L = sqrt(var_L)
st_U = sqrt(var_U)
cat(" A 95% CI on sigma square = [",format(var_L, digits = 4, nsmall = 3, scientific = F),",", format(var_U, digits = 4, nsmall = 3),"]\n")
cat(" A 95% CI on sigma = [",format(st_L, digits = 4, nsmall = 3),",", format(st_U, digits = 4, nsmall = 3),"]\n")