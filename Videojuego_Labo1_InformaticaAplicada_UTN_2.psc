// =============================================================================
// FUNCIÓN #1: RESULTADO DEL PENAL
// =============================================================================
Funcion DibujarResultado(posicion_tiro, posicion_atajada, esGol)
    Definir parte1, parte2, parte3, parte4, parte5, parte6, parte7, parte8, parte9 Como Caracter;
	
    // Celda 1
    Si posicion_tiro = 1 Entonces
        parte1 <-     " O "
	Sino 
		Si posicion_atajada = 1 Entonces
			parte1 <- " X "
		Sino
			parte1 <- "   "
		FinSi
	FinSi
	
    // Celda 2
    Si posicion_tiro = 2 Entonces
        parte2 <-     " O "
	Sino 
		Si posicion_atajada = 2 Entonces
			parte2 <- " X "
		Sino
			parte2 <- "   "
		FinSi
	Finsi
	
    // Celda 3
    Si posicion_tiro = 3 Entonces
        parte3 <-     " O "
	Sino 
		Si posicion_atajada = 3 Entonces
			parte3 <- " X "
		Sino
			parte3 <- "   "
		FinSi
	FinSi
	
    // Celda 4
    Si posicion_tiro = 4 Entonces
        parte4 <-     " O "
	Sino 
		Si posicion_atajada = 4 Entonces
			parte4 <- " X "
		Sino
			parte4 <- "   "
		FinSi
	FinSi
	
    // Celda 5
    Si posicion_tiro = 5 Entonces
        parte5 <-     " O "
	Sino 
		Si posicion_atajada = 5 Entonces
			parte5 <- " X "
		Sino
			parte5 <- "   "
		FinSi
		
    FinSi
	
    // Celda 6
    Si posicion_tiro = 6 Entonces
        parte6 <-     " O "
	Sino 
		Si posicion_atajada = 6 Entonces
			parte6 <- " X "
		Sino
			parte6 <- "   "
		Finsi
    FinSi
    
	// Celda 7
    Si posicion_tiro = 7 Entonces
        parte7 <-     " O "
	Sino 
		Si posicion_atajada = 7 Entonces
			parte7 <- " X "
		Sino
			parte7 <- "   "
		FinSi
		
    FinSi
    
	// Celda 8
    Si posicion_tiro = 8 Entonces
        parte8 <-     " O "
	Sino 
		Si posicion_atajada = 8 Entonces
			parte8 <- " X "
		Sino
			parte8 <- "   "
		FinSi
		
    FinSi
    
	// Celda 9
    Si posicion_tiro = 9 Entonces
        parte9 <-     " O "
	Sino 
		Si posicion_atajada = 9 Entonces
			parte9 <- " X "
		Sino
			parte9 <- "   "
		FinSi
		
    FinSi
    
	// INTERFACE ARCO
    Limpiar Pantalla;

	Para i <- 1 Hasta 5 Hacer
		Escribir ""
	FinPara
	//CentrarTexto("****************************************************")
	CentrarTexto("  ___ ___ ___")
	CentrarTexto(" |"+ parte7+"|"+ parte8+ "|"+ parte9+ "|")
	CentrarTexto(" |___|___|___|")
	CentrarTexto(" |"+ parte4+"|"+ parte5+ "|"+ parte6+ "|")
	CentrarTexto(" |___|___|___|")
	CentrarTexto(" |"+ parte1+"|"+ parte2+ "|"+ parte3+ "|")
	CentrarTexto(" |___|___|___|")
	CentrarTexto("")
	//
    //Escribir "  ___ ___ ___"
    //Escribir " |", parte7,"|", parte8, "|", parte9, "|"
    //Escribir " |___|___|___|"
    //Escribir " |", parte4,"|", parte5, "|", parte6, "|"
    //Escribir " |___|___|___|"
    //Escribir " |", parte1,"|", parte2, "|", parte3, "|"
    //Escribir " |___|___|___|"
    //Escribir ""
	
    Si esGol Entonces
        CentrarTexto("¡¡¡ G O O O O O L !!!")
    Sino
        CentrarTexto("¡¡¡ ATAJÓ EL ARQUERO !!!")
    FinSi
	
    Escribir ""
    CentrarTexto("Presiona Enter para continuar...")
	Escribir ""
    Esperar Tecla
	
