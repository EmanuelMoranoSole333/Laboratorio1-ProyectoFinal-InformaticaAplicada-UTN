// =============================================================================
// FUNCI�N #1: RESULTADO DEL PENAL
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

    Si esGol Entonces
        CentrarTexto("��� G O O O O O L !!!")
    Sino
        CentrarTexto("��� ATAJO EL ARQUERO !!!")
    FinSi
	
    Escribir ""
    CentrarTexto("Presiona Enter para continuar...")
	Escribir ""
    Esperar Tecla
	
Fin Funcion

// =============================================================================
// FUNCI�N #2: EJECUTA LA TANDA DE PENALES JUGADOR VS MAQUINA
// =============================================================================
Funcion EjecutarTandaPenales(modo_de_juego, dificultad)
    Definir goles_j1, goles_j2, ronda, tiro, atajada Como Entero
	//Definir tiro_texto como Cadena
    Definir partida_abandonada Como Logico
    Definir nombre_j1, nombre_j2, tiro_texto, atajada_texto Como Caracter
	
	//NOMBRE
	Limpiar Pantalla
	Para i<-1 Hasta 5 Con Paso 1 Hacer
		Escribir ""
	Fin Para
	
	CentrarTexto("Ingrese el nombre del Jugador 1:")
	Leer nombre_j1
	
    Si modo_de_juego = 1 Entonces
        nombre_j2 <- "Maquina"
    Sino
        CentrarTexto("Ingrese el nombre del Jugador 2:")
		Leer nombre_j2
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
			//
            Leer tiro_texto
			
			Si (tiro_texto <> "0" Y tiro_texto <> "1" Y tiro_texto <> "2" Y tiro_texto <> "3" Y tiro_texto <> "4" Y tiro_texto <> "5" Y tiro_texto <> "6" Y tiro_texto <> "7" Y tiro_texto <> "8" Y tiro_texto <> "9") Entonces
                CentrarTexto("Opcion no valida : Debes ingresar un NUMERO entre 0 y 9.")
                Esperar 1.5 Segundos
                Limpiar Pantalla // borramos
                Para i<-1 Hasta 5 Con Paso 1 Hacer
                    Escribir ""
                Fin Para
                CentrarTexto("****************************************************")
                CentrarTexto("RONDA "+ ConvertirATexto(ronda)+ " de 5")
                CentrarTexto("MARCADOR: "+ nombre_j1+ " "+ ConvertirATexto(goles_j1)+ " - "+ nombre_j2+ " "+ ConvertirATexto(goles_j2))
                CentrarTexto("****************************************************")
                Escribir ""
                CentrarTexto(">>> PATEA "+ nombre_j1+ " <<<")
            FinSi
			
        Hasta Que (tiro_texto = "0" O tiro_texto = "1" O tiro_texto = "2" O tiro_texto = "3" O tiro_texto = "4" O tiro_texto = "5" O tiro_texto = "6" O tiro_texto = "7" O tiro_texto = "8" O tiro_texto = "9")
		tiro <- ConvertirANumero(tiro_texto)
		
        Si tiro = 0 Entonces
            partida_abandonada <- Verdadero
        Sino
            CentrarTexto(">>> ATAJA "+ nombre_j2+ " <<<")
			Si modo_de_juego = 1 Entonces // 
				Segun dificultad Hacer
					1: // F�cil
						CentrarTexto("La Maquina (Novato) elige su posicion...")
						Si Azar(10) < 7 Entonces // 70% de probabilidad de errar
							Repetir
								atajada <- Azar(9) + 1
							Hasta Que atajada <> tiro // Elige un lugar que NO sea el tuyo
						Sino
							atajada <- Azar(9) + 1; // 30% de un tiro al azar normal
						FinSi
					2: // Intermedio
						CentrarTexto("La Maquina elige su posicion...");
						atajada <- Azar(9) + 1 // 100% al azar, como estaba antes
					3: // Dif�cil
						CentrarTexto("La Maquina (Pro) elige su posicion...")
						Si Azar(10) < 4 Entonces // 40% de probabilidad de "adivinar" tu tiro
							atajada <- tiro // 
						Sino
							atajada <- Azar(9) + 1 // 60% de un tiro al azar normal
						FinSi
				FinSegun
				Esperar 1 Segundos
			Sino // Si es modo 2 (jugador)
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
            
            // Turno del jugador 2 / m�quina
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
				
                CentrarTexto(">>> PATEA " + nombre_j2 + " <<<")
                Si modo_de_juego = 1 Entonces
                    tiro <- Azar(9) + 1
                    CentrarTexto("La Maquina elige su disparo...")
                    Esperar 1 Segundos
                Sino
                    Repetir
                        CentrarTexto("Elige una zona para disparar (1-9):")
                        Leer tiro
                    Hasta Que tiro >= 1 Y tiro <= 9
                FinSi
                
                CentrarTexto(">>> ATAJA " + nombre_j1 + " <<<")
                Repetir
                    CentrarTexto("Elige una zona para atajar (1-9) o (0 para salir):")
					Leer atajada_texto
                    //Leer atajada
					Si (atajada_texto <> "0" Y atajada_texto <> "1" Y atajada_texto <> "2" Y atajada_texto <> "3" Y atajada_texto <> "4" Y atajada_texto <> "5" Y atajada_texto <> "6" Y atajada_texto <> "7" Y atajada_texto <> "8" Y atajada_texto <> "9") Entonces
						CentrarTexto("Error: Debes ingresar un NUMERO entre 0 y 9.")
						Esperar 1.5 Segundos
						Limpiar Pantalla // Volvemos a dibujar la pantalla
						Para i <-1 Hasta 5 Con Paso 1 Hacer
							Escribir " "
						Fin Para
						CentrarTexto("****************************************************")
						CentrarTexto("RONDA " + ConvertirATexto(ronda) + " de 5")
						CentrarTexto("MARCADOR: "+ nombre_j1+ " "+ ConvertirATexto(goles_j1)+ " - "+ nombre_j2+ " "+ ConvertirATexto(goles_j2))
						CentrarTexto("****************************************************")
						Escribir ""
						CentrarTexto(">>> PATEA " + nombre_j2 + " <<<")
						CentrarTexto(">>> ATAJA " + nombre_j1 + " <<<")
					FinSi
                Hasta Que (atajada_texto = "0" O atajada_texto = "1" O atajada_texto = "2" O atajada_texto = "3" O atajada_texto = "4" O atajada_texto = "5" O atajada_texto = "6" O atajada_texto = "7" O atajada_texto = "8" O atajada_texto = "9")
                
				atajada <- ConvertirANumero(atajada_texto)
				
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
		Para i<-1 Hasta 5 Con Paso 1 Hacer
			Escribir ""
		Fin Para
        CentrarTexto("=============================================")
        CentrarTexto("||       HAS ABANDONADO LA PARTIDA         ||")
        CentrarTexto("=============================================")
    Sino
		Para i<-1 Hasta 5 Con Paso 1 Hacer
			Escribir ""
		Fin Para
        CentrarTexto("=============================================")
        CentrarTexto("||            FIN DEL PARTIDO              ||")
        CentrarTexto("=============================================")
        CentrarTexto("Marcador final: "+ nombre_j1+ " "+ ConvertirATexto(goles_j1)+ " - "+ nombre_j2+ " "+ ConvertirATexto(goles_j2))
        Escribir ""
        Si goles_j1 > goles_j2 Entonces
            CentrarTexto("��� GANA "+ nombre_j1+ " !!!")
		Sino
			Si goles_j2 > goles_j1 Entonces
				CentrarTexto("��� GANA "+ nombre_j2+ " !!!")
			Sino
				CentrarTexto("�El resultado es un EMPATE!")
			FinSi
			
        FinSi
    FinSi
    Escribir ""
    CentrarTexto("Presiona Enter para volver al men� principal...")
    Esperar Tecla
