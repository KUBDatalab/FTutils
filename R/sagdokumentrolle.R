#' Roller, der optræder på relationen mellem en sag og et dokument
#' @export
sagdokumentrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("SagDokumentRolle", params)
  filter <- build_filter(params, "SagDokumentRolle")
  if (!is.null(filter)) {
    ft_get("/api/SagDokumentRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagDokumentRolle", ...)
  }
}


#' En Sagskategori er en evt. undertype af Sagstype.
#' @export
