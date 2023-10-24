/*
 * Nombre del Archivo: main.c
 * Autor:   [Valdez Medina Victorio Giovanni]
 * Correo:  [l20211851@tectijuana.edu.mx]
 * Fecha:   [24/10/2023]
 * Curso:   Lenguajes de Interfaz, TECNM Campus ITT
 * 
 * Objetivo:
 * Este programa está diseñado para imprimir un hola mundo en consola.
 *
 * Historial de Revisiones:
 * [24/10/23]        [Valdez Medina Victorio Giovanni] - Creado
 * 
 */

#include <stdio.h>
#include "pico/stdlib.h"
#include "pico/cyw43_arch.h"

int main() {
  stdio_init_all();
  while (true) {
    printf("Hola mundo!\n");
    sleep_ms(250);
  }
}
