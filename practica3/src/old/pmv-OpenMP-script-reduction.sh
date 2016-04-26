#!/bin/bash
#Se asigna al trabajo el nombre pmv-OpenMPr
#PBS -N pmv-OpenMPr
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"

echo "pmv-OpenMP-reduction"
$PBS_O_WORKDIR/pmv-OpenMP-reduction 100
$PBS_O_WORKDIR/pmv-OpenMP-reduction 500
$PBS_O_WORKDIR/pmv-OpenMP-reduction 1000
$PBS_O_WORKDIR/pmv-OpenMP-reduction 5000
$PBS_O_WORKDIR/pmv-OpenMP-reduction 10000
$PBS_O_WORKDIR/pmv-OpenMP-reduction 50000
