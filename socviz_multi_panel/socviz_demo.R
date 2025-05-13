#!/bin/env -S Rscript --vanilla
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu 4G

#Load needed libraries
library(socviz)
library(ggplot2)

# Create new PDF file
pdf("socviz_demo.pdf")

# Create plots that we'll later put into a grid
plotA <- qplot(x=wt,y=mpg,geom="point",main="Scatterplot of wt vs mpg", data=mtcars)
plotB <- qplot(x=wt,y=disp,geom="point",main="Scatterplot of wt vs disp", data=mtcars)
plotC <- qplot(wt,data=mtcars)
plotD <- qplot(x=wt,y=disp,geom="point",main="Scatterplot P4", data=mtcars)
plotE <- qplot(x=wt,y=disp,geom="point",main="Scatterplot P5", data=mtcars)
plotF <- qplot(x=wt,y=disp,geom="point",main="Scatterplot P7", data=mtcars)

# Define the "rows" and "columns" that each plot fills up.
# Here we are implementing a 5 row x 2 column grid
# 

#      column
#       1   2
# row +---+---+
#  1  | A |   |
#     +---+ D +
#  2  |   |   |
#     +   +---+
#  3  | B | E |
#     +   +---+
#  4  |   |   |
#     +---+---+
#  5  | C | F |
#     +---+---+


#              row(s)  column(s)
#                   |    |
lay_out(     #      |    |
             #      |    |   # Left column ( column = 1)
        list(plotA, 1,   1), # Top row (top left square)
        list(plotB, 2:4, 1), # Rows 2-4 (middle rectange 3 high)
        list(plotC, 5,   1), # Row 5 (bottom left square)

                          # Right column ( column = 2)
        list(plotD, 1:2, 2), # Rows 1-2 (rectangle "2 high" at top right)
        list(plotE, 3,   2), # Row 3 (single square in the middle, on the right)
#        list(NULL,  4,   2), # Row 4 (empty spot just above bottom square)
        list(plotF, 5,   2)  # Rows 5 (bottom right square)
)

# Uncomment the line above for row 4, column 2 for the same result.
# Specifying a NULL position is the same as not specifying it at all.

dev.off()
