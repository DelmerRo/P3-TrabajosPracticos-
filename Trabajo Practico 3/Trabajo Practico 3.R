#EJERCICIO
#Sobre el archivo clientes.csv, aplicar a las columnas 2 y 3 la función k-means para k = 4 clusters. Hacer lo mismo para k = 5 y para k = 6.
#Hacer un plot de los puntos y marcar los centroides de los clusters con símbolos distintos, para los tres casos.
#Interpretar y comparar a ojo los gráficos.
#Escribir código para calcular el promedio de puntos por cluster, y aplicarlo a los tres casos.
#Si misGrupos es un clustering obtenido, ¿qué denota la información que se imprime al ejecutar print(table(misGrupos$cluster))C

# Cargamos los datos
df <- read.csv("D:/Ort/Programacion lll/Trabajo Practico 3/CSV/clientes.csv", header = TRUE)
head(df)

# Aplicamos k-means para k = 4
misGrupos4 <- kmeans(df[, c(2,3)], centers = 4)
print(summary(misGrupos4))
plot(df[,c(2,3)], col = misGrupos4$cluster)
points(misGrupos4$centers, col = 1:4, pch = 2, cex = 2)
print(misGrupos4$tot.withinss)

# Aplicamos k-means para k = 5
misGrupos5 <- kmeans(df[, c(2,3)], centers = 5)
print(summary(misGrupos5))
plot(df[,c(2,3)], col = misGrupos5$cluster)
points(misGrupos5$centers, col = 1:5, pch = 2, cex = 2)
print(misGrupos5$tot.withinss)

# Aplicamos k-means para k = 6
misGrupos6 <- kmeans(df[, c(2,3)], centers = 6)
print(summary(misGrupos6))
plot(df[,c(2,3)], col = misGrupos6$cluster)
points(misGrupos6$centers, col = 1:6, pch = 2, cex = 2)
print(misGrupos6$tot.withinss)

