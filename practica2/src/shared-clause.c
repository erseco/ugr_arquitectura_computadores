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
	int a[n];

	for (i=0; i<n; i++)
		a[i] = i+1;

	#pragma omp parallel for shared(a)
	for (i=0; i<n; i++)
		a[i] += i;

	printf("Después de parallel for:\n");
	for (i=0; i<n; i++)
		printf("a[%d] = %d\n",i,a[i]);
}