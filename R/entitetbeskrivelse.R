#' Indeholder metadata beskrivelser for de enkelte entiteter. Beskrivelsen er den der benyttes i databrowseren
#' @export
entitetbeskrivelse <- function(
  id = NULL,
  entitetnavn = NULL,
  beskrivelse = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 entitetnavn = entitetnavn,
                 beskrivelse = beskrivelse,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("EntitetBeskrivelse", params)
  filter <- build_filter(params, "EntitetBeskrivelse")
  if (!is.null(filter)) {
    ft_get("/api/EntitetBeskrivelse", `$filter` = filter, ... )
  } else {
    ft_get("/api/EntitetBeskrivelse", ...)
  }
}


