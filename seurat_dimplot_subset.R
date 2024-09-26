library(Seurat)
obj <- readRDS("unintegrated_filtered.rds")

# Full plot
DimPlot(obj, reduction = "umap.unintegrated")

# Plot just a few cells
DimPlot(obj,
        reduction = "umap.unintegrated",
        cells = c("AAACGAAGTGCAAGAC-1_1_1",
                  "AAACGCTGTCTCACGG-1_1_1",
                  "AAACGCTGTCTGTAGT-1_1_1")
)

indices <- which(obj$sample == "BBB2005")

cell_names <- names(obj$sample[indices])

DimPlot(obj, reduction = "umap.unintegrated", cells = cell_names)

library(ggplot2)

DimPlot(obj,
        reduction = "umap.unintegrated",
        cells = cell_names) +
  ggtitle("BBB2005 redo") +
  theme(plot.title = element_text(hjust = 0.5))
