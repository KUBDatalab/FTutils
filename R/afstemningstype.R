#' Typen af afstemning
#' @export
#' @param id Unik identifikation af afstemningstype
#' @param type En afstemning har en type.
#' @param opdateringsdato Filter på opdateringsdato
afstemningstype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Afstemningstype", params)
  filter <- build_filter(params, "Afstemningstype")
  if (!is.null(filter)) {
    ft_get("/api/Afstemningstype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Afstemningstype", ...)
  }
}


