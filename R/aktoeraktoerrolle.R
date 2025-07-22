#' Rolle, der beskriver relationen mellem Person og Gruppe (fx ´Medlem´, ´Orlov med vederlag´)
#' @export
aktoeraktoerrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("AktørAktørRolle", params)
  filter <- build_filter(params, "AktørAktørRolle")
  if (!is.null(filter)) {
    ft_get("/api/Akt%C3%B8rAkt%C3%B8rRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/Akt%C3%B8rAkt%C3%B8rRolle", ...)
  }
}


