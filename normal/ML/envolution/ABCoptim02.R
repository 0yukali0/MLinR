library(ABCoptim)
fw <- function(x)
  10*sin(0.3*x)*sin(1.3*x^2)+0.00001*x^4+0.2*x+80
abc_optim(50, fw, lb=-100, ub=100, criter=1000)
