#' De typer sager, der behandles i det parlamentariske arbejde, jf. Folketingets forretningsorden.
#' @export
sagstype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagstype", params)
  filter <- build_filter(params, "Sagstype")
  if (!is.null(filter)) {
    ft_get("/api/Sagstype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagstype", ...)
  }
}


