#' Et Møde er et møde i Folketingets plenum (´Møde i salen´) eller et udvalg (´Udvalgsmøde´), se Mødetype.
#' @export
moede <- function(
  id = NULL,
  titel = NULL,
  lokale = NULL,
  nummer = NULL,
  dagsordenurl = NULL,
  starttidsbemærkning = NULL,
  offentlighedskode = NULL,
  dato = NULL,
  statusid = NULL,
  typeid = NULL,
  periodeid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 titel = titel,
                 lokale = lokale,
                 nummer = nummer,
                 dagsordenurl = dagsordenurl,
                 starttidsbemærkning = starttidsbemærkning,
                 offentlighedskode = offentlighedskode,
                 dato = dato,
                 statusid = statusid,
                 typeid = typeid,
                 periodeid = periodeid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Møde", params)
  filter <- build_filter(params, "Møde")
  if (!is.null(filter)) {
    ft_get("/api/M%C3%B8de", `$filter` = filter, ... )
  } else {
    ft_get("/api/M%C3%B8de", ...)
  }
}


#' Relationen mellem et Møde og en Gruppe
#' @export
