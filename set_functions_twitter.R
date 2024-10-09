#!/bin/env Rscript
# Try out set functions in R
a <- c(1:10)
b <- c(4:12)

intersect(a,b)
union(a,b)
setdiff(a,b)
setdiff(b,a)
