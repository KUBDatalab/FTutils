# code to prepare `partier` dataset goes here

ugedage <- c("Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag")
usethis::use_data(ugedage, overwrite = TRUE)

#' @name ugedage
#' @export
"ugedage"
