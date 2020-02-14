#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=Homework02
#SBATCH --output=slurm_%j.out

module load hisat2/intel/2.0.5
hisat2-build  ./*.fa athal_index

for read  in ./*_1.fastq
do
	hisat2 -p 8 -x athal_index -1 $read -2 ${read::-7}2.fastq -S ${read::-7}athal_HiSAT.sam
	#can pipe into a sorted alignment
	#echo $read
	#echo ${read::-7}2.fastq
done	
