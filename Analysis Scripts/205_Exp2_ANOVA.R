#### install the relevant R packages; you only need to do this once after you download R ####
install.packages("psych")
install.packages("ez")
install.packages("psychTools")

#### run these everytime you restart R ####
library(psych)
library(psychTools)
library(tidyr)
library(ez)


exp2 <- read.file("Exp2_Fall2024.csv",fileEncoding='UTF-8-BOM')

describeBy(exp2$Recognition, list(exp2$Depth, exp2$Stimulus))

anova_result = ezANOVA(
  exp2
  , dv = .(Recognition)
  , wid = .(P)
  , within = NULL # NULL if no within factors
  , between = .(Depth, Stimulus) # NULL if no between factors
  , observed = NULL
  , diff = NULL
  , reverse_diff = FALSE
  , type = 3
  , white.adjust = FALSE
  , detailed = FALSE
  , return_aov = FALSE # TRUE for showing details
)
print(anova_result)

a = aov(Recognition ~ Depth*Stimulus, data = exp2)
TukeyHSD(a)

t.test(subset(exp2, exp2$Depth == "shallow" & exp2$Stimulus == "abstract")$Recognition, 
       y=NULL, "greater", 50)
t.test(subset(exp2, exp2$Depth == "shallow" & exp2$Stimulus == "meaningful")$Recognition, 
       y=NULL, "greater", 50)
t.test(subset(exp2, exp2$Depth == "deep" & exp2$Stimulus == "abstract")$Recognition, 
       y=NULL, "greater", 50)
t.test(subset(exp2, exp2$Depth == "deep" & exp2$Stimulus == "meaningful")$Recognition, 
       y=NULL, "greater", 50)

