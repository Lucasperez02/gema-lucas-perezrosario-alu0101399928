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

##Expectativas para las contantes del módulo Funcionalidades en el módulo GemaAparacamiento
En el módulo GemaAparcamiento se ha declarado otro módulo llamado Funcionalidades. Por ahora este módulo tiene unas contantes para indicar si el aparcamiento está lleno o libre. He definido unas expectativas cada una en su bloque it para comprobar el funcionamiento de estas constantes

##Expectativas para probar la función estado_de_aparcamiento y desarrollo del propio módulo
He definido las expectativas para comprobar el funcionamiento de la función estado_de_aparcamiento. Esta función está declarada en el módulo Funcionalidades del módulo GemaAparcamiento. La función devuelve la constante correspondiente en cada caso dependiendo de si el número de plazas libres es 0 se delvuelve la constante APAR_LLENO
en el caso que las plazas libres sean diferentes a 0 la función devolverá la constante APAR_LIBRE
