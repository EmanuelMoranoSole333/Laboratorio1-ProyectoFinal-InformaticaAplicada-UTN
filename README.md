////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

⚽ GOLAZO! ⚽
Un Videojuego Arcade de Penales hecho en PSeInt
Proyecto de Informática Aplicada (UTN) - por Emanuel Morano Sole

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

GOLAZO! es un videojuego arcade desarrollado 100% en el entorno PSeInt. Este proyecto simula una sala de juegos de football, presentando al jugador una interfaz gráfica completa basada en Arte ASCII, animaciones y múltiples modos de juego.

El núcleo del proyecto es un minijuego de Tanda de Penales que puede jugarse de dos formas: contra la computadora (con dificultad variable) o en un modo de apuestas para dos jugadores.

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

🚀 Características Principales: 🚀🚀🚀🚀

-Interfaz Gráfica 100% ASCII: Todo el juego, desde los menús hasta las animaciones, está renderizado con caracteres de texto.

-Animación de Inicio: Una "Splash Screen" animada que muestra una jugada de gol y el logo del juego parpadeando.

-Menús: Con validación de entradas a prueba de errores. El usuario no puede "romper" el juego ingresando letras en lugar de números.

    Modo 1: Jugador vs. Máquina:

        Permite personalizar el nombre del jugador.

        Incluye una IA de arquero con 3 niveles de dificultad (Fácil, Intermedio, Difícil).

        El jugador patea y ataja en una tanda de 5 penales.

    Modo 2: Modo Apuestas (2 Jugadores):

        Permite personalizar el nombre de ambos jugadores.

        Los jugadores no patean: apuestan "GOL" o "ATAJADA" en una tanda de 5 penales simulada por la CPU.

        El jugador con más puntos al final de las 5 rondas gana.

-Diseño Modular: El código está organizado en funciones reutilizables (módulos), separando la lógica de la interfaz.

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

🛠️ Estructura del Código y Lógica de Funciones:

El proyecto se divide en un algoritmo principal y un conjunto de funciones, cada una con una responsabilidad única.

Algoritmo Principal: Algoritmo Golazo
Es el punto de entrada y el motor principal del juego.

Lógica:

Llama a AnimacionInicio(0) una sola vez para mostrar la "Splash Screen".

Entra en el bucle principal del menú (Repetir...Hasta Que).

Llama a CentradoVertical(5) y CentrarTexto(...) para dibujar el menú principal en cada ciclo.

Utiliza Leer opcion_texto (leyendo como Caracter) para evitar que el programa se "crashee" si el usuario ingresa una letra.

Usa un Segun opcion_texto para comparar la entrada de texto:

"1": Llama a MenuPenales(0).

"2": Muestra el mensaje "en desarrollo".

"3": Muestra el mensaje "Gracias por jugar" y permite que el bucle termine.

De Otro Modo: Maneja cualquier entrada inválida (letras, "4", etc.) mostrando un error.

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Funciones de Animación y Menús

Funcion AnimacionInicio(dummy)
    Propósito: Muestra la animación de bienvenida del juego.

    Lógica:

    Dibuja una secuencia de "frames" de arte ASCII usando Limpiar Pantalla y Esperar Milisegundos para crear la ilusión de un jugador pateando y metiendo un gol.

    Después del gol, entra en un bucle Para j <- 1 Hasta 4 Hacer para crear un efecto de "parpadeo".

        Frame "Encendido": Limpia la pantalla y dibuja AMBAS cosas: la escena final del gol (Frame 5) y el logo de "GOLAZO!".

        Frame "Apagado": Limpia la pantalla y dibuja OTRA VEZ la escena del gol (Frame 5), pero esta vez SIN el logo.

    Esto crea la ilusión de que la escena del gol se queda fija y el logo titila sobre ella.

Funcion animacionDeJugada(esGol)
    Propósito: Muestra una animación de la jugada completa antes de mostrar el resultado final.

    Lógica:

    Esta función es llamada primero por DibujarResultado.

    Recibe la variable esGol (Verdadero o Falso).

    Si esGol Entonces: Muestra una secuencia de 11 "frames" de la animación del gol.

    Sino: Muestra una secuencia de 13 "frames" de la animación de la atajada.

    Usa Limpiar Pantalla y Esperar entre cada frame.

Funcion MenuPenales(dummy)
    Propósito: Muestra el submenú del juego de penales.

    Lógica:

    Dibuja el menú de "Modos de Juego" (1 vs. Máquina, Modo Apuestas, Volver).

    Lee la opcion_menu como texto (Cadena) para evitar errores.

    Usa un Segun para decidir:

    "1": Llama a MenuDificultad(0) para obtener el nivel. Luego llama a EjecutarTandaPenales pasándole 1 (modo vs. CPU) y la dificultad_elegida.

    "2": Llama a EjecutarModoApuestas(0).

    "3": No hace nada, lo que provoca la salida del bucle Repetir...Hasta Que.

Funcion dificultad <- MenuDificultad(dummy)
    Propósito: Muestra el menú de selección de dificultad y devuelve la opción elegida.

    Lógica:

    Muestra las 3 opciones (Fácil, Intermedio, Difícil) con sus dibujos.

    Lee la opcion_dificultad_texto (como Cadena).

    Usa un Si para validar que el texto sea "1", "2" o "3". Si no lo es, muestra un error y el bucle Repetir fuerza al usuario a reintentar.

    Una vez que se ingresa un texto válido, usa ConvertirANumero para pasarlo a opcion_dificultad.

    Devuelve el número (dificultad <- opcion_dificultad).

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Funciones del Juego (Lógica Principal)

