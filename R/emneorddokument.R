#' Relation mellem emneord og dokument
#' @export
#' @param id Unik identifikation af relationen imellem emneord og dokument
#' @param emneordid ID for emneordet
#' @param dokumentid ID for dokumentet
#' @param opdateringsdato Filter på opdateringsdato
emneorddokument <- function(
  id = NULL,
  emneordid = NULL,
  dokumentid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 emneordid = emneordid,
                 dokumentid = dokumentid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("EmneordDokument", params)
  filter <- build_filter(params, "EmneordDokument")
  if (!is.null(filter)) {
    ft_get("/api/EmneordDokument", `$filter` = filter, ... )
  } else {
    ft_get("/api/EmneordDokument", ...)
  }
}

#' Relation mellem et emneord og en sag
#' @export
#' @param id Unik identifikation af relationen imellem emneord og sag
#' @param emneordid ID for emneordet
#' @param sagid ID for sagen
#' @param opdateringsdato Filter på opdateringsdato
