library(tidyverse)

table1 %>% 
  mutate(rate = cases/population*10000)

table1 %>% 
  count(year, wt = cases)

table1 %>% 
  ggplot(aes(as.factor(year), cases)) +
  geom_point(aes(color = country)) +
  geom_line(aes(group = country), color = "lightsalmon")

table5 %>% 
  separate(rate, into = c("casos","pobl"), sep = "/") %>% 
  unite(fecha, century, year, sep = "")

table4a

table4a %>% 
  pivot_longer(c(`1999`,`2000`),
               names_to = "el_anio", 
               values_to = "casos_t") 

relig_income %>% 
  pivot_longer(!religion,
               names_to = "ingreso",
               values_to = "cant_personas")

billboard %>% 
  pivot_longer(starts_with("wk"),
               names_to = "semana",
               values_to = "puesto_ranking")

table4a %>% 
  pivot_longer(c(`1999`,`2000`),
               names_to = "el_anio", 
               values_to = "casos_t") 

table4b %>% 
  pivot_longer(c(`1999`,`2000`),
               names_to = "el_anio", 
               values_to = "poblacion")

table2 %>% 
  spread(key = "type", 
         value = "count")

table2 %>% 
  pivot_wider(names_from = "type", 
              values_from = "count")



install.packages("titanic")
library(titanic)

titanic_train

