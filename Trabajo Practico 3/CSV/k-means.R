
# Ejemplo de K-means

# Juego de datos de clientes, caracterizados por edad y monto gastado

df <- read.csv("clientes.csv", header = TRUE)

# Grafico los puntos

library(ggplot2)

ggplot(df, aes(x = edad, y = gasto)) +
  geom_point()

# visualizando la estructura de los datos

str(df)
head(df)

# Usando k-means para tres grupos- La primera columna no es utilizada

misGrupos <- kmeans(df[,-1], 3)

summary(misGrupos)


# Animacion de la formacion de centroides

install.packages("animation")
library(animation)

kmeans.ani(df[,-1], 3)

# Graficamos los puntos coloreados por grupo

plot(df[,-1], col = misGrupos$cluster)

# Graficamos los centroides

points(misGrupos$centers, col = 1:3, pch = 2, cex = 2)

misGrupos$tot.withinss

