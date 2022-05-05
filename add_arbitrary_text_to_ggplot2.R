#!/bin/env Rscript
#SBATCH --cpus-per-task=12
#SBATCH --mem=96G
#SBATCH --time=1-00:00

##Load needed libraries
#library(Seurat)
library(ggplot2)

set.seed(2923874)                               # Create example data
data <- data.frame(x = 1:10,
                   y = 1:10)
data$Status <- "High"
data[data$y < 7,]$Status <- "Med"
data[data$y < 3,]$Status <- "Low"

print(data)

h_line <- 8.7                       # Position of horizontal line

ggp <- ggplot(data, aes(x, y, color=Status)) +
  geom_point() +
  geom_hline(aes(yintercept = h_line)) +
  annotate(geom="text", x=0, y=h_line+0.5, label=h_line, color="red")

# Print plot to a file
pdf("test.pdf")
    print(ggp)
dev.off()
