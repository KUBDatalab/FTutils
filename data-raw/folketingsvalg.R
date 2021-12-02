# code to prepare 'folketingsvalg' dataset


library(lubridate)
folketingsvalg <- c(
"1953-09-22",
"1957-05-14",
"1960-11-15",
"1964-09-22",
"1966-11-22",
"1968-01-23",
"1971-09-21",
"1973-12-04",
"1975-01-09",
"1977-02-15",
"1979-10-23",
"1981-12-08",
"1984-01-10",
"1987-09-08",
"1988-05-10",
"1990-12-12",
"1994-09-21",
"1998-03-11",
"2001-11-20",
"2005-02-08",
"2007-11-13",
"2011-09-15",
"2015-06-18",
"2019-06-05"
)

folketingsvalg <- ymd(folketingsvalg)
usethis::use_data(folketingsvalg, overwrite = TRUE)
#' @name folketingsvalg
#' @export
"folketingsvalg"

