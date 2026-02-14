#### install the relevant R packages; you only need to do this once after you download R ####
install.packages("psych")
install.packages("ez")

#### run these everytime you restart R ####
library(psych)
library(psychTools)
library(tidyr)
library(ez)


#### Example 1: One-way ANOVA with 3 levels ####
music <-read.file("Ch11_Example1.csv",fileEncoding='UTF-8-BOM')
describeBy(music$Problems.Solved, music$Music)

anova_result = ezANOVA(
  music
  , dv = .(Problems.Solved)
  , wid = .(N)
  , within = NULL # NULL if no within factors
  , between = .(Music) # NULL if no between factors
  , observed = NULL
  , diff = NULL
  , reverse_diff = FALSE
  , type = 3
  , white.adjust = FALSE
  , detailed = FALSE
  , return_aov = FALSE # TRUE for showing details
)
print(anova_result)

model = lm(music$Problems.Solved ~ music$Music)
a = aov(model)
TukeyHSD(a)


# Example 2: Anagrams and Chocolate
anagram <- read.file("Ch11_Example2.csv",fileEncoding='UTF-8-BOM')
describeBy(anagram$Chocolate, list(anagram$Color,anagram$Difficulty))
anova_result = ezANOVA(
  anagram
  , dv = .(Chocolate)
  , wid = .(N)
  , within = NULL # NULL if no within factors
  , between = .(Color, Difficulty) # NULL if no between factors
  , observed = NULL
  , diff = NULL
  , reverse_diff = FALSE
  , type = 3
  , white.adjust = FALSE
  , detailed = FALSE
  , return_aov = FALSE # TRUE for showing details
)
print(anova_result)


## Example 3 -- mixed model
greener <- read.file("Ch11_Example3.csv",fileEncoding='UTF-8-BOM')
describeBy(greener$Green, list(greener$Personality,greener$Side))
anova_result = ezANOVA(
  greener
  , dv = .(Green)
  , wid = .(N)
  , within = .(Side) # NULL if no within factors
  , between = .(Personality) # NULL if no between factors
  , observed = NULL
  , diff = NULL
  , reverse_diff = FALSE
  , type = 3
  , white.adjust = FALSE
  , detailed = FALSE
  , return_aov = FALSE # TRUE for showing details
)
print(anova_result)

