debat <- function(
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
  validate_entity_params("Debat", params)
  filter <- build_filter(params, "Debat")
  if (!is.null(filter)) {
    ft_get("/api/Debat", `$filter` = filter, ... )
  } else {
    ft_get("/api/Debat", ...)
  }
}


#' Et dokument er et journalkort med metadata om  en eller flere tilknyttede filer. Spørgsmålsdokumenter indeholder spørgsmåls fulde ordlyd.Se også Dokumenttype og Dokumentkategori.
#' @export
