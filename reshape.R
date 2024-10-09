#!/bin/env Rscript
library(tidyr)    # %>% and pivot_wider function
library(reshape2) # dcast function

# Add a dummy location column to the example data set "iris"
location <- c(rep(rep(letters[1:5], each = 10), 3))

iris2 <- cbind(iris, location = location) %>%
         group_by(location, Species) %>%
         summarize(max_sepal_length = max(Sepal.Length))

# Using pivot_wider from tidyr
iris2 %>%
  pivot_wider(id_cols = location,
              names_from = Species,
              values_from = max_sepal_length) %>%
  head()

# Using dcast from reshap2
iris2 %>%
  dcast(location ~ Species, value.var = "max_sepal_length") %>%
  head()
