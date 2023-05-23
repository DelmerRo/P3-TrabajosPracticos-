# Importar el juego de datos del archivo Datos.csv
# Las columnas no tienen encabezado
setwd("D:/Ort/Programacion lll/Trabajo Practico - Programacion III/Trabajo Practico 5")
datos <- read.csv("Datos.csv", header = FALSE)

# Analizar la estructura de los datos
str(datos)
head(datos)

# Agreguemos nombres a las columnas, x a la primera e y a la segunda
# utilizando la función names()
names(datos) <- c("x", "y")
names(datos)

# grafique los datos con plot para observar la relacion entre ellos
plot(datos$x, datos$y, xlab = "Variable X", ylab = "Variable Y")


# ajuste un modelo lineal llamado modelo_simple con lm()
modelo_simple <- lm(y ~ x, data = datos)
summary(modelo_simple)

# ¿Cual es el coeficiente de regresión? 
coeficiente_regresion <- coef(modelo_simple)["x"]
print(coeficiente_regresion)

#¿Es bueno el ajuste?
#El valorde R^2 es 0.9955 lo que indica un ajuste muy bueno del modelo.

# ¿Cuál es la ecuación de la recta que representa los puntos?
y = 7.57662 + 2.45290 * x 

# utilizando ggplot grafique los puntos y la recta de regresion.
install.packages("ggplot2")
library(ggplot2)
ggplot(datos, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  xlab("Variable x") +
  ylab("Variable y") +
  ggtitle("Gráfico de puntos y recta de regresión") +
  theme_minimal()








