## code to prepare `samlinger_dato` dataset goes here
samlinger_dato <- read_csv("data-raw/samlinger_dato.csv")
usethis::use_data(samlinger_dato, overwrite = TRUE)
