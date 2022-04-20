## code to prepare `samlinger_dato` dataset goes here
samlinger_dato <- readr::read_csv("data-raw/samlinger_dato.csv") %>%
  mutate(period = interval(Startdato, Slutdato))
usethis::use_data(samlinger_dato, overwrite = TRUE)

#' @name samlinger_dato
#' @export
"samlinger_dato"
