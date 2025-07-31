library(EnrichedHeatmap)
library(rtracklayer)
library(GenomicRanges)
library(GenomicFeatures)
library(circlize)

# Load BED and BigWig
genes <- import("/net/hawkins/vol1/home/aisner/conTAC_Libraries/bos_refseq_TSS.bed", format = "BED")
tss <- promoters(genes, upstream = 0, downstream = 1)

# Import signal tracks
Liver1 <- import("/net/hawkins/vol1/home/aisner/conTAC_Libraries/AI30_norm.bw")
Liver2 <- import("/net/hawkins/vol1/home/aisner/conTAC_Libraries/AI31_norm.bw")
Spleen1 <- import("/net/hawkins/vol1/home/aisner/conTAC_Libraries/AI10_norm.bw")
Spleen2 <- import("/net/hawkins/vol1/home/aisner/conTAC_Libraries/AI33_norm.bw")
Kidney1 <- import("/net/hawkins/vol1/home/aisner/conTAC_Libraries/AI15_norm.bw")
Kidney2 <- import("/net/hawkins/vol1/home/aisner/conTAC_Libraries/AI16_norm.bw")

# Smooth bins (increase bin width from 50 to 100 to reduce graininess)
w_size <- 100
extend <- 3000

mat1 <- normalizeToMatrix(Liver1, tss, value_column = "score", extend = extend, mean_mode = "w0", w = w_size)
mat2 <- normalizeToMatrix(Liver2, tss, value_column = "score", extend = extend, mean_mode = "w0", w = w_size)
mat3 <- normalizeToMatrix(Spleen1, tss, value_column = "score", extend = extend, mean_mode = "w0", w = w_size)
mat4 <- normalizeToMatrix(Spleen2, tss, value_column = "score", extend = extend, mean_mode = "w0", w = w_size)
mat5 <- normalizeToMatrix(Kidney1, tss, value_column = "score", extend = extend, mean_mode = "w0", w = w_size)
mat6 <- normalizeToMatrix(Kidney2, tss, value_column = "score", extend = extend, mean_mode = "w0", w = w_size)

# Shared color scale (adjust range if needed)
max_signal <- 1.5  # Adjust if necessary based on quantile(all_values, 0.99)
col_fun <- colorRamp2(c(0, max_signal), c("white", "darkred"))

# Create heatmap list
ht_list <- EnrichedHeatmap(mat1, col = col_fun, name = "Liver1",
    top_annotation = HeatmapAnnotation(enrich = anno_enriched(axis_param = list(side = "left")))) +
    EnrichedHeatmap(mat2, col = col_fun, name = "Liver2") +
    EnrichedHeatmap(mat3, col = col_fun, name = "Spleen1") +
    EnrichedHeatmap(mat4, col = col_fun, name = "Spleen2") +
    EnrichedHeatmap(mat5, col = col_fun, name = "Kidney1") +
    EnrichedHeatmap(mat6, col = col_fun, name = "Kidney2")

# Save as vector PDF (high quality, scalable)
pdf("enriched_heatmap.pdf", width = 12, height = 6)
draw(ht_list, merge_legend = TRUE)
dev.off()

