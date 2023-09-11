Proyecto MasterMind

Es un juego de mesa, de ingenio y reflexión, para dos jugadores.

Se juega en un tablero con fichas blancas y negras pequeñas y de otros colores, de un tamaño algo superior. Uno de los jugadores escoge un número de fichas de colores, 4 en el juego original, y pone un código secreto oculto del otro jugador. Este, tomando fichas de colores del mismo conjunto, aventura una posibilidad contestada con negras (fichas de color bien colocadas) o blancas (fichas de color con el color correcto, pero mal colocadas).
En este caso el juego es virtual y esta diseñado, pra que juegue una persona o la computadora, tiene una tabla de juego, en la cual el lado izquierdo se colocan las opciones de color elegidas y en el lado derecho, el juego esta programado para darle pista sobre esos colores.

Instalacion: Deberan instalar bundle install y el codigo de Colorize, ya que este proyecto se realizo con las gemas, en especifico la gema colorize, para obtener los 8 colores que contiene el juego.

Uso: Cuando ingresan al juego deben colocar el nombre, depues elegir si juega la computadora o usted.
colocar cuatros colores, separados por espacio, debe digitarlos en el idioma ingles, tendra 12 intentos para acertar los cuatro colores correctos.

Este proyecto se diseño de forma modular, con el fin de que sea mas sencillo interactuar y corregir errores, con el objetivo de hacerlo mas eficiente.
Aun falto que fuese mas modular y corregir defectos, para que sea mas sencillo para el jugador, por ejemplo al colocar los colores se debe escribir todo el nombre completo del color, lo cual me parece un poco tedioso, ya que al ser 12 intentos, el jugador podria aburrirse despues de varios intentos.

El proyecto tiene las siguientes archivos:
ColorCode: En este archivo hay una clase, y encontramos los 8 colores permitidos en el juego.

Computer: Este Archivo contiene la clase Computadora, y aca encontramos la logica, para que la computadora se comporte durante el juego, y permita que la persona adivine 4 colores, con 12 intentos.

GameBoard: Este es el tablero que debe mostrar la consola, cuando el juego va a iniciar, el cual contiene dos columanas, que adentro contienen circulos y cada vez que se eligen los 4 colores, el circulo marca el color elegido y la columna de la derecha, marca si es correcto o no.
Para ello hay dos colores verde o rojo, el verde indica que es correcto la pocision del color y el rojo que es incorrecta. cuando se queda en blanco es porque el color si debe ir ahi, pero en otra pocision.

MasterMind: Este es como el archivo principal aqui contenemos las variables de instancia que necesitaremos durante el juego, establecemos los colores a llamar, y las intrucciones que apareceran en la consola una vez que se inicie el juego.
