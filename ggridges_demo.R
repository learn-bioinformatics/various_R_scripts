#!/bin/env -S Rscript --vanilla
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu 4G
#SBATCH --exclude cc011        # unreliable node
#SBATCH --mail-type END,FAIL   # get an email when this finishes or fails

## Load needed libraries
library(ggplot2)
library(ggridges)

pdf("ridgeplot_example.pdf")
ggplot(iris, aes(x = Sepal.Length,
                 y = Species,
                 color = Species,
                 fill = Species)) +
geom_density_ridges(alpha = 0.5)
dev.off()

message("********Finished********")

# Save session info for provenance purposes
sessionInfo()
