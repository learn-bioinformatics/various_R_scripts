#!/bin/env -S Rscript --vanilla

# Use cairo (insted of X11) for PNGs
options(bitmapType='cairo')

# Load knitr library
library(knitr)

# Produce github-readable markdown file
knit("README.Rmd")
