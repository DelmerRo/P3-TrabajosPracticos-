###Ejercicios YA-PR3C
# Ejemplos en R para que experimenten con vectores

# Los comentarios van precedidos por #

# Con seq se puede especificar una secuencia entera dando el inicio, el fin y el paso (parámetro by o 3º parámetro):
x <- seq(-5, 5, by=.2)

# asigna a x el vector c(-5.0, -4.8, -4.6, ..., 4.6, 4.8, 5.0).
x2 <- seq(length=51, from=-5, by=.2)

# es otra manera, indicando el largo, desde y paso
# c() se usa tanto para construir vectores como para concatenarlos; vean un ejemplo
print(c(c(3,4),c(c(5),6),3))

# Si la secuencia es de a 1 (ascendente o descendente), se puede usar la función :, del siguiente modo

# a : b, devuelve un vector con los números entre a y b inclusive

# Vean lo que se imprime al ejecutar estos ejemplos:
print(1:10)
print(2:3)
print(2:2)
print(2:1)
print(-10:1)
print(c(c(-5:-1),c(1:5)))


#X ya esta con una secuencia asignada y a esos intervalos se le divide entre 5
x <- rep(x, times=5)
print(x)

# repite el vector x 5 veces(repite en x 5 veces cada elemento)
x <- rep(x, each=5)
print(x)

# R permite extender a todo un vector una operación sobre elementos, ejemplo:
# imprime todos los elementos de x incrementados en 1
print(x + 1)

# En cambio, vector + vector suma los vectores del modo usual, componente a componente
# Lo mismo con -, *, /, aplicará esa operación componente a componente
print(x+x)

# Ejercicio: escribir una sentencia muy corta, de no más de 18 caracteres, que devuelva el vector 1,4,9,16,25,...,10000 de todos los cuadrados de los naturales del 1 al 100
print(c(1:100)^2)

# Ejercicio: escribir una sentencia muy corta, de no más de 25 caracteres, que devuelva el vector de todos los cuadrados de los naturales 1,3,5,...,99 es decir de los naturales impares del 1 al 100
print(seq(1, 99, 2)^2)

# En cambio, si necesitaran multiplicar vectores por matrices o matrices por matrices, hay funciones para eso también (ya lo veremos)
# Recordar que las funciones <, >, =, etc. devuelven un booleano; por ej., al evaluar exp < 0 devolverá TRUE o FALSE, según el valor de la expresión exp
print(x < 0)
# imprime un vector de booleanos, según sean < 0 o no los elementos de x, es decir es el resultado de extender la operación a todos los elementos

# R permite indexar un vector con un vector de booleanos, indicando los elementos a procesar o devolver; vean este ejemplo:
x[c(TRUE, TRUE, FALSE, TRUE)] <- 100
#asigna 100 a los elementos que se corresponden a TRUE en el vector usado como parámetro, es decir, solamente a los elementos 1, 2 y 4


# Piensen qué imprimen estos ejemplos, antes de probarlas:
#Le asigna al primer vector  una posicion especifica
print(c("a","b","c","d","r")[c(1,2,5,1,3,1,4,1,2,5,1)])

#Se crea un vector con x e y y desspues les asigno una posicion y los repito 4 veces
print(c("x","y")[rep(c(1,2,2,1), times=4)])

# La función factor convierte vector a elementos simbólicos al estilo de los enumerados, ahorrando espacio y mejorando la lectura (además se definen niveles)
print(factor(c("a","b","c","d","r")[c(1,2,5,1,3,1,4,1,2,5,1)]))

# La función abs() que devuelve el valor absoluto (módulo) de un número real. Se puede lograr su efecto también del siguiente modo, si necesitáramos modificar los elementos de un vector por sus valores absolutos:
x[x < 0] <- -x[x < 0]
# es decir, el vector x, para los elementos en que se cumpla la condición x < 0, deja los mismos elementos pero cambiados de signo, y al resto no lo cambia

# Piensen, antes de probarlas, qué efecto tiene cada una de las siguientes expresiones sobre x (o si dan error por asignar un vector de tamaño inadecuado):
x[x < 0] <- x[x < 0]

x[x <= 0] <- -x[x <= 0]

x[x > 0] <- -x[x > 0]

x[x == 0] <- -x[x == 0]

