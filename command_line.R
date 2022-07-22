#!/bin/env Rscript
#SBATCH --cpus-per-task 12
#SBATCH --mem-per-cpu 8G
#SBATCH --time 1-00:00
#SBATCH --mail-user $USER@omrf.org
#SBATCH --mail-type END,FAIL

# Load needed libraries
library(argparser)

parse_all_args <- function() {
  p <- arg_parser("Description")
  p <- add_argument(
         p,
         "--pcs",
         short = "-p", # without this, R thinks -p is # of threads
         default = 40,
         help = "minimum number of PCs to use"
       )
  p <- add_argument(
         p,
         "--output-dir", # -o is an automatic option
         default = ".", # current directory
         help = "folder for outputs (default: .)"
       )
  return(parse_args(p))
}

args <- parse_all_args()

print(paste0("pcs from command line: ", args$pcs))
print(paste0("output dir from command line: ", args$output_dir))
