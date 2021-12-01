## code to prepare `partier` dataset goes here

# vi skal have styr på partier der skifter bogstav.
# det skal nok også over i en csv.
library(tibble)

partier <- tribble(~bogstav, ~navn,
"D", "Nye Borgerlige",
"K", "Kristendemokraterne",
"E", "Klaus Riskær Pedersen",
"P", "Stram Kurs",
"A", "Socialdemokratiet",
"O", "Dansk Folkeparti",
"V", "Venstre, Danmarks Liberale Parti",
"Ø", "Enhedslisten – De Rød-Grønne",
"I", "Liberal Alliance",
"Å", "Alternativet",
"B", "Radikale Venstre",
"F", "SF – Socialistisk Folkeparti",
"C", "Det Konservative Folkeparti")

usethis::use_data(partier, overwrite = TRUE)

#' @name partier
#' @export
"partier"
