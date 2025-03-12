#!/bin/env -S Rscript --vanilla

# You can build up one string with spaces, tabs, and newlines separating the 
# "words"                                    # one+ whitespace characters
space_split <- function(x) unlist(strsplit(x, "\\s+"))

#                            tabs
#                       space| |newline
#                           || ||
my_letters <- space_split("A 	B	
                          C D")
# |                      |
# +---- many spaces -----+
                  # Outputs:
print(my_letters) # [1] "A" "B" "C" "D" 
