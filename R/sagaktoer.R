#' Relationen mellem en sag og aktør (person eller gruppe) med en rolle – fx en sags ´Forslagsstiller´ (person), ´Henvist til´(gruppe)
#' @export
sagaktoer <- function(
  id = NULL,
  aktørid = NULL,
  sagid = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 aktørid = aktørid,
                 sagid = sagid,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("SagAktør", params)
  filter <- build_filter(params, "SagAktør")
  if (!is.null(filter)) {
    ft_get("/api/SagAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagAkt%C3%B8r", ...)
  }
}


#' Relationen mellem en sag og aktør (person eller gruppe) med en rolle – fx en sags ´Forslagsstiller´ (person), ´Henvist til´(gruppe)
#' @export
