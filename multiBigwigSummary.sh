#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 24
#$ -l mfree=10G -l h_rt=100:00:00
#$ -o /net/hawkins/vol1/home/aisner
#$ -e /net/hawkins/vol1/home/aisner

dir="/net/hawkins/vol1/home/aisner/nextseq_061825/ZNF_Sutherland_Project"
#list="/net/hawkins/vol1/home/aisner/sample_cattle.txt"
#regions="/net/hawkins/vol1/home/aisner/GCF_002263795.3_ARS-UCD2.0_genomic.gtf"

conda activate basic_tools

cd $dir

multiBigwigSummary bins -b ZNF100_norm.bw ZNF250_norm.bw ZNF500_norm.bw -bl //net/hawkins/vol1/home/aisner/hg38.blacklist.bed  -o ZNF_merged.npz
#multiBigwigSummary bins -b /net/hawkins/vol1/home/aisner/conTAC_Libraries/Bta/bigwig/*.bw -o Bta_merged.npz
#multiBigwigSummary bins -b /net/hawkins/vol1/home/aisner/conTAC_Libraries/Gg/bigwig/*.bw -o Gg_merged.npz

plotPCA -in /net/hawkins/vol1/home/aisner/nextseq_061825/ZNF_Sutherland_Project/ZNF_merged.npz -o ZNF_merged_PCA.png

plotCorrelation -in /net/hawkins/vol1/home/aisner/nextseq_061825/ZNF_Sutherland_Project/ZNF_merged.npz -c spearman -p heatmap -o ZNF_merged_Correlation.png
