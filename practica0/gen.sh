#!/bin/bash
gcc -O2 SumaVectores.c -o SumaVectores -lrt
gcc -O2 SumaVectoresG.c -o SumaVectoresG -lrt
gcc -O2 SumaVectoresD.c -o SumaVectoresD -lrt


ssh B1estudiante26@atcgrid.ugr.es

pass: fzdtfzdcmh

sftp B1estudiante26@atcgrid.ugr.es

put SumaVectores*.sh
put SumaVectores
put SumaVectoresG
put SumaVectoresD

# echo './SumaVectores' | qsub -q ac

# qsub SumaVectores.sh
# qsub SumaVectoresG.sh
# qsub SumaVectoresD.sh


#pasos:

ejecutar en local los tres script
ejecutar en el servidor el ejecutable 1 solo
ejecutar en remoto  los tres script