Fin Funcion
// =============================================================================
// FUNCI�N #3: MODO APUESTAS
// =============================================================================
Funcion EjecutarModoApuestas(dummy)
	Definir puntos_j1, puntos_j2, ronda, apuesta_j1, apuesta_j2, tiro_cpu, atajada_cpu Como Entero
	Definir VALOR_APUESTA Como Entero
	Definir resultado_fue_gol Como Entero
	Definir nombre_j1, nombre_j2,apuesta_j1_texto, apuesta_j2_texto Como Caracter
	Definir i Como Entero
	//PEDIR NOMBRES
	Limpiar Pantalla
	Para i<-1 Hasta 5 Con Paso 1 Hacer
		Escribir ""
	Fin Para
	CentrarTexto("--- MODO APUESTAS ---")
	CentrarTexto("Ingrese nombre del jugador 1:")
	Leer nombre_j1
	CentrarTexto("Ingrese nombre del jugador 2:")
	Leer nombre_j2
	
	puntos_j1 <- 0
	puntos_j2 <- 0
	VALOR_APUESTA <- 10
	ronda <- 1
	
	Mientras  ronda <= 5 Hacer
		Limpiar Pantalla
		Para i <- 1 Hasta 5 Hacer
			Escribir ""
		FinPara
		CentrarTexto("****************************************************")
        CentrarTexto("RONDA DE APUESTAS "+ ConvertirATexto(ronda)+ " de 5")
        CentrarTexto("PUNTAJE: "+ nombre_j1+" [" + ConvertirATexto(puntos_j1)+ "] - "+ nombre_j2 +" ["+ ConvertirATexto(puntos_j2)+ "]")
        CentrarTexto("****************************************************")
        Escribir ""
	//FinMientras
	
	// APUESTA JUGADOR 1
	CentrarTexto(">>> TURNO DE APUESTA: "+ nombre_j1+" <<<")
	Repetir
		CentrarTexto("�Que crees que pasara? (1: GOL, 2: ATAJADA)")
		Leer apuesta_j1_texto

		Si apuesta_j1_texto <> "1" Y apuesta_j1_texto <> "2" Entonces
			CentrarTexto("Opcion invalida. Elige 1 o 2.")
			Esperar 1 Segundos
			// Volver a dibujar la pantalla para que se vea limpia
			Limpiar Pantalla;
			Para i <- 1 Hasta 5 Hacer
				Escribir ""
			FinPara
			CentrarTexto("****************************************************")
			CentrarTexto("RONDA DE APUESTAS " + ConvertirATexto(ronda) + " de 5")
			CentrarTexto("PUNTAJE: "+ nombre_j1+" [" + ConvertirATexto(puntos_j1) + "] - "+nombre_j2+" [" + ConvertirATexto(puntos_j2) + "]")
			CentrarTexto("****************************************************")
			Escribir ""
			CentrarTexto(">>> TURNO DE APUESTA: "+nombre_j1+" <<<")
		FinSi
	Hasta Que apuesta_j1_texto = "1" O apuesta_j1_texto = "2"
	apuesta_j1 <- ConvertirANumero(apuesta_j1_texto)
	Limpiar Pantalla // Oculta la apuesta del J1
	
	// APUESTA JUGADOR 2
	Para i <- 1 Hasta 5 Hacer
		Escribir ""
	FinPara
	CentrarTexto("****************************************************")
	CentrarTexto("RONDA DE APUESTAS " + ConvertirATexto(ronda) + " de 5")
	CentrarTexto("PUNTAJE: "+ nombre_j1+" [" + ConvertirATexto(puntos_j1) + "] - "+ nombre_j2+" [" + ConvertirATexto(puntos_j2) + "]")
	CentrarTexto("****************************************************")
	Escribir ""
	CentrarTexto(">>> TURNO DE APUESTA: "+nombre_j2+" <<<")
	Repetir
		CentrarTexto("�Que crees que pasara? (1: GOL, 2: ATAJADA)")
		Leer apuesta_j2_texto
		Si apuesta_j2_texto <> "1" Y apuesta_j2_texto <> "2" Entonces
			CentrarTexto("Opcion invalida. Elige 1 o 2.")
			Esperar 1 Segundos
			// Volver a dibujar la pantalla para que se vea limpia
			Limpiar Pantalla
			Para i <- 1 Hasta 5 Hacer
				Escribir ""
			FinPara
			CentrarTexto("****************************************************")
			CentrarTexto("RONDA DE APUESTAS "+ ConvertirATexto(ronda)+ " de 5")
			CentrarTexto("PUNTAJE: "+ nombre_j1+" ["+ ConvertirATexto(puntos_j1)+ "] - "+ nombre_j2+" ["+ ConvertirATexto(puntos_j2)+ "]")
			CentrarTexto("****************************************************")
			Escribir ""
			CentrarTexto(">>> TURNO DE APUESTA: "+ nombre_j2+" <<<")
		FinSi
	Hasta Que apuesta_j2_texto = "1" O apuesta_j2_texto = "2"
	apuesta_j2 <- ConvertirANumero(apuesta_j2_texto)
	Escribir ""
	CentrarTexto("Ambas apuestas registradas. �Veamos el penal!")
	Esperar 2 Segundos
	
	// SIMULACI�N Y RESULTADO
	tiro_cpu <- Azar(9) + 1
	atajada_cpu <- Azar(9) + 1
	Si tiro_cpu <> atajada_cpu Entonces
		resultado_fue_gol <- 1 // hizo gol
	Sino
		resultado_fue_gol <- 0 // No hizo gol, fue atajada
	FinSi
	
	DibujarResultado(tiro_cpu, atajada_cpu, resultado_fue_gol =1)
	
	// PAGO DE APUESTAS
	Si (resultado_fue_gol = 1 Y apuesta_j1 = 1) O (resultado_fue_gol = 0 Y apuesta_j1 = 2) Entonces
		CentrarTexto(nombre_j1+": �Acertaste! Ganas "+ ConvertirATexto(VALOR_APUESTA) + " puntos.")
		puntos_j1 <- puntos_j1 + VALOR_APUESTA
	Sino
		CentrarTexto(nombre_j1+": �Fallaste! No ganaste puntos.")
		puntos_j1 <- puntos_j1 //- VALOR_APUESTA
	FinSi
	
	Si (resultado_fue_gol = 1 Y apuesta_j2 = 1) O (resultado_fue_gol = 0 Y apuesta_j2 = 2) Entonces
		CentrarTexto(nombre_j2+": �Acertaste! Ganas "+ ConvertirATexto(VALOR_APUESTA)+ " puntos.")
		puntos_j2 <- puntos_j2 + VALOR_APUESTA
	Sino
		CentrarTexto(nombre_j2+": �Fallaste! No ganaste puntos.")
		puntos_j2 <- puntos_j2 //- VALOR_APUESTA
	FinSi
	
	ronda <- ronda + 1
	Escribir ""
	CentrarTexto("Presiona Enter para la siguiente ronda...")
	Esperar Tecla
	FinMientras
	
	Limpiar Pantalla
	Para i<-1 Hasta 5 Hacer
		Escribir ""
	FinPara
	CentrarTexto("=============================================")
	CentrarTexto("||        FIN DEL JUEGO DE APUESTAS        ||")
	CentrarTexto("=============================================")
	CentrarTexto("Puntaje final:")
	CentrarTexto(nombre_j1 + ": " + ConvertirATexto(puntos_j1) + " puntos.")
	CentrarTexto(nombre_j2 + ": " + ConvertirATexto(puntos_j2) + " puntos.")
	Escribir ""
	Si puntos_j1 > puntos_j2 Entonces
		CentrarTexto("��� GANA " + nombre_j1 + " !!!")
	Sino Si puntos_j2 > puntos_j1 Entonces
			CentrarTexto("��� GANA " + nombre_j2 + " !!!")
		Sino
			CentrarTexto("�El resultado es un EMPATE!")
		FinSi
		
	FinSi
	
	Escribir ""
	CentrarTexto("Presiona Enter para volver al menu principal...")
	Esperar Tecla
