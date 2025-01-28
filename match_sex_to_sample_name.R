#!/bin/env -S Rscript --vanilla
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu 4G

sex <- c(
         "sampleA" = "M",
         "sampleB" = "F",
         "sampleC" = "M"
         )

# Given obj is a Seurat object w/samples named "sampleA", "sampleB", "sampleC",
# you could assign sex to each cell based on its sample name.

obj$sex <- unname(sex[ match(obj$sample, names(sex)) ])
