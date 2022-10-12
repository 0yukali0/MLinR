library(e1071)
data(iris)
index <- 1:nrow(iris)
np = ceiling(0.1*nrow(iris))
np

test.index = sample(1:nrow(iris), np)
iris.test = iris[test.index,]
iris.train = iris[-test.index,]

svm.model <- svm(Species ~ ., data = iris.train, type = 'C-classification', cost = 10, gamma = 10)
svm.pred <- predict(svm.model, iris.test[,-5])
table.svm.test=table(pred = svm.pred, true = iris.test[,5])
table.svm.test

correct.svm=sum(diag(table.svm.test))/sum(table.svm.test)
correct.svm=correct.svm*100
correct.svm

# Finding the best gamma and cost
tuned <- tune.svm(Species ~ ., data = iris.train, gamma = 10^(-3:-1), cost = 10^(-1:1))
summary(tuned)
# gamma = 0.1 and cost = 1
svm.model <- svm(Species ~ ., data = iris.train, kernel = "radial", cost = 10, gamma = 0.1)
summary(svm.model)
svm.pred <- predict(svm.model, iris.test[,-5])
table.svm.best.test=table(pred = svm.pred, true = iris.test[,5])
table.svm.best.test
correct.svm=sum(diag(table.svm.best.test))/sum(table.svm.best.test)
correct.svm=correct.svm*100
correct.svm