FinFuncion
// =============================================================================
// FUNCI�N #4: MUESTRA EL MEN� DEL JUEGO DE PENALES
// =============================================================================
Funcion MenuPenales(dummy)
    Definir i,dificultad_elegida Como Entero
	Definir opcion_menu como Cadena
    Repetir
        Limpiar Pantalla
		
        // --- CENTRADO VERTICAL ---
        // Imprime 5 l�neas en blanco para bajar el men�
        Para i <- 1 Hasta 5 Hacer
            Escribir ""
        FinPara
		//Menu
        CentrarTexto( "*********************************" )
        CentrarTexto( "*     MODOS DE JUEGO PENALES    *" )
        CentrarTexto( "*********************************" )
        CentrarTexto( "* 1. Jugador vs. Maquina        *" )
        CentrarTexto( "* 2. Modo Apuestas (2 Jugadores)*" )
        CentrarTexto( "* 3. Volver al menu principal   *" )
        CentrarTexto( "*********************************" )
        Leer opcion_menu
		
        Segun opcion_menu Hacer
            "1":
				dificultad_elegida <- MenuDificultad(0)
				EjecutarTandaPenales(1, dificultad_elegida)
            "2":
                EjecutarModoApuestas(0)
            "3":
                // No hace nada
            De Otro Modo:
                Escribir "Opcion no valida."
                Esperar 1 Segundos
        FinSegun
    Hasta Que opcion_menu = "3"
