#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv)
{
    int i, j;

    //Leer argumento de entrada
    if(argc < 2)
    {
        fprintf(stderr, "Falta size\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

    // Inicializamos la matriz triangular (superior)
    int *vector, *result, **matrix;
    vector = (int *) malloc(N*sizeof(int)); // malloc necesita el tamaño en bytes
    result = (int *) malloc(N*sizeof(int)); //si no hay espacio suficiente malloc devuelve NULL
    matrix = (int **) malloc(N*sizeof(int*));

    for (i=0; i<N; i++)
        matrix[i] = (int*) malloc(N*sizeof(int));

    for (i=0; i<N; i++)
    {
        for (j=i; j<N; j++)
            matrix[i][j] = 2;
        vector[i] = 4;
        result[i]=0;
    }

    // Pintamos la matriz
    printf("Matriz:\n");
    for (i=0; i<N; i++)
    {
        for (j=0; j<N; j++)
        {
            if (j >= i)
                printf("%d ", matrix[i][j]);
            else
                printf("0 ");
        }
        printf("\n");
    }

    // Pintamos el vector
    printf("Vector:\n");
    for (i=0; i<N; i++)
        printf("%d ", vector[i]);
    printf("\n");

    // Obtenemos los resaultados
    for (i=0; i<N; i++)
        for (j=i; j<N; j++)
            result[i] += matrix[i][j] * vector[j];

    // Pintamos los resultados
    printf("Resultado:\n");
    for (i=0; i<N; i++)
        printf("%d ", result[i]);
    printf("\n");

    // Liberamos la memoria
    for (i=0; i<N; i++)
        free(matrix[i]);
    free(matrix);
    free(vector);
    free(result);

    return 0;
}