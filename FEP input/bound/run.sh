#!/bin/bash

module purge
module load amber/openmpi/intel/22.00

pmemd.cuda -O -i pre_min1.in -p ../merged_bound.prmtop -c ../merged_bound.inpcrd -ref ../merged_bound.inpcrd -o min1.out -r min1.rst7
pmemd.cuda -O -i pre_min2.in -p ../merged_bound.prmtop -c min1.rst7 -o min2.out -r min2.rst7
pmemd.cuda -O -i pre_heat.in -p ../merged_bound.prmtop -c min2.rst7 -ref min2.rst7 -o heat.out -r heat.rst7
pmemd.cuda -O -i pre_equil.in -p ../merged_bound.prmtop -c heat.rst7 -o equi.out -r equi.rst7
pmemd.cuda -O -i pre_prod.in -p ../merged_bound.prmtop -c equi.rst7 -o prod.out -r prod.rst7