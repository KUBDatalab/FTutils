#' @name samlinger_dato
#' @export

require(readr)
require(dplyr)
require(lubridate)
samlinger_dato <- read_csv("data-raw/samlinger_dato.csv") %>%
  mutate(period = interval(Startdato, Slutdato))

usethis::use_data(samlinger_dato, overwrite = TRUE)
