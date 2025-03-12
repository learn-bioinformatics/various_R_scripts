#!/bin/env Rscript
library(gridExtra)

# Create a new PDF file
pdf("test.pdf")

# dummy data
df <- data.frame(a = 1:5, b = 6:10)

# plot
plot(df$a, df$b)

# Create a new page
plot.new()

# Print table of the data
grid.table(df)

# Close the PDF file
dev.off()
