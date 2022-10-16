# Sparkr example

## Spark Dataframe
### Creation, Select, filter 
```
# Original R dataframe
id <- 1:5
age <- c(25, 30, 35, 40, 25)
gender <- c("Male", "Male", "Female", "Female", "Female")
pay <- c(30000, 40000, 45000, 50000, 30000)
X.dataframe <- data.frame(id, age, gender, pay)
# Creating a Spark df
X.sparkdf <- as.DataFrame(X.dataframe)
# Accessing spark df columns
# head(select(X.sparkdf, X.sparkdf$age)) or head(select(df, "age"))
# Filtering
olderAge <- 30
head(filter(X.sparkdf, X.sparkdf$age < olderAge))
```
### Column operation
```
X.sparkdf$average <- X.sparkdf$pay / X.sparkdf$age
```

### Grouping, Aggregation
```

groupResults <- summarize(groupBy(X.sparkdf, X.sparkdf$gender), count = n(X.sparkdf$gender))
head(groupResults)


head(arrange(groupResults, desc(groupResults$gender)))

df <- createDataFrame(mtcars)
head(agg(cube(df, "cyl", "disp", "gear"), avg(df$mpg)))
head(agg(rollup(df, "cyl", "disp", "gear"), avg(df$mpg)))
```
### Applying User-Defined Function
