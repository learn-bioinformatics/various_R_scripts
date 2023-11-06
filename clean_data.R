#!/bin/env Rscript
#SBATCH --cpus-per-task 1
#SBATCH --mem-per-cpu 4G
library(dplyr)
library(stringr)

# Starting demo data
my_data <- data.frame(
             diseased = c("Y", "Y", "N", "Y", "N", "Y"),
             sex = c("Male", "female", "guy", "FEMALE", "FemALe", "FEMalE"),
             genotype = c("XY", "XX", "XY", "XX", "XX", "XXX")
           )

# Change sex to Title Case
# Replace "guy" with "Male"
# Summarize data
summary_data <-
    my_data %>%
    mutate(sex_tc = str_to_title(.$sex)) %>%
    mutate(sex_tc = gsub("guy", "Male", .$sex_tc, ignore.case = TRUE)) %>%
    group_by(diseased, sex_tc, genotype) %>%
    summarize(count = n())

# Print data
print(summary_data)
