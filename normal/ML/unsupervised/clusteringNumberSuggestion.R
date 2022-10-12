library(NbClust)
data(iris)
data <- iris[, c(-5)]
NbClust(data, distance = "euclidean", min.nc = 2, max.nc = 6, method = "kmeans", index="all")
#output
#******************************************************************* 
#  * Among all indices:                                                
#  * 11 proposed 2 as the best number of clusters 
#  * 11 proposed 3 as the best number of clusters 
#  * 2 proposed 6 as the best number of clusters 