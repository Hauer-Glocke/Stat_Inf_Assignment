#Clear Working Environment
rm(list=ls())
cat("\f")

#Loading necessary libraries
#library(readr)
library(dplyr)
library(ggplot2)

#Standard Setting
lambda <- 0.2 #As rate in the function
x <- rexp(40, lambda)  #Mean = 1/Lambda; Standard Deviation = 1/Lambda
mean(x)
sd(x)

#Example 1 - compare the distribution of 1000 random uniforms
x <- rexp(1000,lambda)
hist(x,xlab="x-Values of random exponential generation",20)
abline(v = 1/lambda, col = "red", lwd = 2)
abline(v = mean(x), col = "green", lwd = 2)
legend(x="topright", legend=c("Theoretical mean", "Sample Mean"), lty=1, lwd=1, col = c("red", "green"), cex=0.7)

#Example 2 - distribution of 1000 averages of 40 random uniforms
mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(rexp(40,lambda)))
hist(mns)

##Task
#Note that you will need to do a thousand simulations.

#Illustrate via simulation and associated explanatory text the properties of 
        #the distribution of the mean of 40 exponentials. You should

#1. Show the sample mean and compare it to the theoretical mean of the 
        #distribution.
#2. Show how variable the sample is (via variance) and compare it to the 
        #theoretical variance of the distribution.
#3. Show that the distribution is approximately normal.

#In point 3, focus on the difference between the distribution of a large 
        #collection of random exponentials and the distribution of a large 
        #collection of averages of 40 exponentials.

#This distribution looks far more Gaussian than the original uniform distribution!
        
#This exercise is asking you to use your knowledge of the theory given in class 
        #to relate the two distributions.

#Confused? Try re-watching video lecture 07 for a starter on how to complete this project.

#Task 1
lambda <- 0.2
n <- 40
t = 1000

means=NULL
for (i in 1:t){
        means[i] <- mean(rexp(n, lambda))
}

myhist <- hist(means)
multiplier <- myhist$counts / myhist$density
mydensity <- density(means)
mydensity$y <- mydensity$y * multiplier[1]

plot(myhist)
lines(mydensity)
abline(v = mean(means), col = "blue", lwd = 2)

means_increasing_n <- cumsum(rexp(t, lambda))/(1:t)
g <- ggplot(data.frame(x = 1:t, y = means_increasing_n), aes(x = x, y = y))
g <- g + geom_hline(yintercept = 1/lambda, col="red", size=1) + geom_line(size = 1, col="black")
g <- g + guides(colours=TRUE) + labs(x = "Number of obs", y = "Cumulative mean"); g

g <- ggplot(data.frame(x = 1:t, y = means_increasing_n), aes(x = x, y = y))

#Task 2
lambda <- 0.2
n <- 40
t <- 1000

sds <- NULL
for (i in 1:t){
        sds[i] <- sd(rexp(n, lambda))
}

myhist <- hist(sds)
multiplier <- myhist$counts / myhist$density
mydensity <- density(sds)
mydensity$y <- mydensity$y * multiplier[1]

plot(myhist)
lines(mydensity)
abline(v = mean(sds), col = "blue", lwd = 2)

sd_increasing_n <- cumsum((rexp(t, lambda)-1/lambda)^2)/t
g <- ggplot(data.frame(x = 1:t, y = means_increasing_n), aes(x = x, y = y))
g <- g + geom_hline(yintercept = 1/lambda) + geom_line(size = 2)
g <- g + labs(x = "Number of obs", y = "Cumulative mean"); g


#normal distribution
x <- seq(min(means), max(means), length=t)
hx <- dnorm(x,mean = 1/lambda, sd = sd(means))
plot(x=x, y=hx, type="l")

#Execute t_test
myhist <- hist(means,xlab="Means of random samples with n=40",20)
multiplier <- myhist$counts / myhist$density #Multiplyer to transfer into frequency table.
means_dens <- density(means) #Calculated the underlying density of means
means_dens$y <- means_dens$y * multiplier[1] #Mutate the density function in refers to the underlying frequency table

x <- means_dens$x
hx <- dnorm(x ,mean = theoreticalMean, sd = theoreticalSD)*multiplier[1]
xhx <- as.data.frame(cbind(x,hx)) #This is the normal distribution

t.test(means_dens$y, xhx$hx, alternative = "two.sided",
       paired = FALSE, var.equal = FALSE, conf.level = 0.95)