#' Stemme udtrykker et  medlems indstilling (for, imod, hverken for eller imod) til et givent anliggende, der er genstand for en afstemning.
#' @export
#' @param id Unik identifikation af stemme
#' @param typeid For, imod, hverken for eller imod, fraværende, valgmulighed
#' @param afstemningid En afstemning er medlemmernes stemmeaf-givelse.
#' @param aktørid ID for aktøren
#' @param opdateringsdato Filter på opdateringsdato
stemme <- function(
  id = NULL,
  typeid = NULL,
  afstemningid = NULL,
  aktørid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 typeid = typeid,
                 afstemningid = afstemningid,
                 aktørid = aktørid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Stemme", params)
  filter <- build_filter(params, "Stemme")
  if (!is.null(filter)) {
    ft_get("/api/Stemme", `$filter` = filter, ... )
  } else {
    ft_get("/api/Stemme", ...)
  }
}


#' Type af stemme
#' @export
#' @param id Unik identifikation af stemmetype
#' @param type Stemme type
#' @param opdateringsdato Filter på opdateringsdato
