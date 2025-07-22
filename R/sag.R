#' En sag er en forekomst af de sagstyper (se Sagstype), der behandles i det parlamentariske arbejde, og som er beskrevet i Folketingets forretningsorden
#' @export
sag <- function(
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
  validate_entity_params("Sag", params)
  filter <- build_filter(params, "Sag")
  if (!is.null(filter)) {
    ft_get("/api/Sag", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sag", ...)
  }
}


#' Relationen mellem en sag og aktør (person eller gruppe) med en rolle – fx en sags ´Forslagsstiller´ (person), ´Henvist til´(gruppe)
#' @export
