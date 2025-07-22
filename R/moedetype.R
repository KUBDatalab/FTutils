#' Mødetypen angiver, om mødet er i Folketingets plenum (´Møde i salen´)  eller i et udvalg (´Udvalgsmøde´).
#' @export
moedetype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Mødetype", params)
  filter <- build_filter(params, "Mødetype")
  if (!is.null(filter)) {
    ft_get("/api/M%C3%B8detype", `$filter` = filter, ... )
  } else {
    ft_get("/api/M%C3%B8detype", ...)
  }
}


#' I tilfælde af væsentlige mangler og fejl  i allerede offentliggjorte dokumenter eller ved ændringer i disses tilstand (fx tilbagetagelse) omtrykkes dokumenterne.
#' @export
