#!/bin/env Rscript

mapping_file_name <- "t/ids.txt"
data_file_dir <- "t"
data_file_name <- "A.csv"
full_path_data_file_name <- paste0(data_file_dir, "/", data_file_name)
out_file_name <- paste0(data_file_dir, "/gene_names_", data_file_name)

debugging <- FALSE

ids2names <- function(ref_ids, ref_names, input_ids) {
  # Remove any structure from the data
  ref_ids <- unlist(ref_ids)
  ref_names <- unlist(ref_names)
  input_ids <- unlist(input_ids)

  df <- data.frame(name = ref_names)
  rownames(df) <- ref_ids

  name_or_id <- function(id) {

    # Check if id is found
    has_matching_ID <- id %in% ref_ids

    # If not found, just return the query Ensembl ID
    if (isTRUE(has_matching_ID)) {
      matching_name <- df[id, "name"]
      return(matching_name)
    } else {
      return(id)
    }
  }

  names_from_ids <- sapply(input_ids, name_or_id)
  clean_names <- unname(names_from_ids)
  clean_names
}

name_mapping <- read.table(mapping_file_name, header = FALSE)
data_file <- read.csv(full_path_data_file_name, header = TRUE)
if (isTRUE(debugging)) {
  head(name_mapping)
  head(data_file)
}

data_file$gene_symbol <- ids2names(name_mapping[1],
                                   name_mapping[3],
                                   data_file$ID)

write.csv(data_file, out_file_name, row.names = FALSE, quote = FALSE)
