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
	int i, n = 7;
	int a[n], suma;

	for (i=0; i<n; i++)
		a[i] = i;

	#pragma omp parallel private(suma)
	{
		suma=0;
		#pragma omp for
		for (i=0; i<n; i++)
		{
			suma = suma + a[i];
			printf("thread %d suma a[%d]", omp_get_thread_num(), i);
		}
		printf("\n* thread %d suma= %d", omp_get_thread_num(), suma);
	}
	printf("\n");
}