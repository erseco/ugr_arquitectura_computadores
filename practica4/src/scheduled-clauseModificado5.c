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

	int i, n=200, chunk, a[n], suma=0;
	omp_sched_t schedule_type;
	int chunk_value;

	if(argc < 3)
	{
		fprintf(stderr,"\nFalta iteraciones o chunk \n");
		exit(-1);
	}

	n = atoi(argv[1]);
	if (n>200)
		n=200;

	chunk = atoi(argv[2]);

	for (i=0; i<n; i++)
		a[i] = i;

	// Imprimimos antes del cambio
	printf("Antes del cambio\n");
	printf("   static = 1, dynamic = 2, guided = 3, auto = 4\n");
	omp_get_schedule(&schedule_type, &chunk_value);
	printf("   dyn-var: %d, nthreads-var:%d, thread-limit-var:%d,run-sched-var: %d, chunk: %d\n" \
				, omp_get_dynamic(), \
			omp_get_max_threads(), omp_get_thread_limit(), \
			schedule_type, chunk_value);

	printf(" get_num_threads: %d,get_num_procs: %d,in_parallel():%d \n", \
			omp_get_num_threads(),omp_get_num_procs(),omp_in_parallel());

	// Cambiamos los valores
	omp_set_dynamic(2);
	omp_set_num_threads(2);
	omp_set_schedule(2, 1);

	#pragma omp parallel for firstprivate(suma) lastprivate(suma) \
			schedule(dynamic,chunk)
	for (i=0; i<n; i++)
	{
		suma = suma + a[i];
		printf(" thread %d suma a[%d]=%d suma=%d \n", omp_get_thread_num(),i,a[i],suma);

        if(omp_get_thread_num() == 0)
        {
            printf(" Dentro de 'parallel for':\n");
        }
	}

	printf("Fuera de 'parallel for' suma=%d\n",suma);

	// Imprimimos despues del cambio
	printf("   static = 1, dynamic = 2, guided = 3, auto = 4\n");
	omp_get_schedule(&schedule_type, &chunk_value);
	printf("   dyn-var: %d, nthreads-var:%d, thread-limit-var:%d,run-sched-var: %d, chunk: %d\n" \
				, omp_get_dynamic(), \
			omp_get_max_threads(), omp_get_thread_limit(), \
			schedule_type, chunk_value);

	printf(" get_num_threads: %d,get_num_procs: %d,in_parallel():%d \n", \
			omp_get_num_threads(),omp_get_num_procs(),omp_in_parallel());
}