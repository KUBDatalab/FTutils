#' Relationen mellem en sag og aktør (person eller gruppe) med en rolle – fx en sags ´Forslagsstiller´ (person), ´Henvist til´(gruppe)
#' @export
sagaktoerrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("SagAktørRolle", params)
  filter <- build_filter(params, "SagAktørRolle")
  if (!is.null(filter)) {
    ft_get("/api/SagAkt%C3%B8rRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagAkt%C3%B8rRolle", ...)
  }
}


#' Relationen mellem en sag og aktør (person eller gruppe) med en rolle – fx en sags ´Forslagsstiller´ (person), ´Henvist til´(gruppe)
#' @export