Fin Funcion

// =============================================================================
// FUNCI�N #5: AUXILIAR PARA CENTRAR TEXTO EN LA PANTALLA
// =============================================================================
Funcion CentrarTexto(texto_a_centrar)
    // Asumimos un ancho de pantalla est�ndar de 80 caracteres
    Definir ANCHO_PANTALLA Como Entero
    ANCHO_PANTALLA <- 135
	
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
// FUNCI�N #6: PARA CENTRAR LEER OPCION
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
// FUNCI�N #7: INSERTAR NUMERO VALIDO
// =============================================================================
Funcion ObtenerDigitoValido(dummy)
    Definir entrada Como Cadena
    Definir digito, DigitoValido Como Entero
	
    Mientras Verdadero Hacer
        Escribir ""
        Escribir "Elegi una posicion (0-9):"
        Leer entrada
		
        Si Longitud(entrada) = 1 Y (entrada >= "0" Y entrada <= "9") Entonces
            digito <- ConvertirANumero(entrada)
            DigitoValido <- digito   // << esto devuelve el valor
		SiNo
			Escribir "Entrada invalida. Debes ingresar un numero del 0 al 9."
		FinSi
	FinMientras
FinFuncion
// =============================================================================
// FUNCI�N #8: SELECCION DE DIFICULTAD
// =============================================================================
Funcion dificultad <- MenuDificultad(dummy)
    Definir opcion_dificultad, i Como Entero
	Definir opcion_dificultad_texto Como Cadena // esto lo hacemos a prueba de errores del usuario
	
    Repetir
        Limpiar Pantalla
        Para i <- 1 Hasta 5 Hacer
            Escribir ""
        FinPara
        
        CentrarTexto("*********************************")
        CentrarTexto("*    SELECCIONA LA DIFICULTAD   *")
        CentrarTexto("*********************************")
        CentrarTexto("* 1. Facil (Arquero novato)     *")
        CentrarTexto("* 2. Intermedio (Suerte pura)   *")
        CentrarTexto("* 3. Dificil (Arquero pro)      *")
        CentrarTexto("*********************************")
        Leer opcion_dificultad_texto
        //leemos todo en texto 
		Si opcion_dificultad_texto <> "1" Y opcion_dificultad_texto <> "2" Y opcion_dificultad_texto <> "3" Entonces
            CentrarTexto("Opcion no valida. Elige 1, 2 o 3.")
            Esperar 1.5 Segundos
        FinSi
		
	Hasta Que opcion_dificultad_texto = "1" O opcion_dificultad_texto = "2" O opcion_dificultad_texto = "3"
	//elige la opci�n correcta y lo pasamos a numero y se lo asignamos a dificultad
	opcion_dificultad <- ConvertirANumero(opcion_dificultad_texto)
    dificultad <- opcion_dificultad
