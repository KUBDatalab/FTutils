dagsordenspunktsag <- function(
  id = NULL,
  dagsordenspunktid = NULL,
  sagid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 dagsordenspunktid = dagsordenspunktid,
                 sagid = sagid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("DagsordenspunktSag", params)
  filter <- build_filter(params, "DagsordenspunktSag")
  if (!is.null(filter)) {
    ft_get("/api/DagsordenspunktSag", `$filter` = filter, ... )
  } else {
    ft_get("/api/DagsordenspunktSag", ...)
  }
}


