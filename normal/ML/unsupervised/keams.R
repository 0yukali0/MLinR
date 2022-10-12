data(iris)
attributes(iris)
iris2 <- iris
iris2$Species <- NULL
clusteringNumber <- 3
(kmeans.result <- kmeans(iris2, clusteringNumber))
table(iris$Species, kmeans.result$cluster)
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)
points(kmeans.result$centers[, c("Sepal.Length", "Sepal.Width")], col = 1:3, pch = 8, cex = 2)
