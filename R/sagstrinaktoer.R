#' En Aktør er tilknyttet et Sagstrin via en rolle.
#' @export
sagstrinaktoer <- function(
  id = NULL,
  sagstrinid = NULL,
  aktørid = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 sagstrinid = sagstrinid,
                 aktørid = aktørid,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("SagstrinAktør", params)
  filter <- build_filter(params, "SagstrinAktør")
  if (!is.null(filter)) {
    ft_get("/api/SagstrinAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagstrinAkt%C3%B8r", ...)
  }
}


#' Roller, der optræder på relationen mellem sagstrin og aktør.
#' @export
