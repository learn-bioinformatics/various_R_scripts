#!/bin/env Rscript

suppressPackageStartupMessages(library(dplyr))

N_extreme_matching_col <- function(df, N, pattern) {

    # Select column names matching given pattern
    my_col_names <- df %>% select(contains(pattern)) %>% colnames

    # Create matrix of row numbers for each column in order from lowest to highest values
    # e.g. 4 3 1 2 indicates: row 4 has the lowest number, row 2 has the highest
    ordering_by_col <- sapply(my_col_names,function(x) order(df[[x]]))

    rows_to_keep <- unique(c(
                        head(ordering_by_col,N),
                        tail(ordering_by_col,N)
                    ))

    return(df[rows_to_keep,])
}

# dummy data frame
df <- data.frame(
           name=c("A","B","C","D"),
           a_log2fc=c(10,20,-3,0),
           b_log2fc=c(34,23,10,15),
           d=letters[23:26]
      )

cat("\nOriginal data frame:\n")
print(df)


N_rows <- 1

cat(paste0("\nSelected rows\n"))

print(N_extreme_matching_col(df,N_rows,"log2fc"))
