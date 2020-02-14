#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=Homework02
#SBATCH --output=slurm_%j.out

module load samtools/intel/1.9

for read  in ./*.sam
do
	#samtools flagstat $read
	samtools view -bS $read > ${read::-4}.bam
	#samtools sort ${read::-4}.bam -o ${read::-4}.sorted.bam
	#echo $read
done	
