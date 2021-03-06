#!/bin/bash
#SBATCH -p shared
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem 8000
#SBATCH -t 0-04:00:00
#SBATCH -o bwa_mem.%N.%j.out
#SBATCH -e bwa_mem.%N.%j.err

# submit this script from /n/holyscratch01/informatics/blangod/hetAtr/ by typing sbatch map_samples.sh

module load bwa/0.7.17-fasrc01

R1=$1
name=`echo $R1 | sed 's/_1.fastq.gz\+//'`
R2=${name}_2.fastq.gz
#run mapping
bwa mem -t 8 -R '@RG\tID:${name}\tSM:${name}' 00_genome/hetAtr $R1 $R2 > $name.sam
