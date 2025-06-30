#' Relation mellem et emneord og en sag
#' @export
#' @param id Unik identifikation af relationen imellem emneord og sag
#' @param emneordid ID for emneordet
#' @param sagid ID for sagen
#' @param opdateringsdato Filter på opdateringsdato
emneordsag <- function(
  id = NULL,
  emneordid = NULL,
  sagid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 emneordid = emneordid,
                 sagid = sagid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("EmneordSag", params)
  filter <- build_filter(params, "EmneordSag")
  if (!is.null(filter)) {
    ft_get("/api/EmneordSag", `$filter` = filter, ... )
  } else {
    ft_get("/api/EmneordSag", ...)
  }
}


#' Typen af emneord
#' @export
#' @param id Unik identifikation af emneordstype
#' @param type Kode for typerne: Kontrolleret, Ukontrolleret, Lovsagsnavn, Thesaurus (eurovoc), Kontonummer, Sagsområde
#' @param opdateringsdato Filter på opdateringsdato
