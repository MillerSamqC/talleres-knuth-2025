# install.packages("tidyverse")
# install.packages("readxl")
library(tidyverse)
library(readxl)

menu <- read_excel("datos-restaurante.xlsx", "menu")
View(menu)

df <- data.frame(
  color=c("blue","black","blue","blue","black"),
  value=c(1,2,3,4,5)
)
View(df)
df
filter(df, color == "black")
filter(df, value %in% c(1,4))
arrange(df,desc(value))
arrange(df,color)
arrange(df,desc(color))
arrange(df,desc(color), desc(value))
select(df, color)
select(df, value)
select(df, -color)
mutate(df, iva_valor = value* 0.19, 
           triple = value * 3,
           triple_con_iva = triple + iva_valor)
summarise(df, total = sum(value))
por_color <- group_by(df, color)
summarise(por_color, total = sum(value))

View(filter(menu, categoria == "BEBIDAS"))
View(filter(menu, categoria %in% c("BEBIDAS","FRUTAS"))
View(filter(menu, categoria == "BEBIDAS" | precio < 10000))
View(filter(menu, categoria == "BEBIDAS" & precio < 10000))
View(arrange(menu, desc(precio)))
View(arrange(menu, categoria, desc(precio)))
View(select(menu, -categoria))
mutate(menu, promo = precio * 0.40)
mutate(menu, promo = precio * 0.40,
             promo_mas_iva = promo * (1.19))

consumo = read_excel("datos-restaurante.xlsx", "consumo")
head(consumo)     

summarise(consumo, total_productos = sum(cantidad))

por_reserva <- group_by(consumo, numero_reserva)
summarise(por_reserva, total_productos = sum(cantidad))
summarise(por_reserva, total_productos = n())

numeros <- c(123,123,12,5,436,4,NA,234,346,234,73,686,7,345,234)
mean(numeros, na.rm = TRUE)
table(numeros)
length(numeros)

x = 3.123452
sqrt(x)
log(sqrt(x))
round(log(sqrt(x)), 3)

x %>% 
  sqrt() %>% 
  log() %>% 
  round(3)

consumo %>% 
  select(-numero_reserva) %>% 
  mutate(longitud = nchar(producto), n_cant = cantidad + longitud) %>% 
  summarise(mean_cant = mean(n_cant))
