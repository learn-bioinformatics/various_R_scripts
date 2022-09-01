#!/bin/env Rscript
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu 4G
#SBATCH --time 1-00:00
#SBATCH --mail-type END,FAIL

id_column <- "ID"
target_column <- "val"
sample_names <- c("A", "B", "C")

# Create list of dataframes, one per file
dfs <- lapply(
  sample_names,
  function(x) read.table(paste0("t/", x, ".tsv"), header = TRUE)
)

# Name each list element its respective sample name
names(dfs) <- sample_names

# Get IDs column from the first dataframe
# NOTE: assuming that they are all identical
first_sample_name <- sample_names[1]
combined <- dfs[[first_sample_name]][id_column]

for (sample_name in sample_names) {
  # Capture target column from each sample and assign it the sample name
  combined[[sample_name]] <- unlist(dfs[[sample_name]][target_column])
  #                          Unlisting prevents name of extracted column
  #                            from overwriting sample name.
}

print(combined)
