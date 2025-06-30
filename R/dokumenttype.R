dokumenttype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dokumenttype", params)
  filter <- build_filter(params, "Dokumenttype")
  if (!is.null(filter)) {
    ft_get("/api/Dokumenttype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dokumenttype", ...)
  }
}


#' Emneord er "tags" som tilknyttes sager og dokumentation til brug for søgning eller lignende.
#' @export
#' @param id Unik identifikation af emneord
#' @param typeid Kode for typerne: Kontrolleret, Ukontrolleret, Lovsagsnavn, Thesaurus (eurovoc), Kontonummer, Sagsområde
#' @param emneord Navnet på emneord f.eks. "integration", "aktier og værdipapirer" etc.
#' @param opdateringsdato Filter på opdateringsdato