x[x > 0] <- (2*x)[x > 0]

x[x != 0.0] <- 0


# Ejercicios sobre un vector x:

# Asignarle al vector y los elementos de x mayores que 0 (los otros no deben aparecer)
x <- seq(-5, 5, by=.2)
y <- x[x > 0]

# Asignarle al vector y los inversos (es decir 1/x) de los elementos de x que no sean 0 (evitando así el error de división por 0)
x <- c(-2, 3, 0, 1, -4, 6)
y <- ifelse(x != 0, 1/x, 0)

# Asignarle al vector y todos los elementos de x multiplicados por 3
x <- seq(-5,5)
x <- x*3

# Asignarle al vector y los elementos de x que son > 0 seguidos de los elementos de x que son < 0. Es decir, primero los positivos y a continuación los negativos. Ejemplo: si x = 1 -1 4 0 -2 3, deberá resultar y = 1 4 3 -1 -2.
x <- c(x[x > 0], x[x < 0])



## Producto externo
# El operador %o% permite obtener el producto de todos los elementos con todos ellos, devolviendo una matriz (o arreglo de dimensión mayor que el original); por ej:
x <- 1:10 %o% 1:10

# asigna a x la matriz de 10x10 siguiente (sale así al imprimir):
#[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#[1,]    1    2    3    4    5    6    7    8    9    10
#[2,]    2    4    6    8   10   12   14   16   18    20
#[3,]    3    6    9   12   15   18   21   24   27    30
#[4,]    4    8   12   16   20   24   28   32   36    40
#[5,]    5   10   15   20   25   30   35   40   45    50
#[6,]    6   12   18   24   30   36   42   48   54    60
#[7,]    7   14   21   28   35   42   49   56   63    70
#[8,]    8   16   24   32   40   48   56   64   72    80
#[9,]    9   18   27   36   45   54   63   72   81    90
#[10,]   10   20   30   40   50   60   70   80   90   100



# (lo que sigue es comentario)
#A ver si logran, con este método (y algo más) mediante una sola sentencia de print, obtener la tabla con el doble de todos los anteriores, es decir:
x <- 2*x

#[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#[1,]    2    4    6    8   10   12   14   16   18    20
#[2,]    4    8   12   16   20   24   28   32   36    40
#[3,]    6   12   18   24   30   36   42   48   54    60
#[4,]    8   16   24   32   40   48   56   64   72    80
#[5,]   10   20   30   40   50   60   70   80   90   100
#[6,]   12   24   36   48   60   72   84   96  108   120
#[7,]   14   28   42   56   70   84   98  112  126   140
#[8,]   16   32   48   64   80   96  112  128  144   160
#[9,]   18   36   54   72   90  108  126  144  162   180
#[10,]   20   40   60   80  100  120  140  160  180   200

#(Esto podría hacerse de más de una forma...)
#Y luego a ver si pueden convertir todo a un solo vector, es decir que al imprimir salga algo como:
vector <- as.vector(x)

#[1]   2   4   6   8  10  12  14  16  18  20   4   8  12 16  20  24  28  32
#[19]  36  40   6  12  18  24  30  36  42  48  54  60   8 16  24  32  40  48
#[37]  56  64  72  80  10  20  30  40  50  60  70  80  90 100  12  24  36  48
#[55]  60  72  84  96 108 120  14  28  42  56  70  84  98 112 126 140  16  32
#[73]  48  64  80  96 112 128 144 160  18  36  54  72  90 108 126 144 162 180
#[91]  20  40  60  80 100 120 140 160 180 200



#Se puede usar la función summary(x) para obtener una impresión amigable de ciertos datos estadísticos básicos sobre los elementos del vector x (mínimo, máximo, media, mediana y cuartiles, de los que hablamos). Para el último vector anterior, imprimir este summary dará:
  
 # Min. 1st Qu.  Median    Mean   3rd Qu.    Max.
  #2.0    20.0    48.0    60.5    90.0      200.0

# otros ejemplos
x <- 1:4
y <- outer(x,x) # es lo mismo que y <- x %o% x
print(y)

# La función table devuelve una tabla por frecuencias, es decir cada elemento cuántas veces aparece
# prueben utilizar table para vectores varios...
z <- table(y)
print(z)

