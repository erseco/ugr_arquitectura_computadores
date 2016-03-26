/* sections.c

gcc -fopenmp -O2 sections.c -o sections
gcc-4.9 -fopenmp -O2 sections.c -o sections

Para ejecutar use: sections numero-iteracciones
*/

#include <stdio.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
	#define omp_get_num_threads() 1
#endif

void funcA()
{
	printf("En funcA: esta sección la ejecuta el thread %d\n", omp_get_thread_num());
}
void funcB()
{
	printf("En funcB: esta sección la ejecuta el thread %d\n", omp_get_thread_num());
}

main()
{
	#pragma omp parallel sections
	{
		#pragma omp section
		(void) funcA();

		#pragma omp section
		(void) funcB();
	}
}