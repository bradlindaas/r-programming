## week 3 lectures

## apply

x <- matrix(rnorm(200), 20, 10)

z <- apply(x, 1, quantile, probs = c(.25, .75))

## I dont know what an array is -- now I do. 3D tables

a <- array(rnorm(2 * 2 * 10), c(2,2,10))

apply(a, c(1,2), mean)

## tapply

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)

split(x, f)

library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

## week 3 quiz

data(iris)
?iris

## In this dataset, what is the mean of 'Sepal.Length' for the species virginica? Please round your answer to the nearest whole number.

s <- split(iris, iris$Species)
sapply(s, colMeans)
mean(s$virginica$Sepal.Length)

library(datasets)
data(mtcars)

tapply(mtcars$mpg, mtcars$cyl, mean)
apply(mtcars, 2, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
lapply(mtcars, mean)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)
split(mtcars, mtcars$cyl)
mean(mtcars$mpg, mtcars$cyl)
sapply(mtcars, cyl, mean)

##what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

z <- tapply(mtcars$hp, mtcars$cyl, mean)

round((abs(z[1] - z[3])),0)

  

