#!/bin/sh
#
#PBS -N CoNDIDP_gpaw
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=all
#

source $VSC_DATA_VO/apps_cmm/activate.sh
module load gpaw/1.0.0-intel-2016b-Python-2.7.12
module load gpaw-setups/0.9.20000-linux-x86_64

ORIGDIR=$PBS_O_WORKDIR
WORKDIR=/local/$PBS_JOBID

mkdir -p $WORKDIR
cp $ORIGDIR/CoNDIDP_POSCAR $WORKDIR

echo "Contents of the directories before the calculation:"
echo "ORIGDIR:" $ORIGDIR
ls
cd $WORKDIR
echo "WORKDIR:" $WORKDIR
ls

mpirun -np 24 gpaw-python ${HOME}/bin/gpaw-driver.py CoNDIDP_POSCAR --mode rg --spacing 0.15 --xc PBE --kpts 3.1.4 --runtype energy

echo "Contents of the directories after the calculation:"
echo "ORIGDIR:" $ORIGDIR
ls $ORIGDIR
echo "WORKDIR:" $WORKDIR
ls $WORKDIR

cp $WORKDIR/* $ORIGDIR
cd $ORIGDIR
rm -rf $WORKDIR
