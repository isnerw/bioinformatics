#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 10
#$ -l mfree=3G -l h_rt=100:00:00
#$ -o /net/hawkins/vol1/home/aisner
#$ -e /net/hawkins/vol1/home/aisner

dir="/net/hawkins/vol1/home/aisner/conTAC_Libraries"
#list="/net/hawkins/vol1/home/aisner/sample.txt"

conda activate basic_tools

cd $dir

#for SAMPLE_ID in `cat $list`; do
    #matrix="${dir}/${SAMPLE_ID}_matrix.gz"
    matrix="$dir/Bta_merged_matrix.gz"
    plot="$dir/Bta_profileplot.png"

plotProfile -m $matrix -out $plot --plotTitle "Cattle TSS Signal" --plotType=fill \
	--perGroup \
	--colors red red green green blue blue \

