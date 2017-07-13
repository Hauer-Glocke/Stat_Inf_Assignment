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

n <- 10000
means <- cumsum(rexp(n, lambda))/(1:n)
library(ggplot2)
g <- ggplot(data.frame(x = 1:n, y = means), aes(x = x, y = y))
g <- g + geom_hline(yintercept = 1/lambda) + geom_line(size = 2)
g <- g + labs(x = "Number of obs", y = "Cumulative mean")
g


n <- 100
pvals <- seq(0.1, 0.9, by = 0.05)
nosim <- 1000
coverage2 <- sapply(pvals, function(p) {
        phats <- rbinom(nosim, prob = p, size = n)/n
        ll <- phats - qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        ul <- phats + qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        mean(ll < p & ul > p)
})