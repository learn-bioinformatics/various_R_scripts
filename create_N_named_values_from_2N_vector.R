#!/bin/env -S Rscript --vanilla

# capture the command line arguments
args <- commandArgs(trailingOnly=TRUE)

# Extract names (odd indices) and values (even indices)
names <- args[seq(1, length(args), by = 2)]
values <- args[seq(2, length(args), by = 2)]

unique_names <- unique(names)

if (length(unique_names) != length(values) ) {
  stop("ERROR: Either odd number of arguments or names are not unique")
}

named_list <- setNames(as.list(values), names)

print(named_list)
