#' Relationen mellem et Møde og en Gruppe
#' @export
moedeaktoer <- function(
  id = NULL,
  mødeid = NULL,
  aktørid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 mødeid = mødeid,
                 aktørid = aktørid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("MødeAktør", params)
  filter <- build_filter(params, "MødeAktør")
  if (!is.null(filter)) {
    ft_get("/api/M%C3%B8deAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/M%C3%B8deAkt%C3%B8r", ...)
  }
}


#' Mødestatus udtrykker status for afholdelse af mødet.
#' @export
