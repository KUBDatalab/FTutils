#' Angiver status for Sagstrinnet.
#' @export
sagstrinsstatus <- function(
  id = NULL,
  status = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 status = status,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagstrinsstatus", params)
  filter <- build_filter(params, "Sagstrinsstatus")
  if (!is.null(filter)) {
    ft_get("/api/Sagstrinsstatus", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagstrinsstatus", ...)
  }
}


#' Angiver type  af aktivitet – fx 1. behandling Sagstrinstyper er sagstypespecifikke.
#' @export
