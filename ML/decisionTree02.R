library(rpart)
data(iris)
np = ceiling(0.1*nrow(iris))
test.index = sample(1:nrow(iris), np)
iris.testdata = iris[test.index,]
iris.traindata = iris[-test.index,]
iris.tree =rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                 method="class",
                 data=iris.traindata,
                 control=rpart.control(minsplit=5, cp=0.0001, maxpath=30))

species.traindata = iris$Species[-test.index]
train.predict = factor(predict(iris.tree, iris.traindata, type="class"), levels = levels(species.traindata))
table.traindata = table(species.traindata, train.predict)
table.traindata
correct.traindata = 100 * (sum(diag(table.traindata))/sum(table.traindata))
correct.traindata

species.testdata = iris$Species[test.index]
test.predict = factor(predict(iris.tree, iris.testdata, type="class"), levels = levels(species.testdata))
table.testdata = table(species.testdata, test.predict)
table.testdata
correct.testdata = 100 * (sum(diag(table.testdata))/sum(table.testdata))
correct.testdata

iris.tree
