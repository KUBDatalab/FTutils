#' Emneord er "tags" som tilknyttes sager og dokumentation til brug for søgning eller lignende.
#' @export
#' @param id Unik identifikation af emneord
#' @param typeid Kode for typerne: Kontrolleret, Ukontrolleret, Lovsagsnavn, Thesaurus (eurovoc), Kontonummer, Sagsområde
#' @param emneord Navnet på emneord f.eks. "integration", "aktier og værdipapirer" etc.
#' @param opdateringsdato Filter på opdateringsdato
emneord <- function(
  id = NULL,
  typeid = NULL,
  emneord = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 typeid = typeid,
                 emneord = emneord,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Emneord", params)
  filter <- build_filter(params, "Emneord")
  if (!is.null(filter)) {
    ft_get("/api/Emneord", `$filter` = filter, ... )
  } else {
    ft_get("/api/Emneord", ...)
  }
}


#' Relation mellem emneord og dokument
#' @export
#' @param id Unik identifikation af relationen imellem emneord og dokument
#' @param emneordid ID for emneordet
#' @param dokumentid ID for dokumentet
#' @param opdateringsdato Filter på opdateringsdato
