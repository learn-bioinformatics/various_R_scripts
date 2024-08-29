#!/bin/env Rscript

rotor <- function(x, size, partial = FALSE) {

  # Create a "label" for each value
  labels <- ceiling(seq_along(x) / size)

  # Split vector into groups based on label
  my_list <- split(x, labels)

  if (! partial) {
    num_complete_bins <- length(x) %/% size

    my_list <- my_list[1:num_complete_bins]
  }

  return(my_list)
}

nums <- c(1:20, 90:110, 4:9)

my_lists <- rotor(nums, 10)

print(nums)
print("rotor without partial:")
print(my_lists)
print("Means of rotored list:")
means <- sapply(names(my_lists), function(x) {mean(my_lists[[x]])} )
print(means)

with_partial <- rotor(nums, 10, partial = TRUE)

print("rotored list with partial:")
print(with_partial)

print("means of rotored list with partial:")
print(sapply(names(with_partial), function(x) {mean(with_partial[[x]])} ))
