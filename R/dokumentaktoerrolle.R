#' Roller, der optræder på relationen mellem dokument og aktør.
#' @export
dokumentaktoerrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("DokumentAktørRolle", params)
  filter <- build_filter(params, "DokumentAktørRolle")
  if (!is.null(filter)) {
    ft_get("/api/DokumentAkt%C3%B8rRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/DokumentAkt%C3%B8rRolle", ...)
  }
}


#' Dokumentkategori er en underinddeling af dokumenttype.
#' @export
