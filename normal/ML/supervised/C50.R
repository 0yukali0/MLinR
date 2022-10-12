library(C50)
data(iris)
np = ceiling(0.1*nrow(iris)) #10%
test.index = sample(1:nrow(iris), np) # choose 10% as training data, others are test data.
iris.test = iris[test.index,]
iris.train = iris[-test.index,]

c=C5.0Control(
  subset = FALSE,
  bands = 0,
  noGlobalPruning = FALSE,
  CF = 0.25,
  minCases  = 2,
  fuzzyThreshold = FALSE,
  sample = 0,
  seed = sample.int(4096, size = 1) - 1L,
  earlyStopping = TRUE
)

iris_treeModel <- C5.0(x = iris.train[, -5], y = iris.train$Species, control = c)
summary(iris_treeModel)
test.output = predict(iris_treeModel, iris.test[, -5], type="class")
n = length(test.output)
number=0
for (i in 1:n)
{
  if (test.output[i] == iris.test[i, 5]) 
  {
    number=number+1
  }
}
test.accuracy=(number/n)*100
