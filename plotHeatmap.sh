#!/bin/bash
#$ -S /bin/bash
#$ -pe serial 16
#$ -l mfree=10G -l h_rt=100:00:00
#$ -o /net/hawkins/vol1/home/aisner
#$ -e /net/hawkins/vol1/home/aisner

##path
dir=/net/hawkins/vol1/home/aisner/conTAC_Libraries

conda activate basic_tools

cd $dir

plotHeatmap -m Bta_merged_matrix.gz -out Bta_merged_heatmap.png --plotTitle "Bta_merged" --alpha 0.5 --heatmapHeight 8 -z readpileup --colorMap Reds \
--whatToShow 'heatmap and colorbar' \
--dpi 100 \



#plotHeatmap -m Gg_merged_matrix.gz -out Gg_merged_heatmap.png \
#       --plotTitle "Gg_merged" \
	#--outFileNameMatrix "Gg_merged.tab"
#        --alpha 0.5 \
#	--heatmapHeight 8 \
#	-z RPKM Signal \
	#--samplesLabel Spleen1 Kidney1 Kidney2 Liver1 Liver2 Spleen2
	#--plotType fill
#        --colorMap Reds \
#        --whatToShow 'heatmap and colorbar' \
#        --dpi 100 \
