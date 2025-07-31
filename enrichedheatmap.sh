#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 24
#$ -l mfree=10G -l h_rt=100:00:00
#$ -cwd
#$ -o /net/hawkins/vol1/home/aisner
#$ -e /net/hawkins/vol1/home/aisner

dir=/net/hawkins/vol1/home/aisner

cd $dir

conda activate basic_tools

module load modules; module load modules-init; module load modules-gs; module load R/4.4.1

Rscript $dir/enrichedheatmap.R
