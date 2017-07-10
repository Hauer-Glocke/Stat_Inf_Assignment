---
title: "Report"
author: "Hauer-Glocke"
date: "8 Juli 2017"
output: pdf_document
---

#Sample Project Report Structure

Of course, there are multiple ways one could structure a report to address the requirements above. However, the more clearly you pose and answer each question, the easier it will be for reviewers to clearly identify and evaluate your work.

A sample set of headings that could be used to guide the creation of your report might be:

* Title (give an appropriate title) and Author Name
* Overview: In a few (2-3) sentences explain what is going to be reported on.
* Simulations: Include English explanations of the simulations you ran, with the accompanying R code. Your explanations should make clear what the R code accomplishes.
* Sample Mean versus Theoretical Mean: Include figures with titles. In the figures, highlight the means you are comparing. Include text that explains the figures and what is shown on them, and provides appropriate numbers.
* Sample Variance versus Theoretical Variance: Include figures (output from R) with titles. Highlight the variances you are comparing. Include text that explains your understanding of the differences of the variances.
* Distribution: Via figures and text, explain how one can tell the distribution is approximately normal.


## This is the backup - suggestion


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
