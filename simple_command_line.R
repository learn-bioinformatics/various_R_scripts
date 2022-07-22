#!/bin/env Rscript
#SBATCH --cpus-per-task 12
#SBATCH --mem-per-cpu 8G
#SBATCH --time 1-00:00
#SBATCH --mail-user $USER@omrf.org
#SBATCH --mail-type END,FAIL

# You can have as many positional arguments as you want
# You can call your R script with sbatch, you can run it thus:
#   module load slurm R
#   sbatch simple_command_line.R input1 input2 input3

# Or, if not on the cluster, you can run it with Rscript:
# Rscript simple_command_line.R input1 input2 input3

# Or, since it has the Rscript in the shebang:
# ./simple_command_line.R input1 input2 input3

args <- commandArgs(trailingOnly = TRUE)

my_var_1 <- args[1] # First positional argument
my_var_2 <- args[2] # Second positional argument
my_var_3 <- args[3] # Third positional argument

#default values (in case user doesn't supply them)

if (is.na(my_var_1)) my_var_1 <- "default_1"
if (is.na(my_var_2)) my_var_2 <- "default_2"
if (is.na(my_var_3)) my_var_3 <- "default_3"
