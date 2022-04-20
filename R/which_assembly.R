#'  Returner samlinger
#' @description
#'  Returnerer samling for en given dato
#' @title which_assembly
#' @details which_assembly
#' @param x en teksstreng formatteret som YYYY-MM-DD
#' @name which_assembly
#' @export
#'
#' @examples
#' # Returnerer 20201 for 1. samling i 2020:
#' which_assembly("2021-04-01")

library(tidyverse)
library(lubridate)
library(readxl)


data("samlinger_dato")
assemb <- samlinger_dato %>%
  mutate(period = interval(Startdato, Slutdato))



which_assembly <- function(date){
  if (is.character(date) == FALSE) {
    stop("Error - Remember that the date should be in quotes and in a format like this: 'YYYY-MM-DD'")
  } else if (str_detect(date, "^\\d{4}-\\d{2}-\\d{2}$") == TRUE) {
    matched_samling <- assemb %>%
      mutate(match = (ymd(date) %within% period)) %>%
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

