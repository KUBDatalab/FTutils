#' Angiver type  af aktivitet – fx 1. behandling Sagstrinstyper er sagstypespecifikke.
#' @export
sagstrinstype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagstrinstype", params)
  filter <- build_filter(params, "Sagstrinstype")
  if (!is.null(filter)) {
    ft_get("/api/Sagstrinstype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagstrinstype", ...)
  }
}


#' De typer sager, der behandles i det parlamentariske arbejde, jf. Folketingets forretningsorden.
#' @export
