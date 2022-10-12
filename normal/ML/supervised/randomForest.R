rm(list = ls())
gc()
library(randomForest)
data(iris)
# Split iris dataset: 80% training data, 20% test data
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.8, 0.2))
data.train <- iris[ind==1,]
data.test <- iris[ind==2,]
rf.model <- randomForest(Species ~ ., data = data.train, ntree = 100)
rf.predict <- predict(rf.model, newdata = data.test)
table(rf.predict, data.test$Species)
