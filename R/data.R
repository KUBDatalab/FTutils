#' FTutils
#'
#' Useful functions and tools for working with Danish parlamentary data.
#'
NULL

#' "Datoer for folketingssamlinger"
#'
#' Et datasæt der indeholder start og slutdatoer for folketingssamlinger
#' mellem 6. oktober 1953 og 1. december 2021
#'
#' @source \url{https://www.gutenberg.org/files/524/524-0.txt}
#' @format A tibble with 92 rows
#' \describe{
#'   \item{Col1}{description of Col1}
#'   \item{Col2}{description of Col2}
#'   }
"samlinger_dato"

#' Partier
#'
#' Et datasæt der indeholder partinavne og listebogstaver
#' for partier i folketinget i perioden fra - til
#'
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{bogstav}{parti liste bogstav}
#'   \item{navn}{partinavn}
#'   ...
#' }
#'
#'
"partier"


#' Ugedagenes navne på dansk
#'
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
"ugedage"

#' Traktordata fra Maxs fædrende gaard
#'
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
"traktor"
