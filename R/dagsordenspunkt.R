#' Et Dagsordenspunkt er et emne, der behandles på  et møde i en Gruppe.
#' @export
dagsordenspunkt <- function(
  id = NULL,
  kørebemærkning = NULL,
  titel = NULL,
  kommentar = NULL,
  nummer = NULL,
  forhandlingskode = NULL,
  forhandling = NULL,
  superid = NULL,
  sagstrinid = NULL,
  mødeid = NULL,
  offentlighedskode = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 kørebemærkning = kørebemærkning,
                 titel = titel,
                 kommentar = kommentar,
                 nummer = nummer,
                 forhandlingskode = forhandlingskode,
                 forhandling = forhandling,
                 superid = superid,
                 sagstrinid = sagstrinid,
                 mødeid = mødeid,
                 offentlighedskode = offentlighedskode,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dagsordenspunkt", params)
  filter <- build_filter(params, "Dagsordenspunkt")
  if (!is.null(filter)) {
    ft_get("/api/Dagsordenspunkt", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dagsordenspunkt", ...)
  }
}


