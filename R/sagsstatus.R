#' Sagsstatus angiver, hvor langt Sagen er nået i sin behandling.
#' @export
sagsstatus <- function(
  id = NULL,
  status = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 status = status,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagsstatus", params)
  filter <- build_filter(params, "Sagsstatus")
  if (!is.null(filter)) {
    ft_get("/api/Sagsstatus", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagsstatus", ...)
  }
}


#' Et Sagstrin er en aktivitet i forhold til en Sag. En sag kan have tilknyttet flere sagstrin i et forretningsbestemt forløb  
#' @export
