#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 48
#$ -l mfree=5G -l h_rt=100:00:00
#$ -o /net/hawkins/vol1/home/aisner
#$ -e /net/hawkins/vol1/home/aisner

conda activate basic_tools

# Decompress the FASTQ file, apply the awk script, sort, count, and get top 50 barcodes
gunzip -c /net/hawkins/vol1/home/aisner/promoter_capture/Undetermined_R2.fastq.gz | \
awk -f test3.awk | \
sort -k1,1nr | \
head -n 500 > barcode_list_072925.txt


