#!/bin/bash

echo "pmv-OpenMP-a"
./pmv-OpenMP-a 100
./pmv-OpenMP-a 500
./pmv-OpenMP-a 1000
./pmv-OpenMP-a 5000
./pmv-OpenMP-a 10000
./pmv-OpenMP-a 50000


echo "pmv-OpenMP-b"
./pmv-OpenMP-b 100
./pmv-OpenMP-b 500
./pmv-OpenMP-b 1000
./pmv-OpenMP-b 5000
./pmv-OpenMP-b 10000
./pmv-OpenMP-b 50000


echo "pmv-OpenMP-reduction"
./pmv-OpenMP-reduction 100
./pmv-OpenMP-reduction 500
./pmv-OpenMP-reduction 1000
./pmv-OpenMP-reduction 5000
./pmv-OpenMP-reduction 10000
./pmv-OpenMP-reduction 50000
