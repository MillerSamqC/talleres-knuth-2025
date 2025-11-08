install.packages("dplyr")
install.packages("DBI")
install.packages("RSQLite")

library(dplyr)
library(DBI)
library(RSQLite)

con <- dbConnect(RSQLite::SQLite(), ":memory:")

# Operaciones de DDL

dbExecute(con,"
  CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT,
    dept_id INTEGER,
    salary REAL
  );
  ")

dbExecute(con,"
  CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT
  );
  ")

# Operaciones del DML

dbExecute(con,"
  INSERT INTO employees (emp_id,emp_name,dept_id,salary)
  VALUES
  (1,'John Doe',1,50000),
  (2,'Jane Smith',2,60000),
  (3,'Sam Brown',1,55000),
  (4,'Lisa Ray',3,70000);")

dbExecute(con,"
  INSERT INTO departments (dept_id,dept_name)
  VALUES
  (1,'Sales'),
  (2,'Engineering'),
  (3,'Marketing');")

# Conexión con dplyr para consultar tablas

employees <- tbl(con, "employees")
employees %>% as_tibble() %>% View()

departments <- tbl(con, "departments")
departments %>% as_tibble() %>% View()

# Operador pipe 
round(log(sqrt(56)),2)
56 %>% sqrt() # sqrt(56)
56 %>% sqrt() %>% log() # log(sqrt(56))
56 %>% sqrt() %>% log() %>% round(2) # round(log(sqrt(56)),2)

emp_dept <- employees %>% 
              inner_join(departments,by="dept_id") %>% 
              collect()

emp_dept %>% View()

emp_dept %>% 
  group_by(dept_name) %>% 
  summarise(avg_salario = mean(salary)) %>% 
  collect()

dbDisconnect(con)


