#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 24
#$ -l mfree=10G -l h_rt=100:00:00
#$ -o /net/hawkins/vol1/home/aisner
#$ -e /net/hawkins/vol1/home/aisner

dir="/net/hawkins/vol1/home/aisner/conTAC_Libraries"
#list="/net/hawkins/vol1/home/aisner/sample_cattle.txt"
regions="/net/hawkins/vol1/home/aisner/conTAC_Libraries/galllus_refseq_TSS.bed" 

conda activate basic_tools

cd $dir

# Get sample name based on SGE_TASK_ID and run as array "qsub -t"
#SAMPLE_ID=$(sed -n "${SGE_TASK_ID}p" $list)

#for SAMPLE_ID in `cat $list`; do
#bigwig="${dir}/${SAMPLE_ID}_norm.bw"
#matrix_output="${dir}/${SAMPLE_ID}_matrix.gz"
matrix_output="Bta_merged_matrix.gz"
tsv="${dir}/${SAMPLE_ID}_matrix.tsv"

computeMatrix reference-point -R $regions -S /net/hawkins/vol1/home/aisner/conTAC_Libraries/Gg/*.bw \
        --binSize 50 -a 1000 -b 1000 \
        --missingDataAsZero \
	--skipZeros \
	--referencePoint TSS \
        -o $matrix_output \
	--outFileNameMatrix $tsv \
#done
