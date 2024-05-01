library(tidyr)
df <- data.frame(
        vdj_region = c("AAAA",
                       "CCCC",
                       "DDDD",
                       "EEEE",
                       "FFFF",
                       "GGGG"),
        stuff=c(":B:12:D::F:GAPDH",
                ":X:25:Y:H:I:ADH",
                "::45:Z:I:J:LDH",
                "::17:A:B:C:enolase",
                "::346:D:E:F:RNAPolI",
                "Q:W:E:R:T:Y:DNAPol")
      )

df2 <- df %>%
          separate_wider_delim(stuff,
                               delim = ":",
                               names = c(NA,
                                         NA,
                                         "ID",
                                         NA,
                                         NA,
                                         NA,
                                         "GeneName")
          )
print(df2)
