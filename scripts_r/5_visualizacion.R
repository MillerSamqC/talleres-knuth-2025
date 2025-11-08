# Instalar y cargar ggplot2 si no está instalado
# install.packages("ggplot2")
library(ggplot2)

# Opcional: Tidyverse tiene ggplot2 y otras librerías adicionales
# install.packages("tidyverse")
# library(tidyverse)

# Un dataset sencillo
pos_x <- c(25,0,75,200)
pos_y <- c(11,0,53,300)
forma <- c("circle","circle","square","square")

datos <- data.frame(pos_x,pos_y,forma)
datos
View(datos)

ggplot(data = datos) +
  geom_point(mapping = aes(x = pos_x,
                           y = pos_y,
                           shape = forma),
             colour = "#0a5420",
             size = 6) +
  scale_shape_manual(values = c(16,15))


# ------- Solución de actividades PLOTS --------------

# 1. BARPLOT
# Dataset mínimo para barplot (3 categorías)
data_bar <- data.frame(
  category = c("A", "B", "C"),
  value = c(10, 15, 20),
  group = c("X", "Y", "X") 
)

# Barplot con mapeos estéticos
bar_plot <- ggplot(data_bar, aes(x = category, y = value, fill = group, alpha = value)) +
  geom_bar(stat = "identity", position = "dodge") +  # position: dodge para barras agrupadas
  scale_fill_manual(values = c("X" = "blue", "Y" = "red")) +  # color/fill por grupo
  scale_alpha_continuous(range = c(0.4, 1)) +  # alpha basado en value
  theme_minimal() +
  labs(title = "Barplot con mapeos estéticos", x = "Categoría", y = "Valor")

print(bar_plot)

# 2. SCATTERPLOT
# Dataset mínimo para scatterplot (4 puntos)
data_scatter <- data.frame(
  x = c(1, 2, 3, 4),
  y = c(2, 4, 1, 3),
  group = c("G1", "G1", "G2", "G2"),
  size_value = c(1, 2, 3, 4)
)

# Scatterplot con mapeos estéticos
scatter_plot <- ggplot(data_scatter, aes(x = x, y = y, color = group, shape = group, size = size_value, alpha = size_value)) +
  geom_point(position = "identity") +  # position: identity para puntos sin ajuste
  scale_color_manual(values = c("G1" = "purple", "G2" = "green")) +  # color por grupo
  scale_shape_manual(values = c("G1" = 16, "G2" = 17)) +  # shape por grupo (círculo, triángulo)
  scale_size_continuous(range = c(3, 8)) +  # size basado en size_value
  scale_alpha_continuous(range = c(0.5, 1)) +  # alpha basado en size_value
  theme_minimal() +
  labs(title = "Scatterplot con mapeos estéticos", x = "X", y = "Y")

print(scatter_plot)

# 3. LINEPLOT
# Dataset mínimo para lineplot (4 puntos en 2 grupos)
data_line <- data.frame(
  x = c(1, 2, 3, 4, 1, 2, 3, 4),
  y = c(2, 3, 2, 4, 3, 4, 5, 3),
  group = c("L1", "L1", "L1", "L1", "L2", "L2", "L2", "L2")
)

# Lineplot con mapeos estéticos
line_plot <- ggplot(data_line, aes(x = x, y = y, color = group, linetype = group, linewidth = y, alpha = y)) +
  geom_line(position = "identity") +  # position: identity para líneas sin ajuste
  scale_color_manual(values = c("L1" = "orange", "L2" = "blue")) +  # color por grupo
  scale_linetype_manual(values = c("L1" = "solid", "L2" = "dashed")) +  # linetype por grupo
  scale_linewidth_continuous(range = c(0.5, 2)) +  # linewidth basado en y
  scale_alpha_continuous(range = c(0.5, 1)) +  # alpha basado en y
  theme_minimal() +
  labs(title = "Lineplot con mapeos estéticos", x = "X", y = "Y")

print(line_plot)
