library(tidyverse)
library(tidyr)


jia <- read_csv(
  "1-1.txt", 
  col_types=cols(
    .default = col_double(),  )
  )

na.omit(jia)

max_value <- max(jia$LoadValue)
