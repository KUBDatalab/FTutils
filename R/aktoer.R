#' Aktør er en samlet betegnelse for de personer, grupper og organisationer, som har roller i det parlamentariske arbejde.
#' @export
#' @param id Unik identifikation af Aktør
#' @param typeid Intern (person), Udvalg, Parlamentarisk forsamling, Anden gruppe, Folketingsgruppe, Kommission, Ministerområde, Ministertitel
#' @param gruppenavnkort Forkortelse - hvis aktøren er en gruppe (udvalg, kommission, folketingsgruppe)
#' @param navn personens for- og efternavn  - ellers lang form af navn
#' @param fornavn Kun for typen ´Person´
#' @param efternavn Kun for typen ´Person´
#' @param biografi Biografi for personen eller gruppen
#' @param periodeid Kun for udvalg, Folketinget og kommissioner og hverv. I disse tilfælde angiver det gruppens tilknytning til periodetypen ´samling´
#' @param opdateringsdato Filter på opdateringsdato
#' @param startdato Kun for grupper, ministertitler- og -områder
#' @param slutdato Kun for grupper, ministertitler- og -områder
aktoer <- function(
  id = NULL,
  typeid = NULL,
  gruppenavnkort = NULL,
  navn = NULL,
  fornavn = NULL,
  efternavn = NULL,
  biografi = NULL,
  periodeid = NULL,
  opdateringsdato = NULL,
  startdato = NULL,
  slutdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 typeid = typeid,
                 gruppenavnkort = gruppenavnkort,
                 navn = navn,
                 fornavn = fornavn,
                 efternavn = efternavn,
                 biografi = biografi,
                 periodeid = periodeid,
                 opdateringsdato = opdateringsdato,
                 startdato = startdato,
                 slutdato = slutdato
  )
  validate_entity_params("Aktør", params)
  filter <- build_filter(params, "Aktør")
  if (!is.null(filter)) {
    ft_get("/api/Akt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/Akt%C3%B8r", ...)
  }
}


#' Relation imellem Person og Gruppe. Alternativt Gruppe og Gruppe.
#' @export
