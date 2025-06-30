#' En Periode er et datointerval, der kan være  navngiven , ved den titel, kode og type.
#' @export
periode <- function(
  id = NULL,
  startdato = NULL,
  slutdato = NULL,
  type = NULL,
  kode = NULL,
  titel = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 startdato = startdato,
                 slutdato = slutdato,
                 type = type,
                 kode = kode,
                 titel = titel,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Periode", params)
  filter <- build_filter(params, "Periode")
  if (!is.null(filter)) {
    ft_get("/api/Periode", `$filter` = filter, ... )
  } else {
    ft_get("/api/Periode", ...)
  }
}


#' En sag er en forekomst af de sagstyper (se Sagstype), der behandles i det parlamentariske arbejde, og som er beskrevet i Folketingets forretningsorden
#' @export
