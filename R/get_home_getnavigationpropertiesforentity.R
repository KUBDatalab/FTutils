get_home_getnavigationpropertiesforentity <- function(...) {
  ft_get("/Home/GetNavigationPropertiesForEntity", ...)
}


#' Afstemning indeholder overordnet information vedrørende afstemninger.
#' @export
#' @param id Unik identifikation af Aktør
#' @param nummer Afstemningsnummer, fortløbende indenfor en periode af typen samling.
#' @param konklusion Afstemningsresultat, hvor der stemmes om et forslag som helhed (i mods. til ændringsforslag til forslaget) – se også Sag
#' @param vedtaget Angiver om afstemningen om forslaget eller lign. er vedtaget.
#' @param kommentar Afstemningskommentar (ændring af stemmer ved fejlafstemninger)
#' @param mødeid En afstemning foregår i et møde.
#' @param typeid En afstemning har en type.
#' @param sagstrinid En afstemning er tilknyttet et sagstrin, som er en behandling.
#' @param opdateringsdato Filter på opdateringsdato
