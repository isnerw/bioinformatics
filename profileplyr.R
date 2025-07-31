library(profileplyr)
proplyrObject <- import_deepToolsMat("/net/hawkins/vol1/home/aisner/conTAC_Libraries/Bta_merged_matrix.gz")
set.seed(42)
bad_rows <- rowSums(mat) == 0 | apply(mat, 1, var) == 0
proplyr_clean <- proplyrObject[!bad_rows, ]
idx <- sample(1:nrow(proplyr_clean), 65000)
proplyrObject_subset <- proplyr_clean[idx, ]
hclust <- clusterRanges(proplyrObject_subset, fun = rowMeans, cutree_rows = 4, silent = FALSE)
png("my_plot.png", width = 800, height = 600, res = 150)
dev.off()
