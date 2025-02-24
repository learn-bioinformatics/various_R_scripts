#!/bin/env -S Rscript --vanilla
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu 4G

vec <- c("Name", "George", "Height", "35", "Weight", "180")
# Extract names (odd indices) and values (even indices)
names <- vec[seq(1, length(vec), by = 2)]
values <- vec[seq(2, length(vec), by = 2)]


converted <- lapply(values, function(x) {ifelse(grepl("^-?\\d+(\\.\\d+)?$", x), as.numeric(x), x) })
named_list <- setNames(as.list(converted), names)

print(named_list)
