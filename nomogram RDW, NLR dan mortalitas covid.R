library(e1071)
library(lattice)
library(MASS)
library(PASWR)


library(survival)
library(Formula)
library(ggplot2)
library(Hmisc)

library(rms)
library(RCurl)
library(data.table)
library(readr)

RDWcovid <- read.csv("https://raw.githubusercontent.com/matahana/RDW/main/RDWcvCovid19.csv",
                     header=TRUE, sep = ";"
)


RDW.covid <- datadist(RDWcovid)

options(datadist = 'RDW.covid')

fit <- lrm(formula = Outcome ~ RDWnumeric + NLRnumeric, data = RDWcovid)

plot(nomogram(fit, fun = function(x)plogis(x)))

