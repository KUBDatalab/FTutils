#' Type af stemme
#' @export
#' @param id Unik identifikation af stemmetype
#' @param type Stemme type
#' @param opdateringsdato Filter på opdateringsdato
stemmetype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Stemmetype", params)
  filter <- build_filter(params, "Stemmetype")
  if (!is.null(filter)) {
    ft_get("/api/Stemmetype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Stemmetype", ...)
  }
}
