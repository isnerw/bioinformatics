#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 16
#$ -l mfree=10G
#$ -l h_rt=99:00:00
#$ -cwd

dir=/net/hawkins/vol1/home/aisner

cd $dir

# Define the file
file="Undetermined_S0_L001_I2_001.fastq.gz"

# List of index sequences
indexes=("TTGGACGT" "GAAGTGCT" "ATGACGTC" "CTTCCTTC" "GAAGTTGG" "CGAACAAC" "ATCCGGTA" "GACCGATA")

# Loop through each index and count occurrences
for index in "${indexes[@]}"; do
    count=$(zgrep -o "$index" "$file" | wc -l)
    echo "$index: $count"
done

