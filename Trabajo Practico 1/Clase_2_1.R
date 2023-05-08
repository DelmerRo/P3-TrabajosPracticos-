#VECTORES

#Se asigna un vector con nombres y apellido a la varaible nombre
nombre <- c("Juan Perez", "Juana Diaz", "Esteban Quito")

#Se asigna a un ventor de temperaturas  la variable temperatura
temperatura <- c(36.7, 37, 38.5, 39, 36.6)

#Se asgna una condicion a la variable fiebre(Devuelve TRue False)
fiebre <- temperatura > 37

#Muestra el objeto que hay en la posicion 2
temperatura[2]

#No se puede poner un valor negativo en un rango
temperatura[-2:3]

#Muestra el vector completo exceptuando el vector que esta en la posision 2
temperatura[-2]

# A veces es util definir un vector de valores logicos
# indicando si cada item debe ser incluido
# Por ejemplo, para incluir las primeras dos lecturas
# pero excluir la tercera
temperatura[c(TRUE, TRUE, FALSE, TRUE, FALSE)]

# haga lo mismo pero excluyendo el primer valor(Si se   pone menos valores logicos por default es false)
temperatura[c(FALSE,TRUE,TRUE,TRUE,TRUE)]

#La funcion factor toma un vector de valores y los asigna a niveles categóricos únicos.
genero <- factor(c("VARON", "MUJER", "VARON"))
genero

#Se asigna a la variable tipo, un vector con 3  Valores("O","A","B"), si se repite lo toma como unico.
tipo <- factor(c("O", "A", "A", "B" ))
tipo

#Se le asigna argumento levels para mostrar los tipos existentes de sangre
sangre <- factor(c("O", "A", "A", "B" ),
                 levels = c("A", "B", "AB", "O"))
sangre

#Se Asigna objeto nombre, temperatura, fiebre, genero y sangre a la lista sujeto.
sujeto <- list(nombre = nombre[1], 
                 temperatura = temperatura[1],
                 fiebre = fiebre[1],
                 genero = genero[1],
                 sangre = sangre[1])
sujeto

#Se muesta la segunda posicion  de la lista sujeto
sujeto[2]

#Se muestra de la lista sujeto su temperatura.
sujeto$temperatura



## Matrices
#Insertando un vector de 6 valores en una matriz de 2 columnas y 3filas.
m <- matrix(c(1, 2, 3, 4,5,6), nrow = 3, ncol = 2)
m

#El argumento byrow = TRUE indica que se deben llenar primero las filas de la matriz y luego las columnas,
#en lugar de llenar primero las columnas y luego las filas (que es el comportamiento predeterminado).
m <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = FALSE)
m



##### Explorando y comprendiendo los datos  --------------------
## Explorando datos usando used cars, el argumento stringAsFactors establece a travez de un dato booleano si los registros se repetiran o no
usedcars <- read.csv('D:/Ort/Programacion lll/Trabajo Practico 1/Csv/usedcars.csv', stringsAsFactors = TRUE)

# ver estructura de used car data
str(usedcars)
usedcars

## Explorando variables numericas

# sumarizar variables num?ricas(Muestra  1er Cuartil, mediana(2do Cuartil), media, 3er Cuartil, Max ) de todo
summary(usedcars)

#Muetra unicamente de la columna price, mileage
summary(usedcars[c("price", "mileage")])

# calcular ingreso media(Promedio)
(36000 + 44000 + 56000) / 3
mean(c(36000, 44000, 56000))

# Mediana
median(c( 44000, 56000, 65000, 36000))

# min/max precios autos usados(muestra el min y max)
range(usedcars$price)

# diferencia del rango(muestra la diferencia  del max contra el min)
diff(range(usedcars$price))

# IQR (Inter Quartile Range) para precios de autos usados(Q3 - Q1)
IQR(usedcars$price)

# usar cuartiles
summary(usedcars$price)

# percentil 99
quantile(usedcars$price, probs = c(0.01, 0.99))

# quintiles
quantile(usedcars$price, seq(from = 0, to = 1, by = 0.20))

# Diagrama de caja o boxplot 
boxplot(usedcars$price, main="Boxplot de precios de autos usados",
        ylab="Precio ($)")

boxplot(usedcars$mileage, main="Boxplot de millaje de autos usados",
        ylab="Odometro (mi.)")

# histogramas de precios de autos usados
hist(usedcars$price, main = "Histograma de precios de autos usados",
     xlab = "Precio ($)")

hist(usedcars$mileage, main = "Histograma de millaje de autos usados",
     xlab = "Odometro (mi.)")

# media, varianza y desviacion standard de datos de autos usados
mean(usedcars$price)
var(usedcars$price)
sd(usedcars$price)
mean(usedcars$mileage)
var(usedcars$mileage)
sd(usedcars$mileage)

## Explorando variables numéricas -----

# Tablas de contingencia para los autos usados

table(usedcars$year)
table(usedcars$model)
table(usedcars$color)

# Calcular proporciones
 prop.table(table(usedcars$model))

# round the data
color_table <- table(usedcars$color)
color_pct <- prop.table(color_table) * 100
round(color_pct, digits = 1)

## Exploring relationships between variables -----

# scatterplot of precio vs millaje
plot(x = usedcars$mileage, y = usedcars$price,
     main = "Diagrama de dispersion de Precio vs. Millaje",
     xlab = "Odometro (mi.)",
     ylab = "Precio del auto usado ($)")

# nueva variable indicando colores sobrios(Se extablece una nueva columna en donde tiene un valor logico dependiendo de la condicional en el operado %in% )
usedcars$sobrio <-
  usedcars$color %in% c("Black", "Gray", "Silver", "White")
str(usedcars)
# verificando nuestra variable
table(usedcars$sobrio)

# Crosstab of conservative by model
install.packages("gmodels")
library(gmodels)

CrossTable(x = usedcars$model, y = usedcars$sobrio)

