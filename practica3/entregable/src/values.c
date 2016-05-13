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
	omp_sched_t schedule_type;
	int chunk_value;


  // omp_sched_static = 1,
  // omp_sched_dynamic = 2,
  // omp_sched_guided = 3,
  // omp_sched_auto = 4

	// omp_set_dynamic(2);
	// omp_set_num_threads(2);
	omp_set_schedule(2, 1);

	#pragma omp parallel

	// Imprimimos antes del cambio
	printf("Valores\n");
	printf("   static = 1, dynamic = 2, guided = 3, auto = 4\n");
	omp_get_schedule(&schedule_type, &chunk_value);
	printf("   dyn-var: %d, nthreads-var:%d, thread-limit-var:%d,run-sched-var: %d, chunk: %d\n" \
				, omp_get_dynamic(), \
			omp_get_max_threads(), omp_get_thread_limit(), \
			schedule_type, chunk_value);

	printf(" get_num_threads: %d,get_num_procs: %d,in_parallel():%d \n", \
			omp_get_num_threads(),omp_get_num_procs(),omp_in_parallel());


}