Fin Funcion

// =============================================================================
// FUNCIÓN #2: EJECUTA LA TANDA DE PENALES JUGADOR VS MAQUINA
// =============================================================================
Funcion EjecutarTandaPenales(modo_de_juego)
    Definir goles_j1, goles_j2, ronda, tiro, atajada Como Entero;
    Definir partida_abandonada Como Logico;
    Definir nombre_j1, nombre_j2 Como Caracter;
	
    nombre_j1 <- "Jugador 1"
    Si modo_de_juego = 1 Entonces
        nombre_j2 <- "Máquina"
    Sino
        nombre_j2 <- "Jugador 2"
    FinSi
	
    goles_j1 <- 0
    goles_j2 <- 0
    partida_abandonada <- Falso
    ronda <- 1
	
    Mientras ronda <= 5 Y NO partida_abandonada Hacer
        Limpiar Pantalla
		
		Para i<-1 Hasta 5 Con Paso 1 Hacer
			Escribir ""
		Fin Para
        CentrarTexto("****************************************************")
        CentrarTexto("RONDA "+ ConvertirATexto(ronda)+ " de 5")
        CentrarTexto("MARCADOR: "+ nombre_j1+ " "+ ConvertirATexto(goles_j1)+ " - "+ nombre_j2+ " "+ ConvertirATexto(goles_j2))
        CentrarTexto("****************************************************")
        Escribir ""
		
        CentrarTexto(">>> PATEA "+ nombre_j1+ " <<<")
        Repetir
            CentrarTexto("Elige una zona para disparar (1-9) o (0 para salir):")
            Leer tiro
        Hasta Que tiro >= 0 Y tiro <= 9
		
        Si tiro = 0 Entonces
            partida_abandonada <- Verdadero
        Sino
            CentrarTexto(">>> ATAJA "+ nombre_j2+ " <<<")
            Si modo_de_juego = 1 Entonces
                atajada <- Azar(9) + 1
                CentrarTexto("La Máquina elige su posición...")
                Esperar 1 Segundos
            Sino
                Repetir
                    CentrarTexto("Elige una zona para atajar (1-9):")
                    Leer atajada
                Hasta Que atajada >= 1 Y atajada <= 9
            FinSi
			
            Si tiro <> atajada Entonces
                goles_j1 <- goles_j1 + 1
                DibujarResultado(tiro, atajada, Verdadero)
            Sino
                DibujarResultado(tiro, atajada, Falso)
            FinSi
            
            // Turno del jugador 2 / máquina
            Si NO partida_abandonada Entonces
                Limpiar Pantalla
				Para i <-1 Hasta 5 Con Paso 1 Hacer
					Escribir " "
				Fin Para
                CentrarTexto("****************************************************")
                CentrarTexto("RONDA " + ConvertirATexto(ronda) + " de 5")
                CentrarTexto("MARCADOR: "+ nombre_j1+ " "+ ConvertirATexto(goles_j1)+ " - "+ nombre_j2+ " "+ ConvertirATexto(goles_j2))
                CentrarTexto("****************************************************")
                Escribir ""
				
                Escribir ">>> PATEA " + nombre_j2 + " <<<"
                Si modo_de_juego = 1 Entonces
                    tiro <- Azar(9) + 1
                    Escribir "La Máquina elige su disparo..."
                    Esperar 1 Segundos
                Sino
                    Repetir
                        Escribir "Elige una zona para disparar (1-9):"
                        Leer tiro
                    Hasta Que tiro >= 1 Y tiro <= 9
                FinSi
                
                Escribir ">>> ATAJA " + nombre_j1 + " <<<"
                Repetir
                    Escribir "Elige una zona para atajar (1-9) o (0 para salir):"
                    Leer atajada
                Hasta Que atajada >= 0 Y atajada <= 9
                
                Si atajada = 0 Entonces
                    partida_abandonada <- Verdadero
                Sino
                    Si tiro <> atajada Entonces
                        goles_j2 <- goles_j2 + 1
                        DibujarResultado(tiro, atajada, Verdadero)
                    Sino
                        DibujarResultado(tiro, atajada, Falso)
                    FinSi
                FinSi
                
                ronda <- ronda + 1
            FinSi
        FinSi
    FinMientras
	
    Limpiar Pantalla
    Si partida_abandonada Entonces
        Escribir "============================================="
        Escribir "||       HAS ABANDONADO LA PARTIDA       ||"
        Escribir "============================================="
    Sino
        Escribir "============================================="
        Escribir "||            FIN DEL PARTIDO            ||"
        Escribir "============================================="
        Escribir "Marcador final: ", nombre_j1, " ", ConvertirATexto(goles_j1), " - ", nombre_j2, " ", ConvertirATexto(goles_j2)
        Escribir ""
        Si goles_j1 > goles_j2 Entonces
            Escribir "¡¡¡ GANA ", nombre_j1, " !!!"
		Sino
			Si goles_j2 > goles_j1 Entonces
				Escribir "¡¡¡ GANA ", nombre_j2, " !!!"
			Sino
				Escribir "¡El resultado es un EMPATE!"
			FinSi
			
        FinSi
    FinSi
    Escribir ""
    Escribir "Presiona Enter para volver al menú principal..."
    Esperar Tecla
