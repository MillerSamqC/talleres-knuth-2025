library(tidyverse)
library(readxl)

datos <- read_csv(file = "figuras.txt")
View(datos)

alturas <- read_csv(file = "heights.csv")
View(alturas)
mean(alturas$height)
table(alturas$sex)
table(alturas$race)
hist(alturas$age)
boxplot(alturas$height)

