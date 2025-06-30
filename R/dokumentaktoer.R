#' Relationen mellem dokument og aktør med en rolle – fx (et spørgsmåls) ´Stiller´ og ´Adressat´ (modtager)
#' @export
dokumentaktoer <- function(
  id = NULL,
  dokumentid = NULL,
  aktørid = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 dokumentid = dokumentid,
                 aktørid = aktørid,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("DokumentAktør", params)
  filter <- build_filter(params, "DokumentAktør")
  if (!is.null(filter)) {
    ft_get("/api/DokumentAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/DokumentAkt%C3%B8r", ...)
  }
}


#' Roller, der optræder på relationen mellem dokument og aktør.
#' @export
