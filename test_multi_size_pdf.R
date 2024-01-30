#!/bin/env -S Rscript --vanilla
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu 4G

source("multi_size_pdf.R")

plot_list <- list()

plot_list[["a"]] <- list(
                         # ggplot object
                         ggplot(data.frame(x=c(1:3), y=c(4:6)),
                           aes(x = x, y = y)) +
                         geom_point(),

                         4, #height

                         4  # width
                    )

plot_list[["b"]] <- list(
                         ggplot(data.frame(x=c(1:3), y=c(4:6)),
                            aes(x = x, y = y)) +
                         geom_point(),
                         4 # no width given
                    )
plot_list[["c"]] <- list(
                         ggplot(data.frame(x=c(1:3), y=c(4:6)),
                           aes(x = x, y = y)) +
                         geom_point() # no height/width given
                    )

multi_size_pdf(plot_list, "dummy_out_file_combined.pdf")
