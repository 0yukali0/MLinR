library(ABCoptim)
fun <- function(x) {
  -cos(x[1])*cos(x[2])*exp(-((x[1]-pi)^2 + (x[2] - pi)^2))
}
abc_optim(rep(0,2), fun, lb=-20, ub=20, criter=1000)