Funcion DibujarResultado(posicion_tiro, posicion_atajada, esGol)

    Propósito: Muestra la "foto" final del resultado del penal.

    Lógica:

    Primero, llama a animacionDeJugada(esGol).

    Una vez que la animación termina, esta función se encarga de dibujar el resultado estático.

    Recorre 9 bloques Si/Sino (uno para cada celda del arco).

    Asigna " O " a la variable parte... correspondiente al posicion_tiro.

    Asigna " X " a la variable parte... correspondiente al posicion_atajada.

    Limpiar Pantalla (borrando la animación anterior) y dibuja el arco final, insertando las 9 variables parte... en sus lugares.

    Escribe el texto "¡¡¡ G O O O O O L !!!" o "¡¡¡ ATAJO EL ARQUERO !!!".

    Esperar Tecla para pausar el juego.

Funcion EjecutarTandaPenales(modo_de_juego, dificultad)

    Propósito: Controla todo el flujo del juego 1 vs. CPU.

    Lógica:

    Inicio: Pide el nombre del nombre_j1 y asigna "Maquina" a nombre_j2. Inicializa los goles en 0 y la ronda en 1.

    Bucle Principal: Entra en un Mientras ronda <= 5 Y NO partida_abandonada.

    Turno del Jugador (Patear):

    Usa un bucle Repetir...Hasta Que para leer tiro_texto.

    Valida que el texto sea un número entre "0" y "9". Si no, muestra error y repite.

    Convierte tiro_texto a tiro (número). Si tiro = 0, activa la bandera partida_abandonada.

    Turno de la Máquina (Atajar):

    Usa un Segun dificultad para decidir la atajada de la máquina.

    Dificultad 1 (Fácil): Tiene un 70% de chances (Azar(10) < 7) de elegir a propósito un lugar diferente al del jugador.

    Dificultad 2 (Intermedio): Elige 100% al azar (Azar(9) + 1).

    Dificultad 3 (Difícil): Tiene un 40% de chances (Azar(10) < 4) de "adivinar" el tiro (atajada <- tiro).

    Resultado 1: Llama a DibujarResultado para mostrar si fue gol o atajada.

    Turno de la Máquina (Patear):

    Elige su tiro 100% al azar (Azar(9) + 1).

    Turno del Jugador (Atajar):

    Usa el mismo sistema de Repetir...Hasta Que para leer atajada_texto y validarlo (0-9).

    Convierte a atajada (número). Si atajada = 0, activa la bandera partida_abandonada.

    Resultado 2: Llama a DibujarResultado.

    Fin de Ronda: Incrementa ronda. El bucle Mientras vuelve a empezar.

    Fin del Juego: Al salir del bucle, muestra la pantalla de "Fin del Partido" o "Has Abandonado".

Funcion EjecutarModoApuestas(dummy)
    Propósito: Controla todo el flujo del modo de 2 jugadores.

    Lógica:

    Inicio: Pide nombre_j1 y nombre_j2. Inicializa los puntos (puntos_j1, puntos_j2) en 0 y la ronda en 1.

    Bucle Principal: Entra en un Mientras ronda <= 5.

    Fase de Apuestas:

    Muestra el HUD de apuestas. Pide al Jugador 1 que elija (1: GOL, 2: ATAJADA).

    Valida la entrada apuesta_j1_texto (debe ser "1" o "2").

    Limpiar Pantalla para ocultar la apuesta.

    Pide al Jugador 2 que elija. Valida la entrada apuesta_j2_texto.

    Fase de Simulación:

    Calcula un tiro_cpu (Azar(9)+1) y una atajada_cpu (Azar(9)+1).

    Determina si fue gol, guardando 1 (si es gol) o 0 (si es atajada) en la variable resultado_fue_gol.

    Llama a DibujarResultado(..., resultado_fue_gol = 1). Esta comparación convierte el 1 o 0 en Verdadero o Falso para la función.

    Fase de Pago de la apuesta:

    Compara la apuesta de cada jugador con el resultado. (Ej: Si (resultado_fue_gol = 1 Y apuesta_j1 = 1) O (resultado_fue_gol = 0 Y apuesta_j1 = 2) Entonces...).

    Suma puntos al ganador de la apuesta.

    Fin del Juego: Al salir del bucle, muestra la pantalla de "Fin del Juego de Apuestas" y declara al ganador.

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Funciones de Utilidad

Funcion CentrarTexto(texto_a_centrar)

    Propósito: Dibuja cualquier texto centrado en la pantalla.

    Lógica:

    Asume un ancho fijo de ANCHO_PANTALLA <- 135.

    Calcula los espacios de margen necesarios: trunc((135 - Longitud(texto)) / 2).

    Crea una variable margen con esa cantidad de espacios.

    Imprime el margen y luego el texto_a_centrar.

Funcion CentradoVertical(cantidad_lineas)

    Propósito: Imprime múltiples líneas en blanco para "bajar" el contenido en la pantalla.

    Lógica: Recibe un número y ejecuta un bucle Para esa cantidad de veces, imprimiendo "" (una línea vacía) en cada ciclo.

(Nota: Las funciones LeerCentrado y ObtenerDigitoValido están definidas en el código pero no son llamadas por la lógica principal del juego, ya que la validación de entradas se maneja directamente dentro de las funciones de juego).