#' Et Sagstrin er en aktivitet i forhold til en Sag. En sag kan have tilknyttet flere sagstrin i et forretningsbestemt forløb  
#' @export
sagstrin <- function(
  id = NULL,
  titel = NULL,
  dato = NULL,
  sagid = NULL,
  typeid = NULL,
  folketingstidendeurl = NULL,
  folketingstidende = NULL,
  folketingstidendesidenummer = NULL,
  statusid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 titel = titel,
                 dato = dato,
                 sagid = sagid,
                 typeid = typeid,
                 folketingstidendeurl = folketingstidendeurl,
                 folketingstidende = folketingstidende,
                 folketingstidendesidenummer = folketingstidendesidenummer,
                 statusid = statusid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagstrin", params)
  filter <- build_filter(params, "Sagstrin")
  if (!is.null(filter)) {
    ft_get("/api/Sagstrin", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagstrin", ...)
  }
}


#' En Aktør er tilknyttet et Sagstrin via en rolle.
#' @export
