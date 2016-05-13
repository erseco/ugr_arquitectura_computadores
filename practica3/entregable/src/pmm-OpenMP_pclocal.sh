#!/bin/bash

echo "secuencial"
bin/pmm-secuencial 100
bin/pmm-secuencial 500
bin/pmm-secuencial 1000
bin/pmm-secuencial 1500

echo "paralelo 2 threads"
export OMP_NUM_THREADS=2

bin/pmm-OpenMP 100
bin/pmm-OpenMP 500
bin/pmm-OpenMP 1000
bin/pmm-OpenMP 1500

echo "paralelo 4 threads"
export OMP_NUM_THREADS=4

bin/pmm-OpenMP 100
bin/pmm-OpenMP 500
bin/pmm-OpenMP 1000
bin/pmm-OpenMP 1500