Fin Funcion
// =============================================================================
// ALGORITMO PRINCIPAL - MEN� DEL VIDEOJUEGO
// =============================================================================
Algoritmo Golazo
	Definir opcion_texto Como Cadena  // leemos todo en formato texto, es la mejor para evitar que el programa crashee, si el usuario coloca una letra en ves de numero.
    Definir i Como Entero             
    Repetir
		Limpiar Pantalla
		
        // --- CENTRADO VERTICAL ---
        // Imprime 5 l�neas en blanco para bajar el men�
        Para i <- 1 Hasta 5 Hacer
            Escribir ""
        FinPara
		
        // --- CENTRADO HORIZONTAL ---
        // Con esta funci�n centramos cada l�nea del men�
        CentrarTexto("*********************************************")
        CentrarTexto("* *")
        CentrarTexto("*                  GOLAZO!                  *")
        CentrarTexto("* *")
        CentrarTexto("*********************************************")
        CentrarTexto("* *")
        CentrarTexto("* 1. Jugar Tanda de Penales                 *")
        CentrarTexto("* 2. Jugar Tenis (Proximamente)             *")
        CentrarTexto("* 3. Salir del Juego                        *")
        CentrarTexto("* *")
        CentrarTexto("*********************************************")
        Escribir "" // Un espacio extra antes de la petici�n de entrada
        CentrarTexto(" Seleccione una opcion y presione Enter:     ")
        
		Leer opcion_texto
        // La lectura de la opci�n la dejamos sin centrar para que el cursor quede a la izquierda
		
        Segun opcion_texto Hacer
            "1":
                MenuPenales(0)
            "2":
                Limpiar Pantalla
				CentrarTexto("El juego de Tenis esta en desarrollo :O. �Vuelve pronto!")
                //Escribir "El juego de Tenis est� en desarrollo :O. �Vuelve pronto!"
                Esperar 2 Segundos
            "3":
				CentrarTexto("�Gracias por jugar!")
                //Escribir "�Gracias por jugar!"
            De Otro Modo:
				CentrarTexto("Opcion no valida.")
                //Escribir "Opci�n no v�lida."
                Esperar 1 Segundos
        FinSegun
    Hasta Que opcion_texto = "3"
FinAlgoritmo
