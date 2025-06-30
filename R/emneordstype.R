#' Typen af emneord
#' @export
#' @param id Unik identifikation af emneordstype
#' @param type Kode for typerne: Kontrolleret, Ukontrolleret, Lovsagsnavn, Thesaurus (eurovoc), Kontonummer, Sagsområde
#' @param opdateringsdato Filter på opdateringsdato
emneordstype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Emneordstype", params)
  filter <- build_filter(params, "Emneordstype")
  if (!is.null(filter)) {
    ft_get("/api/Emneordstype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Emneordstype", ...)
  }
}


#' Indeholder metadata beskrivelser for de enkelte entiteter. Beskrivelsen er den der benyttes i databrowseren
#' @export
