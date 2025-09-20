#!/bin/env Rscript
#SBATCH --cpus-per-task 32
#SBATCH --mem-per-cpu 4G

jobid <- Sys.getenv("SLURM_JOB_ID")

library(qs2)

in_file <- "unintegrated.qs2"

unintegrated <- qs_read(in_file, nthreads = 3)

cores = c(1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 24, 32)

df <- data.frame( cores = numeric(0), jobid = numeric(0), sec = numeric(0))

for (core_count in cores) {

  qs2_out <- paste0("unintegrated_",core_count, "_cores_", jobid, ".qs2")
  duration <- system.time({qs_save(unintegrated, qs2_out, nthreads = core_count)})[3]
  df <- rbind(df, c(jobid, core_count, duration))
  print(paste0("Duration for ", core_count, " is ", duration))
}

out_name <- paste0("core_stats_", jobid, ".csv")
write.csv(df, file = out_name, quote = FALSE, row.names = FALSE)
