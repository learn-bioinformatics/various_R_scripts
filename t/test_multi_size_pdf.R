#!/bin/env -S Rscript --vanilla
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu 4G

source("multi_size_pdf.R")

plot_list <- list()

df <- data.frame(x = c(1:3), y = c(4:6))

plot_list[["a"]] <- list(
                         # ggplot object
                         ggplot(df, aes(x = x, y = y)) + geom_point(),
                         4, #height
                         4  # width
                    )

plot_list[["b"]] <- list(
                         ggplot(df, aes(x = x, y = y)) + geom_point(),
                         4 # no width given
                    )

# no height/width given
plot_list[["c"]] <- list(ggplot(df, aes(x = x, y = y)) + geom_point())

multi_size_pdf(plot_list, "dummy_out_file_combined.pdf")
