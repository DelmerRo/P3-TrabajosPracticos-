# Clase 1

# Juegos de datos y graficos

# importo el juego de datos Iris
data(iris)

# ver las primeras filas de iris
head(iris)

# Visualizando la estructura del data frame
str(iris)

# graficando, asegurese qu este cargado el paquete ggplot2
library('ggplot2')
ggplot(data = iris, aes (x = Sepal.Width, y = Petal.Width, color=Species)) + geom_point()

# Haga el mismo grafico pero con la longitud y ancho de los sepalos
ggplot(data = iris, aes (x = Sepal.Width, y = Sepal.Width, color=Species)) + geom_point()


# Juego de datos de pinguinos antarticos
#Instalacion de paquete palmerpenguins
install.packages("palmerpenguins")

#Habilitacion del paquete
library("palmerpenguins")

#Importa el datos de pinguinos antarticos
data("penguins")

# ver las primeras filas de penguins
head(penguins)

# ver informacion de registro
dim(penguins)

# Visualizando la estructura del data frame
str(penguins)

# graficando, asegurese queeste cargado el paquete ggplot2
library('ggplot2')

#Mostrando grafico de DISPERSION entre longitud y profundidad del pico de tres especies
ggplot(data = penguins, aes(x = bill_length_mm , y = bill_depth_mm, color=species)) 
+ geom_point()

#Mostrando histograma por longitud de aleta
ggplot( penguins, aes(x=flipper_length_mm)) + 
  geom_histogram(binwidth=1, color="black", fill="white") + 
  xlab("Longitud de Aleta") + 
  ylab("Cantidad") + 
  ggtitle("Histograma por longitud de aleta")

#Mostrando  diagrama de barras por especie
ggplot(penguins, aes(x=factor(species))) + 
  geom_bar(fill="white", color="black") + 
  xlab("Especies") + 
  ylab("Cantidad") + 
  ggtitle("Diagrama de barras de Cilindros")

