#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 16
#$ -l mfree=5G -l h_rt=170:00:00
#$ -cwd

dir=/net/hawkins/vol1/home/aisner/promoter_capture/Troubleshoot ## Replace for the folder path

cd $dir

conda activate ATAC

fastqc *_R1.fastq.gz
fastqc *_R2.fastq.gz

multiqc *.zip  ## visualize *.fastq

