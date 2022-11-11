#Práctica 7: POO. GEMA. (Lucas Pérez Rosario)

Esta práctica se centrará en la creación y desarrollo de una gema mediante el uso del bundler.
La gema servirá para representar un aparcamiento. Usando una clase Datos se guardarán los datos 
del aparcamiento y sus características.
Además se usará un módulo Funcionalidades para tener constantes que representarán el estado de 
ocupación del aparcamiento y también una función para mostar este estado.

DOCUMENTACIÓN:

##Expectativas del Initialize e implementación del propio módulo
Este es el primer commit en doc después de haber especificado las expectativas para el Initialize y haber 
implementado el propio método Initialize en la clase Datos. El initialize tendrá una serie de condicionales
que comprobarán que los datos que se pasan para el objeto son correctos

##Expectativas para los métodos get_plazas_totales, plazas_libres y to_s y la implementación de los mismos en la clase
En este commit se añaden las expectativas añadidas en el fichero de expectativas para comprobar el funcionamiento de 3 funciones, cada una en un bloque it.
La función get_plazas_totales devuelve las plazas del aparcamiento, que es una variable de instancia de la la clase.
La función plazas_libres devuelve el número de plazas totales del aparcamiento, para ello hace la resta de las plazas totales con las plazas ocupadas.
Por último, la función to_s mostrará la información del aparcamiento en un string