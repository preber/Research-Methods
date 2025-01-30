#### install the relevant R packages; you only need to do this once after you download R ####
install.packages("psych")
install.packages("ez")

#### run these every time you restart R ####
library(psych)
library(psychTools)
library(tidyr)
library(ez)

#### load the Experiment 1 data and convert datafile into R 'table' (necessary for doing analyses on the data) ####
exp1 <- read.file("Exp1_data.csv")
View(exp1)

#### get descriptive data ####
describeBy(exp1$Recognition,exp1$Condition)

#### do a t-test ####
t.test(Recognition.score ~ Condition,data=exp1,
      var.equal=TRUE)

