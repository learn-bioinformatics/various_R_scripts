#!/bin/env Rscript

dfX <- data.frame(name = c("A","C","E","F","G"), dataX = c(1,2,3,4,5))
dfY <- data.frame(name = c("A","C","E","F","H"), dataY = c(10,20,30,40,60))
dfZ <- data.frame(name = c("A","C","E","F","J"), dataZ = c(10,20,30,40,80))

cat("Data frame X:\n")
print(dfX)

cat("\nData frame Y:\n") # Starts with newline to space out data frames
print(dfY)

cat("\nData frame Z:\n")
print(dfZ)

cat("\nMerged data frames, keeping only those records found in all three:\n")
dfIntersecting <- Reduce( function(x,y) merge(x,y,by="name"), list(dfX,dfY,dfZ))
print(dfIntersecting)

cat("\nMerged data frames, keeping all records, including those not found in all three:\n")
dfALL <- Reduce( function(x,y) merge(x,y,by="name",all=TRUE), list(dfX,dfY,dfZ))
print(dfALL)
