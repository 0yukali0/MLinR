rm(list = ls())
gc()
library(adabag)
data(iris)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.8, 0.2))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]
train.adaboost <- boosting(Species~., data=trainData, boos=TRUE,mfinal=5)
test.adaboost.pred <- predict.boosting(train.adaboost, newdata=testData)
test.adaboost.pred$confusion
test.adaboost.pred$error
