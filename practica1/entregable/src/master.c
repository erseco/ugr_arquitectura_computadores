/* master.c

gcc -fopenmp -O2 master.c -o master
gcc-4.9 -fopenmp -O2 master.c -o master

Para ejecutar use: master numero-iteracciones
*/

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
	int i, n=20, tid, a[n],suma=0,sumalocal;
	if(argc < 2)
	{
		fprintf(stderr,"\nFalta iteraciones\n");
		exit(-1);
	}

	n = atoi(argv[1]);
	if (n>20)
		n=20;
	for (i=0; i<n; i++)
		a[i] = i;


	#pragma omp parallel private(sumalocal,tid)
	{
		sumalocal=0;
		tid=omp_get_thread_num();

		#pragma omp for schedule(static)
		for (i=0; i<n; i++)
		{
			sumalocal += a[i];
			printf(" thread %d suma de a[%d]=%d sumalocal=%d \n", tid,i,a[i],sumalocal);
		}
		#pragma omp atomic
		suma += sumalocal;

		#pragma omp barrier
		#pragma omp master

		printf("thread master=%d imprime suma=%d\n", tid,suma);
	}


}