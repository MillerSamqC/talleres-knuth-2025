# Asignación de variables
x <- 10
y <- 12
x # Print implícito
print(x) # Print explícito
resultados <- sample(x = 1:10, size = 100, replace = TRUE)
resultados # Consultar todos los datos
resultados[1] # Consulta el dato #1
resultados[42] # Consulta el dato #42

nombre <- "Miguel Angel"
nombre

class(nombre)
typeof(nombre)
str(nombre)

var_pi <- 3.4145692

class(var_pi)
typeof(var_pi)
str(var_pi)

num_mascotas <- 3L
num_mascotas

un_compl <- 3 + 2i
un_compl

tiene_netflix <- TRUE
llueve <- FALSE

tiene_netflix & llueve
tiene_netflix | llueve
