rm(list = ls())
x = c(1470, 1510, 1690, 1740, 1900, 2000, 2030, 2100, 2190, 2200, 2290, 2380, 2390, 2480, 2500, 2580, 2700)
n = length(x)
alpha = .05
df = n-1
s = sd(x)
L = (n-1)*s^2/qchisq(1-alpha/2, df)
U = (n-1)*s^2/qchisq(alpha/2, df)
format(L, big.mark = ",")
format(U, big.mark = ",")
Ls = sqrt(L)
Us = sqrt(U)
Ls
Us