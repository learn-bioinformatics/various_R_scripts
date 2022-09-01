#!/usr/bin/bash -l 

module load R

Rscript map_ids.R 

echo "Checking results for A.txt"
diff t/gene_names_A.csv t/expected/gene_names_A.csv
