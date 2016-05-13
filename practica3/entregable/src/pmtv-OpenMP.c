#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
    #define omp_get_num_threads() 1
    #define omp_set_num_threads(int)
    #define omp_in_parallel() 0
    #define omp_set_dynamic(int)
#endif

int main(int argc, char **argv)
{
    int i, j, debug=0;

    //Leer argumento de entrada
    if(argc < 2)
    {
        fprintf(stderr, "Falta size [opctional debug]\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

    if(argc == 3)
        debug = atoi(argv[2]);


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

    if (debug==1)
    {
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
    }

    double start, end, total;
    start = omp_get_wtime();


    // Obtenemos los resaultados

    // Usamos runtime para poder variarlo luego con la variable OMP_SCHEDULE
    #pragma omp parallel for private(j) schedule(runtime)
    for (i=0; i<N; i++)
        for (j=i; j<N; j++)
            result[i] += matrix[i][j] * vector[j];

    end = omp_get_wtime();
    total = end - start;

    if (debug==1)
    {
        // Pintamos los resultados
        printf("Resultado:\n");
        for (i=0; i<N; i++)
            printf("%d ", result[i]);
        printf("\n");
    }

    printf("Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n",total,result[0],result[N-1]);

    // Liberamos la memoria
    for (i=0; i<N; i++)
        free(matrix[i]);
    free(matrix);
    free(vector);
    free(result);

    return 0;
}