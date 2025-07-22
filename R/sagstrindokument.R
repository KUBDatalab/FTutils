#' Relation mellem et sagstrin og et dokument
#' @export
sagstrindokument <- function(
  id = NULL,
  sagstrinid = NULL,
  dokumentid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 sagstrinid = sagstrinid,
                 dokumentid = dokumentid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("SagstrinDokument", params)
  filter <- build_filter(params, "SagstrinDokument")
  if (!is.null(filter)) {
    ft_get("/api/SagstrinDokument", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagstrinDokument", ...)
  }
}


#' Angiver status for Sagstrinnet.
#' @export
