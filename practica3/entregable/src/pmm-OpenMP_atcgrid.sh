#!/bin/bash

#PBS -N ej10_atcgrid
#PBS -q ac
echo "Id$PBS_O_WORKDIR usuario del trabajo: $PBS_O_LOGNAME"
echo "Id$PBS_O_WORKDIR del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE

export OMP_SCHEDULE="static"
echo "static y chunk por defecto"
$PBS_O_WORKDIR/pmtv-OpenMP 15360


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