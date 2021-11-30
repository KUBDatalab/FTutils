## code to prepare `DATASET` dataset goes here

require(readr)
require(dplyr)
require(lubridate)
DATASET <- read_csv("data-raw/samlinger_dato.csv") %>%
  mutate(period = interval(Startdato, Slutdato))

usethis::use_data(DATASET, overwrite = TRUE)
