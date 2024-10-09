#!/bin/env Rscript
## Load packages

library(ggplot2)
library(gridExtra)


##Create Fake Data for the eventual plots

gene=c("Abc", "def", "ghi")
data1=as.data.frame(matrix(data = NA, nrow = 20, ncol = 3))
names(data1)=c("Sample", "Gene", "Pct")
data1$Sample=sample(c("Pop1", "Pop2", "Pop3"),replace=T,20)
data1$Gene=sample(gene, replace=T, 20)
data1$Pct=rnorm(20, mean = 0, sd=1)


## Create Plots 

one=ggplot(data = data1, mapping = aes(x=Sample, y=Pct, fill=Gene))+
  geom_bar(stat = "identity", position = "dodge")+
  scale_fill_manual("legend", values = c("A" = "green3", "B" = "blue2", "C" = "green3"))+ggtitle(label = "Plot 1")


two=ggplot(data = data1, mapping = aes(x=Sample, y=Pct, fill=Gene))+
  geom_point()+
  scale_fill_manual("legend", values = c("A" = "lightblue", "B" = "blue2", "C" = "green3"))+ggtitle(label = "Plot 2")

three=ggplot(data = data1, mapping = aes(x=Sample, y=Pct, fill=Gene, col="green"))+
  geom_bar(stat = "identity", position = "dodge")+
  ggtitle(label = "Plot 3")

four=ggplot(data = data1, mapping = aes(x=Sample, y=Pct, fill=Gene))+
  geom_jitter(shape=2)+
  ggtitle(label = "Plot 4")


## Arrange using grid.arrange function from grid.extra package

## Use "widths" to define how many partitions to create within the matrix
## Use layout_matrix to define where the plots go. They will be ordered numbers
## the same way as they are input as ggplot objects. 

grid.arrange(one,two,three,four,
             widths = c(1,1, 1, 1),
             layout_matrix = rbind(c(1, 1, 1,2),
                                   c(3, 3,4, 2))
)

grid.arrange(one,two,three,four,
             widths = c(2,1, 1),
             layout_matrix = rbind(c(1, 1, NA),
                                   c(2,3,4))
)

## Can also just simply define number of rows and columns if you want to be uniform


grid.arrange(one,two,three,four,
             ncol = 2, 
             nrow = 2
)
