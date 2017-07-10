#Clear Working Environment
rm(list=ls())
cat("\f")

#Loading necessary libraries
library(readr)
library(dplyr)

#Standard Setting
lambda <- 0.2 #As rate in the function
x <- rexp(5, lambda)  #Mean = 1/Lambda; Standard Deviation = 1/Lambda


#Example 1 - compare the distribution of 1000 random uniforms
hist(runif(1000))

#Example 2 - distribution of 1000 averages of 40 random uniforms
mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
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