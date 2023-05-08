##### Practica de Clasificación con K Nearest Neighbors --------------------

## Determinando de qué bodega es un vino ----
## Explorando y preparando los datos  ---- 


# 1 importe el archivo CSV vinos.csv a un data frame llamado vinos,
# no tome los strings como factores
vinos <- read.csv("D:/Ort/Programacion lll/Trabajo Practico 4/vinos.csv", header = TRUE, stringsAsFactors = FALSE)

# examine la estructura del data frame con str()
str(vinos)

# Analice con table() la distribucion de la variable "bodega"
table(vinos$bodega)


# 2 recodifique bodega como factor
vinos$bodega <- as.factor(vinos$bodega)

# la volvemos a ver con un formato más informativo
round(prop.table(table(vinos$bodega)) * 100, digits = 1)


# 3 ¿Cual es la distribucion de las bodegas
# sumarice las tres variables numericas "alcohol", "a_malico" y "flavonoides"
summary(vinos[c("alcohol", "a_malico", "flavonoides")])


# 4 ¿Hace falta mezclar los datos? 
  #Para este contexto si, por que mejjora la presicion del modelo. 
#Si es así, hágalo. Utilice un valor de seed de 4237
set.seed(4237)
vinos <- vinos[sample(nrow(vinos)), ]

# Funcion de normalizacion
normalizo <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# Prueba de la funcion de normalización - los resultados deberian ser identicos
normalizo(c(1, 2, 3, 4, 5))
normalizo(c(10, 20, 30, 40, 50))


# 5 Utilice lapply para crear el dataframe vinos_n,
# sin la bodega
vinos_n <- data.frame(lapply(vinos[, -1], normalizo))
View(vinos_n)


# 6 confirme con summary que la normalizacion funciono
summary(vinos_n)


# 7 genere los datos de entrenamiento y prueba con
# con las filas de 1 a 136 y de 137 a 178
train_vector <- 1: 136
test_vector <- 137:178

train_sample <- sample(train_vector, round(length(train_vector)), replace = FALSE)

vinos_train  <- vinos_n[train_sample, ]
print(vinos_train)
vinos_test <- vinos_n[-train_sample, ]
print(vinos_test)

# 8 Genere las etiquetas para los juegos de training y test
vinos_train_labels <- vinos$alcohol[train_sample]
print(vinos_train_labels)
vinos_test_labels <- vinos$alcohol[setdiff(test_vector, train_sample)]
print(vinos_test_labels)
  

# 9 verifique con prop.table que ambos juegos de "labels" tengan
# la misma distribucion
# Obtener distribución de etiquetas para vinos_train_labels
train_labels_prop <- prop.table(table(vinos_train_labels))

# Obtener distribución de etiquetas para vinos_test_labels
test_labels_prop <- prop.table(table(vinos_test_labels))

# Imprimir ambas distribuciones
print(train_labels_prop)
print(test_labels_prop)

# Obtener distribución de etiquetas para vinos_test_labels
test_labels_prop <- prop.table(table(vinos_test_labels))

# Imprimir ambas distribuciones
print(train_labels_prop)
print(test_labels_prop)


## Entrenando un modelo con los datos ----
# Cargue la biblioteca "class"
library(class)


# 10 Cree el modelo vinos_test_pred con la función knn, utilice como valor de k
# la raíz cuadrada de la cantidad de observaciones
k <- round(sqrt(nrow(vinos_train)))
vinos_test_pred <- knn(train = vinos_train, test = vinos_test, cl = vinos_train_labels, k = k)


## Evaluando el desempeño del modelo  ----
# cargue la biblioteca "gmodels" 
library(gmodels)

# Cree la matriz de confusion predicho vs. actual
CrossTable(x = vinos_test_labels, y = vinos_test_pred,
           prop.chisq=FALSE)

# 11 Analice los resultados
#se está comparando la variable objetivo vinos_test_labels con las predicciones del modelo vinos_test_pred.
#El análisis de los resultados de la matriz de confusión puede ayudar a determinar la precisión del modelo.


