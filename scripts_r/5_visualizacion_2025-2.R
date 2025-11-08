# install.packages("ggplot2")
library(ggplot2)

pos_x <- c(25,0,75,200)
pos_y <- c(11,0,53,300)
forma <- c("circulo","circulo","cuadrado","cuadrado")

datos_base <- data.frame(
  pos_x,pos_y,forma
)

datos_base
ggplot(data = datos_base) +
  geom_point(
    mapping = aes(x = pos_x, 
                  y = pos_y, 
                  shape = forma), 
    size = 4, 
    color = "red",
    fill = "lightsalmon") +
  scale_shape_manual(values = c(21,15))

data_bar <- data.frame(
  category = c("A","B","C"),
  value = c(10,15,20),
  group = c("X","Y","Y")
)

ggplot(data = data_bar) +
  geom_col(mapping = aes(
    x=category,
    y=value,
    fill=group,
    alpha=value)) +
  scale_fill_manual(values=c("#F527CC","#49F527")) +
  labs(title = "Un plot", subtitle = "Plot lindo de colores") +
  coord_flip() + 
  theme_linedraw()

data_scatter <- data.frame(
  x = c(1,2,3,4),
  y = c(2,4,1,3),
  group = c("G1","G1","G2","G2"),
  size_value = c(1,2,3,4)
)

data_scatter
View(data_scatter)

ggplot(data_scatter) +
  geom_point(aes(x=x, 
                 y=y, 
                 color=group,
                 shape=group,
                 size=size_value))+
  scale_color_manual(values=c("purple","#49F527")) +
  labs(title = "Scatterplot interesante")
  
data_line <- data.frame(
  x = c(1,2,3,4,1,2,3,4),
  y = c(2,3,2,4,3,4,5,3),
  group = c("L1","L1","L1","L1","L2","L2","L2","L2")
)

data_line

ggplot(data_line) +
  geom_line(aes(x=x,y=y,group=group,color=group))+
  scale_color_manual(values = c("orange","blue"))
  

ggplot(
  mtcars,
  aes(mpg, wt, colour = factor(cyl), fill = factor(cyl))
) +
  geom_point(shape = 21, alpha = 0.5, size = 2)
  
mpg
View(mpg)

faithful
View(faithful)

PlantGrowth
View(PlantGrowth)


