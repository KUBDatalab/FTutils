sambehandlinger <- function(
  id = NULL,
  førstesagstrinid = NULL,
  andetsagstrinid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 førstesagstrinid = førstesagstrinid,
                 andetsagstrinid = andetsagstrinid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sambehandlinger", params)
  filter <- build_filter(params, "Sambehandlinger")
  if (!is.null(filter)) {
    ft_get("/api/Sambehandlinger", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sambehandlinger", ...)
  }
}


#' Stemme udtrykker et  medlems indstilling (for, imod, hverken for eller imod) til et givent anliggende, der er genstand for en afstemning.
#' @export
#' @param id Unik identifikation af stemme
#' @param typeid For, imod, hverken for eller imod, fraværende, valgmulighed
#' @param afstemningid En afstemning er medlemmernes stemmeaf-givelse.
#' @param aktørid ID for aktøren
#' @param opdateringsdato Filter på opdateringsdato
