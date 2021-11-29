#' Ugedagenes navne på dansk
#'
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#'
#' @export
#'
require(readr)

samlinger_dato <- read_csv("data-raw/samlinger_dato.csv") %>%
  mutate(period = interval(Startdato, Slutdato))

usethis::use_data(samlinger_dato, overwrite = TRUE)
