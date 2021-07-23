#!/bin/sh
#
#PBS -N CoNDIDP
#PBS -l walltime=11:59:00
#PBS -l nodes=1:ppn=1
#

ORIGDIR=$PBS_O_WORKDIR
WORKDIR=/local/$PBS_JOBID

mkdir -p $WORKDIR
cp $ORIGDIR/denspart.h5 $WORKDIR

echo "Contents of the directories before the calculation:"
echo "ORIGDIR:" $ORIGDIR
ls
cd $WORKDIR
echo "WORKDIR:" $WORKDIR
ls

source $VSC_DATA_VO/apps_cmm/activate.sh
module load gpaw/1.0.0-intel-2016b-Python-2.7.12
module load gpaw-setups/0.9.20000-linux-x86_64
module load denspart/0.0.0b2-intel-2016b-Python-2.7.12-HDF5-1.8.18

# Convert CHGAR to denspart format (specify pseudo numbers!)
#denspart-convert-cube CHGCAR denspart.h5 --pseudo=1:1,5:3,6:4,8:5  #VASP
# denspart-convert-gpaw output.gpw denspart.h5 # run THIS interactively beforehand (+-30mins)

# Run MBIS partitioning
denspart-mbis denspart.h5 mbis.h5

echo "Contents of the directories after the calculation:"
echo "ORIGDIR:" $ORIGDIR
ls $ORIGDIR
echo "WORKDIR:" $WORKDIR
ls $WORKDIR

cp $WORKDIR/* $ORIGDIR
cd $ORIGDIR
rm -rf $WORKDIR
