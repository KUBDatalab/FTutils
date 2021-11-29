#'  Returner samlinger
#' @description
#'  Returnerer samling for en given dato
#' @title sammlinger_dato
#' @details samlinger_dato
#' @param x en teksstreng formatteret som YYYY-MM-DD
#' @export
#' @examples
#' # Returnerer 20201 for 1. samling i 2020:
#' which_assembly("2021-04-01")
#'
require(readr)

samlinger_dato <- read_csv("data-raw/samlinger_dato.csv") %>%
  mutate(period = interval(Startdato, Slutdato))

usethis::use_data(samlinger_dato, overwrite = TRUE)