Fin Funcion
// =============================================================================
// FUNCIÓN #3: MODO APUESTAS
// =============================================================================
Funcion EjecutarModoApuestas(dummy)
	Definir puntos_j1, puntos_j2, ronda, apuesta_j1, apuesta_j2, tiro_cpu, atajada_cpu Como Entero
	Definir VALOR_APUESTA Como Entero
	Definir resultado_fue_gol Como Entero
	Definir i Como Entero
	puntos_j1 <- 50
	puntos_j2 <- 50
	VALOR_APUESTA <- 10
	ronda <- 1
	
	Mientras  ronda <= 5 Hacer
		Limpiar Pantalla
		Para i <- 1 Hasta 5 Hacer
			Escribir ""
		FinPara
		CentrarTexto("****************************************************")
        CentrarTexto("RONDA DE APUESTAS "+ ConvertirATexto(ronda)+ " de 5")
        CentrarTexto("PUNTAJE: Jugador 1 ["+ ConvertirATexto(puntos_j1)+ "] - Jugador 2 ["+ ConvertirATexto(puntos_j2)+ "]")
        CentrarTexto("****************************************************")
        Escribir ""
	//FinMientras
	
	// APUESTA JUGADOR 1
	CentrarTexto(">>> TURNO DE APUESTA: JUGADOR 1 <<<")
	Repetir
		CentrarTexto("¿Qué crees que pasará? (1: GOL, 2: ATAJADA)")
		Leer apuesta_j1
		Si apuesta_j1 <> 1 Y apuesta_j1 <> 2 Entonces
			CentrarTexto("Opción inválida. Elige 1 o 2.");
			Esperar 1 Segundos;
			// Volver a dibujar la pantalla para que se vea limpia
			Limpiar Pantalla;
			Para i <- 1 Hasta 5 Hacer
				Escribir "";
			FinPara
			CentrarTexto("****************************************************");
			CentrarTexto("RONDA DE APUESTAS " + ConvertirATexto(ronda) + " de 5");
			CentrarTexto("PUNTAJE: Jugador 1 [" + ConvertirATexto(puntos_j1) + "] - Jugador 2 [" + ConvertirATexto(puntos_j2) + "]");
			CentrarTexto("****************************************************");
			Escribir "";
			CentrarTexto(">>> TURNO DE APUESTA: JUGADOR 1 <<<");
		FinSi
	Hasta Que apuesta_j1 = 1 O apuesta_j1 = 2;
	Limpiar Pantalla; // Oculta la apuesta del J1
	
	// APUESTA JUGADOR 2
	Para i <- 1 Hasta 5 Hacer
		Escribir ""
	FinPara
	CentrarTexto("****************************************************")
	CentrarTexto("RONDA DE APUESTAS " + ConvertirATexto(ronda) + " de 5")
	CentrarTexto("PUNTAJE: Jugador 1 [" + ConvertirATexto(puntos_j1) + "] - Jugador 2 [" + ConvertirATexto(puntos_j2) + "]")
	CentrarTexto("****************************************************")
	Escribir ""
	CentrarTexto(">>> TURNO DE APUESTA: JUGADOR 2 <<<")
	Repetir
		CentrarTexto("¿Qué crees que pasará? (1: GOL, 2: ATAJADA)")
		Leer apuesta_j2
		Si apuesta_j2 <> 1 Y apuesta_j2 <> 2 Entonces
			CentrarTexto("Opción inválida. Elige 1 o 2.")
			Esperar 1 Segundos
			// Volver a dibujar la pantalla para que se vea limpia
			Limpiar Pantalla
			Para i <- 1 Hasta 5 Hacer
				Escribir ""
			FinPara
			CentrarTexto("****************************************************")
			CentrarTexto("RONDA DE APUESTAS "+ ConvertirATexto(ronda)+ " de 5")
			CentrarTexto("PUNTAJE: Jugador 1 ["+ ConvertirATexto(puntos_j1)+ "] - Jugador 2 ["+ ConvertirATexto(puntos_j2)+ "]")
			CentrarTexto("****************************************************")
			Escribir ""
			CentrarTexto(">>> TURNO DE APUESTA: JUGADOR 2 <<<")
		FinSi
	Hasta Que apuesta_j2 = 1 O apuesta_j2 = 2
	
	Escribir ""
	CentrarTexto("Ambas apuestas registradas. ¡Veamos el penal!")
	Esperar 2 Segundos
	
	// SIMULACIÓN Y RESULTADO
	tiro_cpu <- Azar(9) + 1
	atajada_cpu <- Azar(9) + 1
	Si tiro_cpu <> atajada_cpu Entonces
		resultado_fue_gol <- 1 // hizo gol
	Sino
		resultado_fue_gol <- 0 // No hizo gol, fue atajada
	FinSi
	
	DibujarResultado(tiro_cpu, atajada_cpu, resultado_fue_gol)
	
	// PAGO DE APUESTAS
	Si (resultado_fue_gol = 1 Y apuesta_j1 = 1) O (resultado_fue_gol = 0 Y apuesta_j1 = 2) Entonces
		Escribir Sin Saltar"                                             "
		Escribir "Jugador 1: ¡Acertaste! Ganas ", VALOR_APUESTA, " puntos."
		puntos_j1 <- puntos_j1 + VALOR_APUESTA
	Sino
		CentrarTexto("Jugador 1: ¡Fallaste! No ganaste puntos.")
		puntos_j1 <- puntos_j1 - VALOR_APUESTA
	FinSi
	
	Si (resultado_fue_gol = 1 Y apuesta_j2 = 1) O (resultado_fue_gol = 0 Y apuesta_j2 = 2) Entonces
		Escribir Sin Saltar"                                             "
		Escribir "Jugador 2: ¡Acertaste! Ganas ", VALOR_APUESTA, " puntos."
		puntos_j2 <- puntos_j2 + VALOR_APUESTA
	Sino
		CentrarTexto("Jugador 2: ¡Fallaste! No ganaste puntos.")
		puntos_j2 <- puntos_j2 - VALOR_APUESTA
	FinSi
	
	ronda <- ronda + 1
	Escribir ""
	CentrarTexto("Presiona Enter para la siguiente ronda...")
	Esperar Tecla
	FinMientras

