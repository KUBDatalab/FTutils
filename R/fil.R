#' Indeholder metadata om filer på dokumenter. Se Dokument.
#' @export
fil <- function(
  id = NULL,
  dokumentid = NULL,
  titel = NULL,
  versionsdato = NULL,
  filurl = NULL,
  opdateringsdato = NULL,
  variantkode = NULL,
  format = NULL,
  ...) {
  params <- list(
                 id = id,
                 dokumentid = dokumentid,
                 titel = titel,
                 versionsdato = versionsdato,
                 filurl = filurl,
                 opdateringsdato = opdateringsdato,
                 variantkode = variantkode,
                 format = format
  )
  validate_entity_params("Fil", params)
  filter <- build_filter(params, "Fil")
  if (!is.null(filter)) {
    ft_get("/api/Fil", `$filter` = filter, ... )
  } else {
    ft_get("/api/Fil", ...)
  }
}


