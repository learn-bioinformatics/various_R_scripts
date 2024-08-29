#!/bin/env Rscript

rotor <- function(x, size, partial = FALSE) {

  # Create "label" for each element for which vector it will be placed in.
  labels <- ceiling(seq_along(x) / size) # ceiling makes 1st "bin" 1, 2nd 2, etc

  # Split vector into groups based on label
  my_list <- split(x, labels)

  # If partial not set, trim down to not include "partial"
  if (! partial) {

    # Calculate number of complete (non-partial) bins (%/% is integer division)
    num_complete_bins <- length(x) %/% size

    # Subset to not include the last bin
    my_list <- my_list[1:num_complete_bins]
  }

  return(my_list)
}

# How do I export this thing?
test_rotor <- function() {
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
}

if (length(sys.frames()) == 0) {
    print("Running directly from the command-line, so running test")
    test_rotor()
}