FinFuncion
// =============================================================================
// FUNCIÓN #3: MUESTRA EL MENÚ DEL JUEGO DE PENALES
// =============================================================================
Funcion MenuPenales(dummy)
    Definir opcion_menu, i Como Entero
    Repetir
        Limpiar Pantalla
		
        // --- CENTRADO VERTICAL ---
        // Imprime 5 líneas en blanco para bajar el menú
        Para i <- 1 Hasta 5 Hacer
            Escribir ""
        FinPara
		//Menu
        CentrarTexto( "*********************************" )
        CentrarTexto( "*     MODOS DE JUEGO PENALES    *" )
        CentrarTexto( "*********************************" )
        CentrarTexto( "* 1. Jugador vs. Máquina        *" )
        CentrarTexto( "* 2. Modo Apuestas (2 Jugadores)*" )
        CentrarTexto( "* 3. Volver al menú principal   *" )
        CentrarTexto( "*********************************" )
        Leer opcion_menu
		
        Segun opcion_menu Hacer
            1:
                EjecutarTandaPenales(1)
            2:
                EjecutarModoApuestas(0)
            3:
                // No hace nada
            De Otro Modo:
                Escribir "Opción no válida."
                Esperar 1 Segundos
        FinSegun
    Hasta Que opcion_menu = 3
