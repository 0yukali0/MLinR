library(C50)
library(ABCoptim)
test.error <- function(xx) {
  c <- C5.0Control(
    subset=FALSE,
    bands=0,
    winnow=FALSE,
    noGlobalPruning=FALSE,
    CF = xx[1]/100,
    minCases = floor(xx[2]),
    fuzzyThreshold=FALSE,
    sample=0,
    seed=sample.int(4096, size=1)-1L,
    earlyStopping=TRUE
  )
  treeModel <- C5.0(x = iris.train[, -5], y = iris$Species, control=c)
  summary(treeModel)
  test.output <- predict(treeModel, iris.test[,- 5], type="class")
  n = length(test.output)
  number=0
  for(i in 1:n)
  {
    if (test.output[i] != iris.test[i,5])
    {
      number=number+1
    }
  }
  error_value <- number/n*100
  if (start_index == TRUE)
  {
    # Keep best global parameters
    best_CF<<- c$CF
    best_minCases <<- c$minCases
    min_error <<- error_value
  }
  if (error_value < min_error)
  {
    best_CF <<- c$CF
    best_minCases <<- c$minCases
    min_error <<- error_value
  }

  error=error_value
  return(error)
}

######################
# Main program       #
######################

data(iris)
np <- ceiling(0.5*nrow(iris))
iris.test <- iris[1:np,]
iris.train <- iris[np+1:nrow(iris),]
start_index <<- TRUE # Global value
xx<-c(85,2)
test.error(xx)
accuracy <- 100-min_error

start_index <<- FALSE 
abc_optim(xx, test.error, lb=2, ub=100, maxCycle=10)
accuracy <- 100-min_error
