# R Primeros pasos

# Matematica basica ctrl-enter
2 + 2  

# Pruebe con dos numeros cualquiera
5 + 8

# Muestra los numeros de 1 a 100 en varias lineas
1:100
for(i in 1:100){
  cat(i,"\n")
}


# No podia faltar
print("Hola Mundo")  



#---------------------------------------------------------------------
# Variables

# asigna los numeros 1-5 en la variable x
x <- 1:5  

# muestra los valores en x
x


# carga los numeros del 6 al 10 en y
y <-6:10

# muestra y
y



#---------------------------------------------------------------------
# Operaciones con vectores

# Suma los elementos correspondientes de x e y
x + y 

# Multiplica cada elemento de x por 2 2
x * 2

plot(x,y)
