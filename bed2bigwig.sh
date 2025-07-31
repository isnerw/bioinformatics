#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 16
#$ -l mfree=10G -l h_rt=170:00:00
#$ -cwd

# Directory containing BED files
dir="/net/hawkins/vol1/home/aisner/conTAC_Libraries"
genome="/net/hawkins/vol1/home/aisner/GCF_002263795.3_ARS-UCD2.0_genomic.fa"  # Specify the genome file
chromsizes="/net/hawkins/vol1/home/aisner/cattle.chrom.sizes"  # Specify the chromosome sizes file for bigWig conversion
list="/net/hawkins/vol1/home/aisner/sample_cattle.txt"

conda activate basic_tools

cd $dir

for SAMPLE_ID in `cat $list`; do
    
    # Convert BED to BAM
    #bedtools bedtobam -i "${SAMPLE_ID}_chromap.bed" -g "$chromsizes" > "${SAMPLE_ID}.bam"
    
    # Sort the BAM file
    #samtools sort -o "${SAMPLE_ID}_sorted.bam" "${SAMPLE_ID}.bam"
    
    # Index the BAM file
    #samtools index "${SAMPLE_ID}_sorted.bam"
    
    # Convert BAM to BigWig
    bamCoverage -p max -b "$dir/${SAMPLE_ID}_final_clean.bam" --normalizeUsing RPKM -o "$dir/${SAMPLE_ID}_norm.bw" 

done

