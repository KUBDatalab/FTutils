#' Roller, der optræder på relationen mellem sagstrin og aktør.
#' @export
sagstrinaktoerrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("SagstrinAktørRolle", params)
  filter <- build_filter(params, "SagstrinAktørRolle")
  if (!is.null(filter)) {
    ft_get("/api/SagstrinAkt%C3%B8rRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagstrinAkt%C3%B8rRolle", ...)
  }
}


#' Relation mellem et sagstrin og et dokument
#' @export
