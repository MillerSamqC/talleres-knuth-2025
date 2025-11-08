# install.packages("dplyr")
# install.packages("DBI")
# install.packages("RSQLite")

library(dplyr)
library(DBI)
library(RSQLite)

con <- dbConnect(RSQLite::SQLite(), "chinook.db")

canciones <- tbl(con,"tracks")
canciones %>% collect() %>% View()

clientes <- tbl(con,"customers")
clientes %>% collect() %>% View()

# Via SQL
info_clientes <- dbGetQuery(con, 
  "SELECT FirstName, LastName, Country 
   FROM customers;
")
info_clientes %>% View()

# Via dplyr
clientes %>% 
  select(FirstName, LastName, Country) %>% 
  collect %>% 
  View()

empleados <- tbl(con, "employees")
empleados %>% collect() %>% View()

emp_f <- empleados %>% select(EmployeeId, FirstName, LastName, ReportsTo)

left_join(emp_f,emp_f, by=c("ReportsTo"="EmployeeId")) %>% collect()

canciones <- tbl(con, "tracks")
canciones %>% collect() %>% View()

canciones %>% 
  select(Name, Milliseconds) %>% 
  mutate(duracion = Milliseconds/60000) %>% 
  filter(duracion < 3) %>% 
  collect() %>% 
  View()
  
generos <- tbl(con, "genres")





