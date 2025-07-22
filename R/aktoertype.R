aktoertype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Aktørtype", params)
  filter <- build_filter(params, "Aktørtype")
  if (!is.null(filter)) {
    ft_get("/api/Akt%C3%B8rtype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Akt%C3%B8rtype", ...)
  }
}


