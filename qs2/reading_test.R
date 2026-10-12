#!/bin/env Rscript
#SBATCH --cpus-per-task 32
#SBATCH --mem-per-cpu 4G

library(qs2) # qs_save, qs_read are faster and smaller than saveRDS, readRDS
library(dplyr) # pipes %>%

# Capture job id from environment variable
jobid <- Sys.getenv("SLURM_JOB_ID")

# Input file name
in_file <- "unintegrated.qs2"

unintegrated <- qs_read(in_file, nthreads = 3)

cores <- c(0, 1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 24, 32)

df <- data.frame( cores = character(0), jobid = character(0), sec = character(0))

for (core_count in cores) {

  if (core_count == 0) {
    duration <- system.time({
                  unintegrated <- qs_read(in_file)
                })[3]
  } else {
    duration <- system.time({
                  unintegrated <- qs_read(in_file, nthreads = core_count)
                })[3]
  }

  if (core_count == 0) {
    core_count = "default"
  }

  df_new <- data.frame( cores = core_count, jobid = jobid, sec = duration)

  print(paste0("Duration for ", core_count, " is ", duration))

  df <- rbind(df, df_new)
}

colnames(df) <- c("jobid", "cores", "sec")

out_name <- paste0("read_stats_", jobid, ".csv")
write.csv(df, file = out_name, quote = FALSE, row.names = FALSE)
