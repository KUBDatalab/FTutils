aktstykke <- function(
  id = NULL,
  typeid = NULL,
  kategoriid = NULL,
  statusid = NULL,
  titel = NULL,
  titelkort = NULL,
  offentlighedskode = NULL,
  nummer = NULL,
  nummerprefix = NULL,
  nummernumerisk = NULL,
  nummerpostfix = NULL,
  resume = NULL,
  afstemningskonklusion = NULL,
  periodeid = NULL,
  afgørelsesresultatkode = NULL,
  baggrundsmateriale = NULL,
  opdateringsdato = NULL,
  statsbudgetsag = NULL,
  begrundelse = NULL,
  paragrafnummer = NULL,
  paragraf = NULL,
  afgørelsesdato = NULL,
  afgørelse = NULL,
  rådsmødedato = NULL,
  lovnummer = NULL,
  lovnummerdato = NULL,
  retsinformationsurl = NULL,
  fremsatundersagid = NULL,
  deltundersagid = NULL,
  ...) {
  params <- list(
                 id = id,
                 typeid = typeid,
                 kategoriid = kategoriid,
                 statusid = statusid,
                 titel = titel,
                 titelkort = titelkort,
                 offentlighedskode = offentlighedskode,
                 nummer = nummer,
                 nummerprefix = nummerprefix,
                 nummernumerisk = nummernumerisk,
                 nummerpostfix = nummerpostfix,
                 resume = resume,
                 afstemningskonklusion = afstemningskonklusion,
                 periodeid = periodeid,
                 afgørelsesresultatkode = afgørelsesresultatkode,
                 baggrundsmateriale = baggrundsmateriale,
                 opdateringsdato = opdateringsdato,
                 statsbudgetsag = statsbudgetsag,
                 begrundelse = begrundelse,
                 paragrafnummer = paragrafnummer,
                 paragraf = paragraf,
                 afgørelsesdato = afgørelsesdato,
                 afgørelse = afgørelse,
                 rådsmødedato = rådsmødedato,
                 lovnummer = lovnummer,
                 lovnummerdato = lovnummerdato,
                 retsinformationsurl = retsinformationsurl,
                 fremsatundersagid = fremsatundersagid,
                 deltundersagid = deltundersagid
  )
  validate_entity_params("Aktstykke", params)
  filter <- build_filter(params, "Aktstykke")
  if (!is.null(filter)) {
    ft_get("/api/Aktstykke", `$filter` = filter, ... )
  } else {
    ft_get("/api/Aktstykke", ...)
  }
}


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
