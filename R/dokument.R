#' Et dokument er et journalkort med metadata om  en eller flere tilknyttede filer. Spørgsmålsdokumenter indeholder spørgsmåls fulde ordlyd.Se også Dokumenttype og Dokumentkategori.
#' @export
dokument <- function(
  id = NULL,
  typeid = NULL,
  kategoriid = NULL,
  statusid = NULL,
  offentlighedskode = NULL,
  titel = NULL,
  dato = NULL,
  modtagelsesdato = NULL,
  frigivelsesdato = NULL,
  paragraf = NULL,
  paragrafnummer = NULL,
  spørgsmålsordlyd = NULL,
  spørgsmålstitel = NULL,
  spørgsmålsid = NULL,
  procedurenummer = NULL,
  grundnotatstatus = NULL,
  dagsordenudgavenummer = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 typeid = typeid,
                 kategoriid = kategoriid,
                 statusid = statusid,
                 offentlighedskode = offentlighedskode,
                 titel = titel,
                 dato = dato,
                 modtagelsesdato = modtagelsesdato,
                 frigivelsesdato = frigivelsesdato,
                 paragraf = paragraf,
                 paragrafnummer = paragrafnummer,
                 spørgsmålsordlyd = spørgsmålsordlyd,
                 spørgsmålstitel = spørgsmålstitel,
                 spørgsmålsid = spørgsmålsid,
                 procedurenummer = procedurenummer,
                 grundnotatstatus = grundnotatstatus,
                 dagsordenudgavenummer = dagsordenudgavenummer,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dokument", params)
  filter <- build_filter(params, "Dokument")
  if (!is.null(filter)) {
    ft_get("/api/Dokument", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dokument", ...)
  }
}


#' Relationen mellem dokument og aktør med en rolle – fx (et spørgsmåls) ´Stiller´ og ´Adressat´ (modtager)
#' @export
