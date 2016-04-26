#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
	#define omp_get_num_threads() 1
#endif

int main(int argc, char **argv)
{
	int n=9,i, b[n];

	for (i=0; i<n; i++)
		b[i] = -1;

	#pragma omp parallel
	{
		int a;

		#pragma omp single copyprivate(a)
		{
			printf("\nIntroduce valor de inicialización a: ");
			scanf("%d", &a );
			printf("\nSingle ejecutada por el thread %d\n", omp_get_thread_num());
		}

		#pragma omp for
		for (i=0; i<n; i++)
			b[i] = a;
	}
	printf("Depués de la región parallel:\n");
	for (i=0; i<n; i++)
		printf("b[%d] = %d\t",i,b[i]);
	printf("\n");
}