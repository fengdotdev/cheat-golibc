
#include <stdio.h>
#include <stdlib.h>
#include "libc/libecho.h"

int main() {

    echos(); // Llamar a la función echos
   // echob(); // Llamar a la función echob

    return 0;
}

int echos(){
        char* input = "hola mundo"; // Declara input como char*, no char*[]
    char* result = EchoString(input);
    printf("Entrada: %s, Salida: %s\n", input, result);
    return 1; // Retorna 1 para indicar éxito

}



int echob(){
    // Crear un buffer dinámico
    const char* data = "Hola, mundo!";
    int inputSize = strlen(data) + 1;
    char* input = (char*)malloc(inputSize);
    if (input == NULL) {
        printf("Error: No se pudo allocar memoria\n");
        return 1;
    }
    strcpy(input, data);

    // Crear un puntero para el tamaño de salida
    int outputSize;

    // Llamar a EchoBytes
    void* result = EchoBytes((void*)input, inputSize, &outputSize);
    if (result == NULL) {
        printf("Error: EchoBytes devolvió NULL\n");
        free(input);
        return 1;
    }

    // Imprimir resultados
    char* output = (char*)result;
    printf("Entrada: %s\n", input);
    printf("Salida: %s\n", output);
    printf("Tamaño de salida: %d\n", outputSize);

    // Liberar memoria
    free(input);   // Liberar el buffer de entrada
    free(result);  // Liberar el buffer de salida

    return  1;
}