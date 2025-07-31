#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 10
#$ -l mfree=7G -l h_rt=100:00:00
#$ -o /net/hawkins/vol1/home/aisner
#$ -e /net/hawkins/vol1/home/aisner

dir="/net/hawkins/vol1/home/aisner/conTAC_Libraries"
list="/net/hawkins/vol1/home/aisner/sample.txt"

conda activate basic_tools

cd $dir

for SAMPLE_ID in $(cat "$list"); do

R1_output="${SAMPLE_ID}_R1_subsampled.fastq"
R1="${SAMPLE_ID}_R1.fastq"

R2_output="${SAMPLE_ID}_R2_subsampled.fastq"
R2="${SAMPLE_ID}_R2.fastq"

seqtk sample -s1 $R1 5000000 > $R1_output
seqtk sample -s1 $R1 5000000 > $R1_output

done
