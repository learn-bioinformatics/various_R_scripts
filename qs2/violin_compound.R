#!/bin/env -S Rscript --vanilla
library(ggplot2)
library(dplyr)

# Read in data
df <- read.csv("all_write.csv")

# Force order upon core category
level_order <- c(1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 24, 32)
df$cores <- factor(df$cores, level = level_order)

p1 <- ggplot(df, aes(x=cores, y=sec, fill = cores)) +
      ggtitle("qs2::qs_save(obj, file, nthreads = cores)") +
      geom_violin(alpha = 0.5) +
      geom_dotplot(binaxis= "y",
               stackdir = "center",
               dotsize = 0.5,
               fill = 1) +
      theme(legend.position = "none")

pdf("read_times.pdf")
print(p1)
dev.off()

# For reading
#df <- read.csv("all_read.csv")
#      ggtitle("qs2::qs_read(file, nthreads = cores)") +