Fin Funcion

// =============================================================================
// FUNCIÓN #4: AUXILIAR PARA CENTRAR TEXTO EN LA PANTALLA
// =============================================================================
Funcion CentrarTexto(texto_a_centrar)
    // Asumimos un ancho de pantalla estándar de 80 caracteres
    Definir ANCHO_PANTALLA Como Entero
    ANCHO_PANTALLA <- 130
	
    Definir largo_texto, espacios_margen, i Como Entero
    Definir margen Como Caracter
	
    largo_texto <- Longitud(texto_a_centrar)
    espacios_margen <- trunc((ANCHO_PANTALLA - largo_texto) / 2)
	
    margen <- ""
    Para i <- 1 Hasta espacios_margen Hacer
        margen <- margen + " "
    FinPara
	
    Escribir margen, texto_a_centrar
Fin Funcion
// =============================================================================
// FUNCIÓN #4: PARA CENTRAR LEER OPCION
// =============================================================================
Funcion   LeerCentrado(opc Por Referencia)
    Definir ancho_consola, espacios, i Como Entero
    ancho_consola <- 80  // ancho total de la "pantalla" virtual
    espacios <- (ancho_consola - Longitud(mensaje)) / 2
	
    Para i <- 1 Hasta espacios Hacer
        Escribir Sin Saltar " "
    FinPara
	
    Escribir Sin Saltar ""
    Leer opc
	
FinFuncion

// =============================================================================
// FUNCIÓN #5: INSERTAR NUMERO VALIDO
// =============================================================================
Funcion ObtenerDigitoValido(dummy)
    Definir entrada Como Cadena
    Definir digito, DigitoValido Como Entero
	
    Mientras Verdadero Hacer
        Escribir ""
        Escribir "Elegí una posición (0-9):"
        Leer entrada
		
        Si Longitud(entrada) = 1 Y (entrada >= "0" Y entrada <= "9") Entonces
            digito <- ConvertirANumero(entrada)
            DigitoValido <- digito   // << esto devuelve el valor
		SiNo
			Escribir "Entrada inválida. Debes ingresar un número del 0 al 9."
		FinSi
	FinMientras
FinFuncion

// =============================================================================
// ALGORITMO PRINCIPAL - MENÚ DEL VIDEOJUEGO
// =============================================================================
Algoritmo VideojuegoUTN
    Definir opcion Como Entero
    Repetir
		Limpiar Pantalla
		
        // --- CENTRADO VERTICAL ---
        // Imprime 5 líneas en blanco para bajar el menú
        Para i <- 1 Hasta 5 Hacer
            Escribir ""
        FinPara
		
        // --- CENTRADO HORIZONTAL ---
        // Con esta función centramos cada línea del menú
        CentrarTexto("*********************************************")
        CentrarTexto("* *")
        CentrarTexto("*           SALA DE JUEGOS - UTN            *")
        CentrarTexto("* *")
        CentrarTexto("*********************************************")
        CentrarTexto("* *")
        CentrarTexto("* 1. Jugar Tanda de Penales                 *")
        CentrarTexto("* 2. Jugar Tenis (Próximamente)             *")
        CentrarTexto("* 3. Salir del Juego                        *")
        CentrarTexto("* *")
        CentrarTexto("*********************************************")
        Escribir "" // Un espacio extra antes de la petición de entrada
        CentrarTexto(" Seleccione una opción y presione Enter:      ")
        
		Leer opcion
        // La lectura de la opción la dejamos sin centrar para que el cursor quede a la izquierda
        //Leer opcion;
		
        Segun opcion Hacer
            1:
                MenuPenales(0)
            2:
                Limpiar Pantalla
                Escribir "El juego de Tenis está en desarrollo :O. ¡Vuelve pronto!"
                Esperar 2 Segundos
            3:
                Escribir "¡Gracias por jugar!"
            De Otro Modo:
                Escribir "Opción no válida."
                Esperar 1 Segundos
        FinSegun
    Hasta Que opcion = 3
FinAlgoritmo
