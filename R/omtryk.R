#' I tilfælde af væsentlige mangler og fejl  i allerede offentliggjorte dokumenter eller ved ændringer i disses tilstand (fx tilbagetagelse) omtrykkes dokumenterne.
#' @export
omtryk <- function(
  id = NULL,
  dokumentid = NULL,
  dato = NULL,
  begrundelse = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 dokumentid = dokumentid,
                 dato = dato,
                 begrundelse = begrundelse,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Omtryk", params)
  filter <- build_filter(params, "Omtryk")
  if (!is.null(filter)) {
    ft_get("/api/Omtryk", `$filter` = filter, ... )
  } else {
    ft_get("/api/Omtryk", ...)
  }
}


#' En Periode er et datointerval, der kan være  navngiven , ved den titel, kode og type.
#' @export
