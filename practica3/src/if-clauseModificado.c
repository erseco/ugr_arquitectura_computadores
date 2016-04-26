#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
	#define omp_get_num_threads() 1
	#define omp_set_num_threads(int)
#endif

int main(int argc, char **argv)
{

	int i, n=20, tid, x;
	int a[n], suma=0,sumalocal;

	if(argc < 2)
	{
		fprintf(stderr,"[ERROR]-Falta iteraciones\n");
		exit(-1);
	}
	if(argc < 3)
	{
		fprintf(stderr,"[ERROR]-Falta numero threads \n");
		exit(-1);
	}

	n = atoi(argv[1]);
	x = atoi(argv[2]);

	// Establecemos el numero de threads
	omp_set_num_threads(x);

	if (n>20)
		n=20;
	for (i=0; i<n; i++)
	{
		a[i] = i;
	}

	#pragma omp parallel if(n>4) default(none) private(sumalocal,tid) shared(a,suma,n)
	{
		sumalocal=0;
		tid=omp_get_thread_num();

		#pragma omp for private(i) schedule(static) nowait
		for (i=0; i<n; i++)
		{
			sumalocal += a[i];
			printf(" thread %d suma de a[%d]=%d sumalocal=%d \n", tid,i,a[i],sumalocal);
		}
		#pragma omp atomic
		suma += sumalocal;

		#pragma omp barrier

		#pragma omp master
		printf("thread master=%d imprime suma=%d\n",tid,suma);
	}

}