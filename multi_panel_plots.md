#!/bin/env -S Rscript --vanilla
---
output: rmarkdown::github_document
---

With R, when you print plots to PDF or SVG files, they are created as [vector
graphics](https://en.wikipedia.org/wiki/Vector_graphics), which don't have a
given resolution . In other words, you can 'zoom in' forever and it won't get
blocky. They are printed (or displayed) at the maximum resolution of the printer
or display device.

SVG files are text files full of drawing instructions. I have edited them with a
text editor in the past, but usually it's easier just to modify your R code or
use a graphics editor.

I personally prefer editing the code to generate plots and graphics instead of
editing the plots after the fact, so that it is easily reproducible.

If you print to PNG files, then you are creating a plot at a given resolution.
It literally produces a rectangle of square dots (pixels) each with a specific
color.


|                      |PNG         | SVG                | PDF                |
+----------------------+------------+--------------------+--------------------+
|File size scales with |# of pixels |# of elements (dots,|# of elements (dots,| 
|                      |            |lines, shapes)      |lines, shapes)      | 
+----------------------+------------+--------------------+--------------------+ 
|File type             | binary     | text               | mix of binary/text | 
+----------------------+------------+--------------------+--------------------+ 
|Resolution            | Fixed      | Unlimited*         | Unlimited*         | 
+----------------------+------------+--------------------+--------------------+ 

*You CAN embed PNGs or other pixel-based images within PDFs or SVGs, but then
you lose the advantage of not having to worry about resolution.

In general PDF files are mixtures of text and binary data. However, with R,
graphics are produced as vector graphics.

With R, by default when you print graphics to a PDF file, you are effectively
printing an SVG file to a new page. One nice thing about printing to a PDF file
in R is that each time you print, you get a new page. So if you want to generate
20 images in one file, then just print 20 plots to the same PDF file in R.


| File format  | Editors                                                       |
+--------------+---------------------------------------------------------------+
|PNG           |Gimp, Paint, Photoshop, ...                                    |
+--------------+---------------------------------------------------------------+
|PDF           |Adobe Acrobat,                                                 |
+--------------+---------------------------------------------------------------+
|SVG           |Gimp, Adobe Illustrator, Powerpoint?, text editor              |
+--------------+---------------------------------------------------------------+



``` r
# Don't use X11 for PNG files (especially useful in an HPC environment)
options(bitmapType='cairo')

#Load needed libraries
library(ggplot2)
library(cowplot)

# Create plot 1 and store it as a variable (instead of auto-printing it)
## 
p1 <- ggplot(mtcars, aes(disp, mpg)) + 
  geom_point()

# Ditto for plot 2
p2 <- ggplot(mtcars, aes(qsec, mpg)) +
  geom_point()

#=============================================================================
# Print the plots to a 10x5 inch PDF file

# Create a 10x5 PDF file 
pdf("two_plots_10by5_inches.pdf", width=10, height=5)

# Print each plot as a subplot in a grid, with user-defined labels
plot_grid(p1, p2, labels = c('Aaa', 'Bbb'))

# Close the PDF file
dev.off()
```

```
## png 
##   2
```

``` r
#=============================================================================
# Print the plots to a "10x5 inch" SVG file
svg("two_plots_10by5_inches.svg", width=10, height=5)

# Print to it 
plot_grid(p1, p2, labels = "AUTO") # AUTO in uppercase uses A, B, C, ...

# Close the SVG file
dev.off()
```

```
## png 
##   2
```

``` r
#=============================================================================
# Print the plots to 100x50 pixel PNG file
png("two_plots_100by50_pixels.png", width=100, height=50)

# Print to it 
plot_grid(p1, p2, labels = "auto") # auto in lowercase uses a, b, c, ...

# Close the SVG file
dev.off()
```

```
## png 
##   2
```

``` r
#=============================================================================
# Print the plots to 500x250 pixel PNG file
png("two_plots_500by250_pixels.png", width=500, height=250)

# Print to it 
plot_grid(p1, p2, labels = "auto")

# Close the SVG file
dev.off()
```

```
## png 
##   2
```

``` r
#=============================================================================
# Print the plots to 1000x500 pixel PNG file
png("two_plots_1000by500_pixels.png", width=1000, height=500)

# Print to it 
plot_grid(p1, p2, labels = "auto")

# Close the SVG file
dev.off()
```

```
## png 
##   2
```

``` r
see more examples at https://wilkelab.org/cowplot/articles/plot_grid.html

See for example, how they use these options:
* ncol       # number of columns (i.e., plots per row)
* rel_widths # adjust the relative widths of the columns
```

```
## Error in parse(text = input): <text>:2:5: unexpected symbol
## 1: 
## 2: see more
##        ^
```
