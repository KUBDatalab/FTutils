#' Dokumentkategori er en underinddeling af dokumenttype.
#' @export
dokumentkategori <- function(
  id = NULL,
  kategori = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 kategori = kategori,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dokumentkategori", params)
  filter <- build_filter(params, "Dokumentkategori")
  if (!is.null(filter)) {
    ft_get("/api/Dokumentkategori", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dokumentkategori", ...)
  }
}


#' Betegner dokumentets tilstand. Et færdigtbearbejdet dokument angives som ´Endelig´. Kun endelige dokumenter udstilles i Åbne Data. ´Tilbagetaget´ angiver, at et endeligt dokument er taget tilbage (fx af et spørgsmåls stiller)
#' @export
