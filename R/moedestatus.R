#' Mødestatus udtrykker status for afholdelse af mødet.
#' @export
moedestatus <- function(
  id = NULL,
  status = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 status = status,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Mødestatus", params)
  filter <- build_filter(params, "Mødestatus")
  if (!is.null(filter)) {
    ft_get("/api/M%C3%B8destatus", `$filter` = filter, ... )
  } else {
    ft_get("/api/M%C3%B8destatus", ...)
  }
}


#' Mødetypen angiver, om mødet er i Folketingets plenum (´Møde i salen´)  eller i et udvalg (´Udvalgsmøde´).
#' @export
