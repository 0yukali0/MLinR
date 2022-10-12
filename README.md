# ML in R language
## Installing packages
```
# Packages in CRAN
install.packages("C50")
library(C50)
remove.packages("C50")
# Packages from zip
Hint:Opening RStudio, clicking package pane, choosing installing from "package archive file"
install.packages("<package are not in CRAN>") is replaced by the option
```
## Data type
1. Numeric
2. Character
3. Complex
4. Logical

## R objects
1. Vector
2. Array
3. Matrix

### Vector(1-dim)
```
# numeric vector initialization
V <- c(10, 2, 4, NA)
V <- 1:10 

length(V) # vector length of elements
mode(V) # type of vector elements 

# Acessing one or mutiple elements
V[1]
```
### Array(n-dim)
```
# Translation from 1-dim vector to 3-dim array
X <- 1:24
dim(X) <- c(3,4,2)
# Create a 3-dim array and this array is filled with 0
X <- array(0, dim = c(3,4,2))
# A created array based on vectors
Xv1 <- 1:4
Xv2 <- 5:8
# row binding or column binding
X <- rbind(Xv1, Xv2)
X <- cbind(Xv1, Xv2)
```
### Matrix(2-dim)
byrow: TRUE(row based),FALSE(column based)
nrow: numeric(Number of rows)
ncol: numberic(Number of cols)
dimnames: list(rows names, columns names)
```
# created matrix
matrix(data = NA, nrow = 1, crol = 1, byrow = FALSE, dimnames = NULL)

# created matrix via cbind
X <- cbind(1:3, 4:6, 7:9)
# Transposition matrix of X via t()
Y <- t(X)
# Total rows numbers and total columns numbers
nrow(Y)
ncol(Y)
# Access row elements or column elements
X[,1] # column 1
X[2,] # row 2
# An eigen value and an eigen vector
tmp <- eigen(Y)
eigenValues <- tmp$values
eigenVectors <- tmp$vectors

# Matrix multiply
Y%*%eigenVectors #Y%*%eigenVectors should be same as eigenValues%*%eigenValues
```
### Dataframe(as excel sheet)
```
id <- 1:4
age <- c(25, 30, 35, 40)
gender <- c("Male", "Male", "Female", "Female")
pay <- c(30000, 40000, 45000, 50000)
X.dataframe <- data.frame(id, gender, sex, pay)
# Access an element, elements in a column
X.dataframe$gender
X.dataframe[2]
```
### Factor(grouping)
```
gender <- factor("female", "male", "female", "female")
```
### list
```
# list creation
id <- 1:4
gender <- c("Male", "Male", "Female", "Female")
pay <- c(30000, 40000, 45000, 50000)
Y.dataframe <- data.frame(id, gender, pay)
genderTypes <- factor(gender)
Yu.family <- list(name="yu", yu.kids=3, kids.age=c(25,28,30), gender, Y.dataframe)
# Accessing elements in list
Yu.family[2] # elements key and elements
Yu.family[[2]] #  elements
Yu.family[[2]][1] # element
```
