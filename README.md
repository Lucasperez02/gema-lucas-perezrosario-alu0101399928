# Práctica 9: POO. Polimorfismo (Lucas Pérez Rosario)

Esta práctica se centrará en el uso de funciones polimórficas y también en el uso de los módulos enumerable y comparable.

## Cambio de expectativas en el initialize de Datos
Se han añadido nuevas expectativas para el initialize de la clase Datos ya que la clase tiene variables
de instancia nuevas que se han añadido para la práctica.

## Creación de las expectativas y clases para EstacionTren y EstacionAeropuerto
Para la práctica se añaden dos nuevas clases que heredan de la clase GemaAparcamiento::Datos, estas son las clases
EstacionTren y EstacionAeropuerto. Se definen las expectativas para comprobar el initialize de estas clases

## Expectativas para probar el to_s de las clases EstacionTren y EstacionAeropuerto
Se definen expectativas para probar la función to_s que muestra la información del estacionamiento como una string.
Esta función hace uso de la función to_s de GemaAparcamiento::Datos, la clase padre.

## Expectativas para probar la función para insertar un vehiculo
Se definen las expectativas para probar el método con el que se podrá insertar un vehiculo en un estacionamiento.
A la función se le pasa como parámetro un vehiculo y este se inserta en el conjunto de vehiculos que tiene el estacionamiento.

## Expectativas para probar el método de calcluar la duración de un vehiculo en un estacionamiento
Para esta función se pasan el vehiculo al que le calculas su duración en el estacionamietno, su hora de entrada y de salida
En las expectativas se comprueba que se lanzan las diferentes excepciones del método y también que el método funciona correctamente

## Expectativas adicionales (Enumerable, Comparable y Herencia)
En las clases EstacTren y EstacAeropuerto se han incluido los módulos enumerable y comparable y se sobreescrito funciones
Además, en ambas clases se han añadido expectativas para demostrar la jerarquía de herencia

## Expectativas para probar el método de calcular el importe a pagar según una duración
Esta función se encarga de calcular el importe que se pagará en un estacionamiento dependiendo del tiempo que estemos en él

# Funcionalidades nuevas
## Determinar si un aparcamiento cumple con el número de plazas de minusválidos
En esta función se comprueba que un aparcamiento tiene un número de plazas válido, superior a 1/40 cuando el número de plazas
supera las 40

## Determinar el número de plazas de minnusválidos libes
Devuelve el número de plazas libres para minusválidos que hay en el aparcamiento

## Determina el número de vehiculos estacaionados en un aparcamiento
Devuelve el número de vehiculos estacionados. Esta función es polimórfica porque se comporta de maneras diferentes según
el objeto que se le pasa como parámetro.


# Práctica 7: POO. GEMA. (Lucas Pérez Rosario)

Esta práctica se centrará en la creación y desarrollo de una gema mediante el uso del bundler.
La gema servirá para representar un aparcamiento. Usando una clase Datos se guardarán los datos 
del aparcamiento y sus características.
Además se usará un módulo Funcionalidades para tener constantes que representarán el estado de 
ocupación del aparcamiento y también una función para mostar este estado.

DOCUMENTACIÓN:

## Expectativas del Initialize e implementación del propio módulo
Este es el primer commit en doc después de haber especificado las expectativas para el Initialize y haber 
implementado el propio método Initialize en la clase Datos. El initialize tendrá una serie de condicionales
que comprobarán que los datos que se pasan para el objeto son correctos

## Expectativas para los métodos get_plazas_totales, plazas_libres y to_s y la implementación de los mismos en la clase
En este commit se añaden las expectativas añadidas en el fichero de expectativas para comprobar el funcionamiento de 3 funciones, cada una en un bloque it.
La función get_plazas_totales devuelve las plazas del aparcamiento, que es una variable de instancia de la la clase.
La función plazas_libres devuelve el número de plazas totales del aparcamiento, para ello hace la resta de las plazas totales con las plazas ocupadas.
Por último, la función to_s mostrará la información del aparcamiento en un string

## Expectativas para las contantes del módulo Funcionalidades en el módulo GemaAparacamiento
En el módulo GemaAparcamiento se ha declarado otro módulo llamado Funcionalidades. Por ahora este módulo tiene unas contantes para indicar si el aparcamiento está lleno o libre. He definido unas expectativas cada una en su bloque it para comprobar el funcionamiento de estas constantes

## Expectativas para probar la función estado_de_aparcamiento y desarrollo del propio módulo
He definido las expectativas para comprobar el funcionamiento de la función estado_de_aparcamiento. Esta función está declarada en el módulo Funcionalidades del módulo GemaAparcamiento. La función devuelve la constante correspondiente en cada caso dependiendo de si el número de plazas libres es 0 se delvuelve la constante APAR_LLENO
en el caso que las plazas libres sean diferentes a 0 la función devolverá la constante APAR_LIBRE

# Práctica 8: POO. Herencia

Esta práctica se centrará en la herencia de clases. Utilizando la misma gema creda en la anterior práctica, 
habrá que crear una clase vehiculo y una clase Motor que heredará de la clase vehiculo.

DOCUMENTACIÓN:

## Expectativas de la clase Vehiculo

### Expectativas del initialize e implementación
Se han definido las expectativas para el initialize de la clase vehiculo y se ha implementado el propio método en la clase.
En el initialize se tienes condicionales comprbando que los datos que se pasan para el vehiculo son correctos. Si no lo hacen
se lanzan excepciones.

### Expectativas del to_s e implementación
Esta función to_s servirá para mostrar la información del vehiculo como una string

### Expectativas para la variable de clase
Para la clase vehiculo se declara una variable de clase @@numero_vehiculos que servirá para llevar un conteo de los objetos que se han
instanciado de la clase vehiculo. Se impelenta un método count que devuelve dicha variable.

### Expectativas para los operadores de comparación
En la clase Vehiculo se incluye el módulo Comparable con el que se podrá sobrecargar los operadores de comparación.
En este caso para comparar los vehiculos se hará mediante su volumen (ancho * alto * largo)

### Expectativas para comprobar la herencia de la clase vehiculo
Se definen expectativas para comprobar que la herencia de la clase vehiculo es correcta

## Expectativas de la clase motor

La clase motor es una clase que hereda de la clase vehiculo.

### Expectativas del initialize e implementación
Se han definido las expectativas para el initialize de la clase motor y se ha implementado el propio método en la clase.
En el initialize se tienes condicionales comprbando que los datos que se pasan para el vehiculo a motor son correctos. Si no lo hacen
se lanzan excepciones. Además, en este initialize se usa el initialize de la clase padre vehiculo gracias a la herencia.

### Expectativas del to_s e implementación
Esta función to_s servirá para mostrar la información del vehiculo de motor como una string

### Expectativas para la variable de clase
La variable de clase que se había declarado en la clase vehiculo también debe aumentar cuando se instancia un objeto de la clase motor
ya que esta clase hereda de la clase vehiculo y hace uso del initialize de vehiculo como hemos dicho

### Expectativas para los operadores de comparación
En la clase Motor se incluye el módulo Comparable con el que se podrá sobrecargar los operadores de comparación.
En este caso para comparar los vehiculos de motor se hará mediante su n_plazas

### Expectativas para comprobar la jerarquía de herencia de la clase motor
Se definen expectativas para comprobar que la herencia de la clase motor es correcta

## Jerarquía de herencia de la clase Datos
Se definen expectativas para comprobar la jerarquía de herencia de la clase Datos

## Jerarquía de herencia del módulo GemaAparcamiento
Se definen expectativas para comprobar la jerarquía de herencia del módulo GemaAparcamiento

