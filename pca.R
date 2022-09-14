#!/bin/env Rscript
library(tidyverse)
library(ggplot2)
library(scales)

my_data <- read.table("data_for_pca.csv", header = TRUE)
my_data <- column_to_rownames(my_data, "GeneID")

# Replace NAs with zero (may or may not be appropriate, depending on your data)
my_data[is.na(my_data)] <- 0

# Calculate principle components from scaled and centered data
pca <- prcomp(my_data, scale = TRUE)

# Convert PCA "rotation" matrix to data frame
pca_df <- as.data.frame(pca$rotation)

# Get the percent variance explained by the first two principle components
pca_summary <- summary(pca)
PC1_import <- label_percent()(pca_summary$importance[2, 1])
PC2_import <- label_percent()(pca_summary$importance[2, 2])

# Plot PCA values
pdf("my_pca.pdf")

    # Plot samples and the first two PC's
    ggplot(pca_df, aes(x = PC1, y = PC2)) +
        labs(x = paste0("PC1 explains ", PC1_import, " variance"),
             y = paste0("PC2 explains ", PC2_import, " variance")
        ) +
        geom_text(label = rownames(pca_df), hjust = 0, vjust = 0)
dev.off()
