/* single.c

gcc -fopenmp -O2 single.c -o single
gcc-4.9 -fopenmp -O2 single.c -o single

Para ejecutar use: single numero-iteracciones
*/

#include <stdio.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
	#define omp_get_num_threads() 1
#endif

main()
{
	int n = 9, i, a, b[n];

	for (i=0; i<n; i++)
		b[i] = -1;

	#pragma omp parallel
	{
		#pragma omp single
		{
			printf("Introduce valor de inicialización a: ");
			scanf("%d", &a );
			printf("Single ejecutada por el thread %d\n", omp_get_thread_num());
		}

		#pragma omp for
		for (i=0; i<n; i++)
			b[i] = a;

		#pragma omp single
		{
			printf("Resultados:\n");
			for (i=0; i<n; i++)
				printf("b[%d] = %d\t",i,b[i]);
			printf("\n");
			printf("Single ejecutada por el thread %d\n", omp_get_thread_num());
		}
	}

}