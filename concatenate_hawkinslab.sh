#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 10
#$ -l mfree=6G -l h_rt=170:00:00
#$ -cwd

#!/bin/bash

dir="/net/hawkins/vol1/home/aisner/"  # Adjust folder path
list="/net/hawkins/vol1/home/aisner/sample.txt"

conda activate basic_tools

cd $dir

for SAMPLE_ID in `cat $list`; do
        cat "${SAMPLE_ID}"*_R1_001.fastq.gz > "${SAMPLE_ID}_R1.fastq.gz"
        cat "${SAMPLE_ID}"*_R2_001.fastq.gz > "${SAMPLE_ID}_R2.fastq.gz"
done

