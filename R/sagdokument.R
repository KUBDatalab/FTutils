#' Relationen mellem en sag og aktør (person eller gruppe) med en rolle – fx en sags ´Forslagsstiller´ (person), ´Henvist til´(gruppe)
#' @export
sagdokument <- function(
  id = NULL,
  sagid = NULL,
  dokumentid = NULL,
  bilagsnummer = NULL,
  frigivelsesdato = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 sagid = sagid,
                 dokumentid = dokumentid,
                 bilagsnummer = bilagsnummer,
                 frigivelsesdato = frigivelsesdato,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("SagDokument", params)
  filter <- build_filter(params, "SagDokument")
  if (!is.null(filter)) {
    ft_get("/api/SagDokument", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagDokument", ...)
  }
}


#' Roller, der optræder på relationen mellem en sag og et dokument
#' @export
