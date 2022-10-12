library(C50)
library(stringr)

data(iris)

c=C5.0Control(
  subset = FALSE,
  bands = 0,
  winnow = FALSE,
  CF = 0.25,
  minCases = 2,
  fuzzyThreshold = FALSE,
  sample = 0.9,
  seed = sample.int(4096, size = 1) - 1L,
  earlyStopping = TRUE,
  label = "Species"
)

iris_treeModel <- C5.0(
  x = iris[, -5],
  y = iris$Species,
  control = c
)
