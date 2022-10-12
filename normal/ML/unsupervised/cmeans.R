library("e1071")
data(iris)
x <- rbind(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width)
x <- t(x)
# Optional 
# y <- cbind(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width)
result <- cmeans(x, m=3, centers = 3, iter.max = 500, verbose = TRUE, method="cmeans")
print(result)
table(iris$Species, result$cluster)
