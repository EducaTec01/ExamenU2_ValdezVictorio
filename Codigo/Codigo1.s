@  
@  Title: Examen recueperacion U2  
@  Filename: Codigo1.s
@  Autor: Victorio Giovanni Valdez Medina
@  Date: 01-11-2023
@  Description :  programa que encuentre la suma de todos los enteros del 2 al 2000
@  Imput: -
@  Ouput: La suma de los enteros de 2 a 2000 es:
@  
@------------------------------------
@   HIGH LEVEL LANGUAGE
@------------------------------------
@    #include <stdio.h>
@    
@    int main() {
@        int sum = 0;
@        for (int i = 2; i <= 2000; i++) {
@            sum += i;
@        }
@        printf("La suma de los enteros de 2 a 2000 es: %d\n", sum);
@        return 0;
@   }

@ Codigo1.s es un programa que se encanrga de calcular la suma de los enteros del 2 al 2000

@------------------------------------
@   DATA SECTION   
@------------------------------------
@ Esta sección es donde se declaran y se inicializan las variables y los datos que se usarán en el programa.

.data
    str_format:
        .asciz "La suma de los enteros de 2 a 2000 es: %d\n"
    .balign 4
sum: 
    .word 0

.text
.global _start

@------------------------------------
@   CODE SECTION   
@------------------------------------
@ Esta sección contiene el código ejecutable del programa.

_start:
    mov r1, #2          @ Inicializamos r1 con 2 (el primer número)
    mov r2, #2000       @ Establecemos r2 con 2000 (límite superior)
    mov r0, #0          @ Inicializamos r0 para almacenar la suma

loop:
    add r0, r0, r1      @ Sumamos r0 con el valor actual de r1
    add r1, r1, #1      @ Incrementamos r1 en 1
 
    cmp r1, r2          @ Comparamos r1 con r2
    ble loop            @ Si r1 <= r2, saltamos de nuevo a 'loop'

    ldr r1, =str_format @ Cargamos la dirección de la cadena de formato en r1
    mov r2, r0          @ Movemos el valor de la suma a r2
    bl printf           @ Llamamos a la función printf

    mov r7, #1          @ Llamamos a la función de salida (exit)
    swi 0

@-------------------------------------
@   MAKEFILE  
@-------------------------------------
@  Esta sección compila y conecta visual Studio Code con la extensión CMAKE o manualmente en powerShell, Linux Terminal
@  NOTA: makefile es un lenguaje y le gustan los TABS (no espacion en identaciones)
@
@  # Makefile para compilar el programa en ensamblador ARM
@  
@  # Compilador y enlazador
@  AS = as
@  LD = ld
@  
@  # Opciones del compilador
@  ASFLAGS = -g
@  LDFLAGS = -e _start
@  
@  # Nombre del archivo de salida
@  OUTPUT = suma_enteros
@  
@  # Objetivos por defecto
@  all: $(OUTPUT)
@  
@  # Regla para ensamblar el código
@  $(OUTPUT): suma_enteros.o
@      $(LD) $(LDFLAGS) -o $@ $^
@  
@  # Regla para ensamblar el código fuente
@  suma_enteros.o: suma_enteros.s
@      $(AS) $(ASFLAGS) -o $@ $<
@  
@  # Regla para limpiar archivos generados
@  clean:
@      rm -f $(OUTPUT) suma_enteros.o
@  
@  .PHONY: all clean
