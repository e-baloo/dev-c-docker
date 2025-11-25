#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    printf("Bienvenue dans votre environnement de développement C!\n");
    printf("GCC version: %s\n", __VERSION__);
    
    // peux tu l'afichier la taille d'un long int en octets et en bits
    printf("Taille d'un long int: %zu octets\n", sizeof(long int));
    printf("Taille d'un long int: %zu bits\n", sizeof(long int) * 8);

    return EXIT_SUCCESS;
}
