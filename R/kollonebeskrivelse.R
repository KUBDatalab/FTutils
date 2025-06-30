#' Indeholder metadata beskrivelser for de enkelte kolloner i entiteterne. Beskrivelsen er den der benyttes i databrowseren.
#' @export
kollonebeskrivelse <- function(
  id = NULL,
  entitetnavn = NULL,
  kollonenavn = NULL,
  beskrivelse = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 entitetnavn = entitetnavn,
                 kollonenavn = kollonenavn,
                 beskrivelse = beskrivelse,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("KolloneBeskrivelse", params)
  filter <- build_filter(params, "KolloneBeskrivelse")
  if (!is.null(filter)) {
    ft_get("/api/KolloneBeskrivelse", `$filter` = filter, ... )
  } else {
    ft_get("/api/KolloneBeskrivelse", ...)
  }
}


#' Et Møde er et møde i Folketingets plenum (´Møde i salen´) eller et udvalg (´Udvalgsmøde´), se Mødetype.
#' @export
