#' Relation imellem Person og Gruppe. Alternativt Gruppe og Gruppe.
#' @export
aktoeraktoer <- function(
  id = NULL,
  fraaktørid = NULL,
  tilaktørid = NULL,
  startdato = NULL,
  slutdato = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 fraaktørid = fraaktørid,
                 tilaktørid = tilaktørid,
                 startdato = startdato,
                 slutdato = slutdato,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("AktørAktør", params)
  filter <- build_filter(params, "AktørAktør")
  if (!is.null(filter)) {
    ft_get("/api/Akt%C3%B8rAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/Akt%C3%B8rAkt%C3%B8r", ...)
  }
}


#' Rolle, der beskriver relationen mellem Person og Gruppe (fx ´Medlem´, ´Orlov med vederlag´)
#' @export
