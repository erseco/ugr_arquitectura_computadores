#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 3355 //=2^25

int a[MAX][MAX], b[MAX][MAX], c[MAX][MAX];

int main(int argc, char **argv)
{
    unsigned i, j, k;

    int total = 0;
    int h;
    int s1,s2,s3,s4,s5,s6,s7,s8;
    s1=s2=s3=s4=s5=s6=s7=s8=0;

    if(argc < 2)
    {
        fprintf(stderr, "falta size\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]);

    if (N>MAX) N=MAX;

    // Inicializamos las matrices
    for (i=0; i<N; i++)
    {
        for (j=0; j<N; j++)
        {
            a[i][j] = 0;
            b[i][j] = 2;
            c[i][j] = 2;
        }
    }

    struct timespec cgt1,cgt2; double ncgt;

    int iterations = N/8;

    clock_gettime(CLOCK_REALTIME,&cgt1);

    // Multiplicacion
    for (i=0; i<N; i++)
        for (j=0; j<N; j++)
        {
            s1=s2=s3=s4=s5=s6=s7=s8=0;
            for (h=0, k=0;h < iterations; ++h, k+=8)
            {
                    s1 += (b[i][k]  *c[k][j]  );
                    s2 += (b[i][k+1]*c[j][k+1]);
                    s3 += (b[i][k+2]*c[j][k+2]);
                    s4 += (b[i][k+3]*c[j][k+3]);
                    s5 += (b[i][k+4]*c[j][k+4]);
                    s6 += (b[i][k+5]*c[j][k+5]);
                    s7 += (b[i][k+6]*c[j][k+6]);
                    s8 += (b[i][k+7]*c[j][k+7]);
            }

            total = s1 + s2 + s3 + s4 + s5 + s6 + s7 + s8;
            a[i][j]=total;

            for(k=iterations*8; k<N; ++k)
                total += (b[i][k]*c[j][k]);

            a[i][j]=total;
        }

    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    // Pitamos la primera y la ultima linea de la matriz resultante
    printf("Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n",ncgt,a[0][0],a[N-1][N-1]);

    return 0;
}