library(tidyverse)
library(lubridate)
library(readxl)


# TODO Embed data in the package
assemb <- read_xlsx("data-raw/samlinger_siden_1953.xlsx")



which_assembly <- function(date){
  if (is.character(date) == FALSE) {
    stop("Error - Remember that the date should be in quotes and in a format like this: 'YYYY-MM-DD'")
  } else if (str_detect(date, "^\\d{4}-\\d{2}-\\d{2}$") == TRUE) {
    matched_samling <- assemb %>%
      mutate(match = ymd(date) %within% period) %>%
      filter(match == TRUE) %>%
      pull(Samling)
    matched_samling
  } else if(str_detect(date, "^\\d{4}-\\d{2}-\\d{2}:\\d{4}-\\d{2}-\\d{2}$") == TRUE) {
    periods <- str_split(date, ":")
    matched_period <-assemb %>%
      mutate(interval_over = int_overlaps(interval(ymd(periods[[1]][1]), ymd(periods[[1]][2])), period)) %>%
      filter(interval_over == TRUE) %>%
      pull(Samling)

    matched_period
  } else {
    stop('Dates must be given in the ISO 8601-format("YYYY-MM-DD") and periods in the format "YYYY-MM-DD:YYYY-MM-DD"')
  }
}