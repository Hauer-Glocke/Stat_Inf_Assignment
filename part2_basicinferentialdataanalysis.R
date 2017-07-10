#Part 2: Basic Inferential Data Analysis Instructionsless 
#Now in the second portion of the project, we're going 
#to analyze the ToothGrowth data in the R datasets package.

#1. Load the ToothGrowth data and perform some basic exploratory 
        #data analyses
#2. Provide a basic summary of the data.
#3. Use confidence intervals and/or hypothesis tests to compare 
        #tooth growth by supp and dose. (Only use the techniques 
        #from class, even if there's other approaches worth 
        #considering)
#4. State your conclusions and the assumptions needed for your 
        #conclusions.

#Clear Working Environment
rm(list=ls())
cat("\f")

#Loading necessary libraries
library(readr)
library(dplyr)
library(ggplot2)

data(ToothGrowth)
head(ToothGrowth)
dim(ToothGrowth)
str(ToothGrowth)
summary(ToothGrowth)
unique(ToothGrowth$dose)

qplot(supp,len,data=ToothGrowth, facets=~dose, 
      main="Tooth growth of guinea pigs by supplement type and 
      dosage (mg)",xlab="Supplement type", ylab="Tooth length") + 
        geom_boxplot(aes(fill = supp))
