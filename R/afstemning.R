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
afstemning <- function(
  id = NULL,
  nummer = NULL,
  konklusion = NULL,
  vedtaget = NULL,
  kommentar = NULL,
  mødeid = NULL,
  typeid = NULL,
  sagstrinid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 nummer = nummer,
                 konklusion = konklusion,
                 vedtaget = vedtaget,
                 kommentar = kommentar,
                 mødeid = mødeid,
                 typeid = typeid,
                 sagstrinid = sagstrinid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Afstemning", params)
  filter <- build_filter(params, "Afstemning")
  if (!is.null(filter)) {
    ft_get("/api/Afstemning", `$filter` = filter, ... )
  } else {
    ft_get("/api/Afstemning", ...)
  }
}


#' Typen af afstemning
#' @export
#' @param id Unik identifikation af afstemningstype
#' @param type En afstemning har en type.
#' @param opdateringsdato Filter på opdateringsdato
