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

#Task1 - Exploratory Data Analysis
data(ToothGrowth)
dim(ToothGrowth)
str(ToothGrowth)
summary(ToothGrowth)

hist(ToothGrowth$len, xlab = "Tooth Length")
hist(ToothGrowth$dose, xlab = "Dosage of Treatment (3 level)")

boxplot(len ~ supp*dose, 
        data=ToothGrowth,
        main="Tooth Growth Data", 
        xlab="Supplement and Dosage", 
        ylab="Tooth Length",
        col=c("green","red"))
legend("bottomright", pch=20, legend=c("OJ - Supplement","VC - Supplement"),col=c("green","red"))

#Task 2 - Summarize the results

##Blabla thats for the report

#Task 3 - Test Hypotheses and give Confidence Intervals and Tests

t.test(len ~ supp, paired = FALSE, var.equal = TRUE, data = ToothGrowth)

test1 <- lm(len ~ dose, data = ToothGrowth); summary(test1)

test2 <- lm(len ~ supp, data = ToothGrowth); summary(test2)

test3 <- lm(len ~ supp + dose, data = ToothGrowth); summary(test3)

#Task 4 -  conclusions and the assumptions

#1. The orange juice treatment has got a higher impact on teeth growth, 
        #but it is not significantly different from the Vitamin treatment ("VC").
#2. The Vitamin Dosage has got a significant impact in teeth growth.

##Assumptions?!