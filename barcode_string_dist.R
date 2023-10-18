#!/bin/env Rscript

library(stringdist)

barcodes <- scan("barcodes.txt", what="character")

num_barcodes <- length(barcodes)

min_dist <- 50

for (i in 1:num_barcodes) {

    if (i == num_barcodes) { break }

    current_barcode <- barcodes[i]

    other_barcodes <- barcodes[(i+1):num_barcodes]

    for (other_barcode in other_barcodes) {

        dist <- stringdist(current_barcode, other_barcode)

        min_dist <- min(min_dist, dist)
    }
}

print("Minimum distance: ")
print(min_dist)
