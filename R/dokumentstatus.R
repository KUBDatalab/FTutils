#' Betegner dokumentets tilstand. Et færdigtbearbejdet dokument angives som ´Endelig´. Kun endelige dokumenter udstilles i Åbne Data. ´Tilbagetaget´ angiver, at et endeligt dokument er taget tilbage (fx af et spørgsmåls stiller)
#' @export
dokumentstatus <- function(
  id = NULL,
  status = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 status = status,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dokumentstatus", params)
  filter <- build_filter(params, "Dokumentstatus")
  if (!is.null(filter)) {
    ft_get("/api/Dokumentstatus", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dokumentstatus", ...)
  }
}


