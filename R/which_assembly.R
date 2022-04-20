#'  Returner samlinger
#' @description
#'  Returnerer samling for en given dato
#' @title which_assembly
#' @details which_assembly
#' @param x en teksstreng formatteret som YYYY-MM-DD
#' @name which_assembly
#' @export
#' @importFrom lubridate %within%
#' @import lubridate
#' @examples
#' # Returnerer 20201 for 1. samling i 2020:
#' library(FTutils)
#' which_assembly("2021-04-01")

require(tidyverse)
require(lubridate)
library(readxl)
library(dplyr)


which_assembly <- function(date){
  assemb <- FTutils::samlinger_dato
  if (is.character(date) == FALSE) {
    stop("Error - Remember that the date should be in quotes and in a format like this: 'YYYY-MM-DD'")
  } else if (stringr::str_detect(date, "^\\d{4}-\\d{2}-\\d{2}$") == TRUE) {
    matched_samling <- assemb %>%
      dplyr::mutate(match = (ymd(date) %within% period)) %>%
      dplyr::filter(match) %>%
      dplyr::pull(Samling)
    matched_samling
  } else if(str_detect(date, "^\\d{4}-\\d{2}-\\d{2}:\\d{4}-\\d{2}-\\d{2}$") == TRUE) {
    periods <- str_split(date, ":")
    matched_period <-assemb %>%
      mutate(interval_over = int_overlaps(interval(ymd(periods[[1]][1]), ymd(periods[[1]][2])), period)) %>%
      dplyr::filter(interval_over) %>%
      pull(Samling)

    matched_period
  } else {
    stop('Dates must be given in the ISO 8601-format("YYYY-MM-DD") and periods in the format "YYYY-MM-DD:YYYY-MM-DD"')
  }
}

