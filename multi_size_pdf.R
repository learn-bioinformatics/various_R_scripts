#!/bin/env -S Rscript --vanilla

# This function is for constructing a PDF file with arbitrary size pages. It takes an arbitrary size list of lists of one to three items each. Each three-item list should contain the following in this order:
#  a ggplot object (mandatory)
#  a height (optional, defaults to 7. If not given, can't set height) 
#  a width  (optional, defaults to 7)


#Load needed libraries
library(qpdf)
library(ggplot2) # consuming script should have ggplot2 available

multi_size_pdf <- function(plots_h_w, outfile="combined.pdf") {
    pdf_filenames <- c()
    for (name in names(plots_h_w)) {
        pdf_filename <- tempfile(paste0("temp_", name))

        # Default width to 7
        if (length(plots_h_w[[name]]) < 3) {
            width = 7
        } else {
            width = plots_h_w[[name]][[3]]
        }

        # Default height to 7
        if (length(plots_h_w[[name]]) < 2) {
            height = 7
        } else {
            height = plots_h_w[[name]][[2]]
        }

        # Create temporary PDF file
        pdf(pdf_filename,
            height = height,
            width = width
        )
        print(plots_h_w[[name]][[1]])
        dev.off()
        pdf_filenames <- c(pdf_filenames, pdf_filename)
    }

    pdf_combine(pdf_filenames, outfile)
    file.remove(pdf_filenames)
    message(paste0("Output file ", outfile))
}
