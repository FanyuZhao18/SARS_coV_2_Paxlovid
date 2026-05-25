#!/bin/bash


module purge
module load amber/openmpi/intel/22.00

#module load amber/22gpu
pmemd.cuda -O -i equil.in -p ../../merged_unbound.prmtop -c ../prod.rst7 -o equi.out -r equi.rst7
pmemd.cuda -O -i prod.in -p ../../merged_unbound.prmtop -c equi.rst7 -o prod.out -r prod.rst7