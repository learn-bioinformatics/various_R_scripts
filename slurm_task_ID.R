#!/bin/env -S Rscript --vanilla
#SBATCH --cpus-per-task 16
#SBATCH --mem 480G
#SBATCH --partition highmem,gpu

arrayID <- Sys.getenv("SLURM_ARRAY_TASK_ID") 

print(arrayID)