# Finalmente, se puede usar plot para que grafique esa tabla por frecuencias (si se desea, especificando los rótulos de los ejes x e y)
plot(z, xlab="valor", ylab="frecuencia")



## Ejercicios que involucran temas de estadística:
#Comprobar o convencerse de que siempre vale min(x) <= median(x) <= max(x).
x <- round(runif(10)*100)
x <- c(1:100)
x <- c(-10:10)
x <- c(-100:0)
print(ifelse(min(x) <= median(x) && median(x) <= max(x),"Cumple","No cumple"))

#Mostrar casos de vectores x tales que mean(x) = median(x).
x <- c(1,2,3,4,5,6,7)
x <- c(1,2,3,4,5)
x <- c(0:60)
x <- c(-50:50)
x <- c(-100:0)
print(ifelse(mean(x) == median(x),"Son iguales","No son iguales"))

#Mostrar otros tales que mean(x) < median(x).
x <- c(0,1,2,5,6,7,8,9)
x <- c(c(0:10),c(20:50))
print(ifelse(mean(x) < median(x),"La Media es menor que la Mediana.","La Media es mayor que la Mediana."))

#Mostrar otros tales que mean(x) > median(x).
x <- c(c(0:20),c(20:30))
print(ifelse(mean(x) > median(x),"La Mediana es mas grande que la Media.","La Media es mas grande que la Mediana."))

#Mostrar otros tales que mean(x) = min(x).
x <- c(67,67,67)
x <- c(58,58,58,58,58)
print(ifelse(mean(x) == min(x),"La Media es igual al minimo","La Media no es igual al minimo."))

#Mostrar otros tales que median(x) = max(x).
x <- c(66,67,67)
x <- c(56,56,58,58,58)
print(ifelse(median(x) == max(x),"La Mediana es igual al maximo","La Mediana no es igual al maximo."))

#Verificar si al calcular un "promedio de promedios" siempre dará lo mismo que calcular el promedio de todos los valores. Por ejemplo, si alguien tiene calculados separadamente los promedios de calificaciones por año, y luego promedia estos valores, ¿necesariamente le dará lo mismo que promediar todas sus notas?
# Generar una matriz aleatoria con 5 años de calificaciones y 10 calificaciones por año
calificaciones <- matrix(rnorm(50, 70, 10), nrow = 5)

# Calcular el promedio de todos los valores
promedio_total <- mean(calificaciones)
promedio_total

# Calcular los promedios por año y el promedio de los promedios
promedios_por_año <- apply(calificaciones, 1, mean)
promedio_promedios <- mean(promedios_por_año)

# Comparar los resultados
print(ifelse(promedio_total == promedio_promedios,"El promedio total es igual al promedio de los promedios","El promedio total no es igual al promedio de los promedios"))


##Rangos
#range(x) devuelve el rango de un vector de números, ese rango siempre consiste en 2 números, que son el mínimo y el máximo del vector

#Pregunta fácil: ¿Cómo definiría la función range() si no estuviera ya definida?
  #Como una funcion que devuelve el valor minimo y el valor maximo en ese orden en un vector)
  
#¿Es verdad que siempre vale mean(x) - median(x) <= diff(range(x))?
#Si
x <- round(runif(10)*100)
media <- mean(x)
mediana <- median(x)
difRango <- diff(range(x))
print(ifelse(media - mediana <= difRango,"La resta de la media y la mediana es menor o igual a la diferencia entre rangos","La resta de la media y la mediana es mayor a la diferencia entre rangos"))                 

#IQR(x) devuelve el inter quartile range de x, que es la diferencia entre los 2 cuartiles del medio sobre los elementos de x
#Observar lo que devuelve 
IQR(seq(1, 5, 1))

#Comprobar o convencerse de que siempre vale diff(IQR(x)) <= diff(range(x)).
x <- c(10, 15, 12, 17, 14, 19, 16)

#diff(IQR(x)) siempre devuelve un vector vacio(numeric(0)) por lo cual me sale error(logical(0)) , es una duda que tengo.
diffIQR <- diff(IQR(x))
diffRange <- diff(range(x))
print(ifelse(diff(IQR(x)) <= diff(range(x)), "diff(IQR(x)) es menor o igual que diff(range(x))", "diff(IQR(x)) no es menor o igual que diff(range(x))"))




