#Clear Working Environment
rm(list=ls())
cat("\f")

#Loading necessary libraries
library(readr)
library(dplyr)


#Exponential Distribution
set.seed(258)
df <- rexp(50, rate = 1)
plot(dexp(df))

x <- dexp(df)
x <- sort(x)
y <- pexp(df)
y <- sort(y)
z <- sort(df)
plot(z)
plot(x, df)
