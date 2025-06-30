# Auto-generated from openapi.json
ft_base_url <- "https://oda.ft.dk"

ft_get <- function(path, ...) {
  url <- httr::modify_url(ft_base_url, path = path, query = list(...))
  res <- httr::GET(url)
  httr::stop_for_status(res)
  httr::content(res, encoding = "UTF-8")
}

# return a named vector of property types for an entity
get_entity_type_map <- function(entity) {
  meta_path <- system.file("extdata", "metadata", package = "FTutils")
  if (meta_path == "") meta_path <- "inst/extdata/metadata"
  if (!file.exists(meta_path)) return(NULL)

  doc <- xml2::read_xml(meta_path)
  ns <- xml2::xml_ns(doc)
  node <- xml2::xml_find_first(doc,
    sprintf(".//d1:EntityType[@Name='%s']", entity), ns)
  if (is.na(xml2::xml_name(node))) return(NULL)
  props <- xml2::xml_find_all(node, "d1:Property", ns)
  p_names <- xml2::xml_attr(props, "Name")
  p_types <- xml2::xml_attr(props, "Type")
  stats::setNames(p_types, p_names)
}

# validate parameters for a given entity against metadata
validate_entity_params <- function(entity, params) {
  type_map <- get_entity_type_map(entity)
  if (is.null(type_map)) return(invisible(NULL))

  check_fun <- function(value, type) {
    switch(type,
      "Edm.Int32" = is.numeric(value) && all(!is.na(value)) && all(value %% 1 == 0),
      "Edm.Int16" = is.numeric(value) && all(!is.na(value)) && all(value %% 1 == 0),
      "Edm.Boolean" = is.logical(value),
      "Edm.DateTime" = inherits(value, c("Date", "POSIXt")),
      "Edm.String" = is.character(value),
      TRUE)
  }

  for (nm in names(params)) {
    val <- params[[nm]]
    if (is.null(val)) next
    t <- type_map[[nm]]
    if (!is.null(t) && !check_fun(val, t)) {
      stop(sprintf("%s must be of type %s", nm, gsub("Edm.", "", t)), call. = FALSE)
    }
  }
}

# build OData filter string from parameters and metadata
build_filter <- function(params, entity) {
  type_map <- get_entity_type_map(entity)
  if (is.null(type_map)) return(NULL)
  filter_parts <- c()
  for (nm in names(params)) {
    value <- params[[nm]]
    if (is.null(value)) next
    type <- type_map[[nm]]
    if (is.null(type)) next
    if (inherits(value, "Date") || inherits(value, "POSIXt") || type == "Edm.DateTime") {
      d <- as.Date(value)
      filter_parts <- c(filter_parts,
        sprintf("year(%s) eq %s and month(%s) eq %s and day(%s) eq %s",
                nm, format(d, "%Y"), nm, format(d, "%m"), nm, format(d, "%d")))
    } else if (type == "Edm.String") {
      filter_parts <- c(filter_parts, sprintf("%s eq '%s'", nm, value))
    } else if (type == "Edm.Boolean") {
      filter_parts <- c(filter_parts, sprintf("%s eq %s", nm, tolower(value)))
    } else {
      filter_parts <- c(filter_parts, sprintf("%s eq %s", nm, value))
    }
  }
  if (length(filter_parts) == 0) return(NULL)
  paste(filter_parts, collapse = " and ")
}

get_home_getpropertiesforentity <- function(...) {
  ft_get("/Home/GetPropertiesForEntity", ...)
}


get_home_getnavigationpropertiesforentity <- function(...) {
  ft_get("/Home/GetNavigationPropertiesForEntity", ...)
}


get_api_afstemning <- function(
  id = NULL,
  nummer = NULL,
  konklusion = NULL,
  vedtaget = NULL,
  kommentar = NULL,
  mødeid = NULL,
  typeid = NULL,
  sagstrinid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 nummer = nummer,
                 konklusion = konklusion,
                 vedtaget = vedtaget,
                 kommentar = kommentar,
                 mødeid = mødeid,
                 typeid = typeid,
                 sagstrinid = sagstrinid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Afstemning", params)
  filter <- build_filter(params, "Afstemning")
  if (!is.null(filter)) {
    ft_get("/api/Afstemning", `$filter` = filter, ... )
  } else {
    ft_get("/api/Afstemning", ...)
  }
}


get_api_afstemningstype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Afstemningstype", params)
  filter <- build_filter(params, "Afstemningstype")
  if (!is.null(filter)) {
    ft_get("/api/Afstemningstype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Afstemningstype", ...)
  }
}


get_api_aktstykke <- function(
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


get_api_aktoer <- function(
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


get_api_aktoeraktoer <- function(
  id = NULL,
  fraaktørid = NULL,
  tilaktørid = NULL,
  startdato = NULL,
  slutdato = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 fraaktørid = fraaktørid,
                 tilaktørid = tilaktørid,
                 startdato = startdato,
                 slutdato = slutdato,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("AktørAktør", params)
  filter <- build_filter(params, "AktørAktør")
  if (!is.null(filter)) {
    ft_get("/api/Akt%C3%B8rAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/Akt%C3%B8rAkt%C3%B8r", ...)
  }
}


get_api_aktoeraktoerrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("AktørAktørRolle", params)
  filter <- build_filter(params, "AktørAktørRolle")
  if (!is.null(filter)) {
    ft_get("/api/Akt%C3%B8rAkt%C3%B8rRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/Akt%C3%B8rAkt%C3%B8rRolle", ...)
  }
}


get_api_aktoertype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Aktørtype", params)
  filter <- build_filter(params, "Aktørtype")
  if (!is.null(filter)) {
    ft_get("/api/Akt%C3%B8rtype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Akt%C3%B8rtype", ...)
  }
}


get_api_almdel <- function(
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
  validate_entity_params("Almdel", params)
  filter <- build_filter(params, "Almdel")
  if (!is.null(filter)) {
    ft_get("/api/Almdel", `$filter` = filter, ... )
  } else {
    ft_get("/api/Almdel", ...)
  }
}


get_api_dagsordenspunkt <- function(
  id = NULL,
  kørebemærkning = NULL,
  titel = NULL,
  kommentar = NULL,
  nummer = NULL,
  forhandlingskode = NULL,
  forhandling = NULL,
  superid = NULL,
  sagstrinid = NULL,
  mødeid = NULL,
  offentlighedskode = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 kørebemærkning = kørebemærkning,
                 titel = titel,
                 kommentar = kommentar,
                 nummer = nummer,
                 forhandlingskode = forhandlingskode,
                 forhandling = forhandling,
                 superid = superid,
                 sagstrinid = sagstrinid,
                 mødeid = mødeid,
                 offentlighedskode = offentlighedskode,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dagsordenspunkt", params)
  filter <- build_filter(params, "Dagsordenspunkt")
  if (!is.null(filter)) {
    ft_get("/api/Dagsordenspunkt", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dagsordenspunkt", ...)
  }
}


get_api_dagsordenspunktdokument <- function(
  id = NULL,
  dokumentid = NULL,
  dagsordenspunktid = NULL,
  note = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 dokumentid = dokumentid,
                 dagsordenspunktid = dagsordenspunktid,
                 note = note,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("DagsordenspunktDokument", params)
  filter <- build_filter(params, "DagsordenspunktDokument")
  if (!is.null(filter)) {
    ft_get("/api/DagsordenspunktDokument", `$filter` = filter, ... )
  } else {
    ft_get("/api/DagsordenspunktDokument", ...)
  }
}


get_api_dagsordenspunktsag <- function(
  id = NULL,
  dagsordenspunktid = NULL,
  sagid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 dagsordenspunktid = dagsordenspunktid,
                 sagid = sagid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("DagsordenspunktSag", params)
  filter <- build_filter(params, "DagsordenspunktSag")
  if (!is.null(filter)) {
    ft_get("/api/DagsordenspunktSag", `$filter` = filter, ... )
  } else {
    ft_get("/api/DagsordenspunktSag", ...)
  }
}


get_api_debat <- function(
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


get_api_dokument <- function(
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


get_api_dokumentaktoer <- function(
  id = NULL,
  dokumentid = NULL,
  aktørid = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 dokumentid = dokumentid,
                 aktørid = aktørid,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("DokumentAktør", params)
  filter <- build_filter(params, "DokumentAktør")
  if (!is.null(filter)) {
    ft_get("/api/DokumentAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/DokumentAkt%C3%B8r", ...)
  }
}


get_api_dokumentaktoerrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("DokumentAktørRolle", params)
  filter <- build_filter(params, "DokumentAktørRolle")
  if (!is.null(filter)) {
    ft_get("/api/DokumentAkt%C3%B8rRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/DokumentAkt%C3%B8rRolle", ...)
  }
}


get_api_dokumentkategori <- function(
  id = NULL,
  kategori = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 kategori = kategori,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dokumentkategori", params)
  filter <- build_filter(params, "Dokumentkategori")
  if (!is.null(filter)) {
    ft_get("/api/Dokumentkategori", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dokumentkategori", ...)
  }
}


get_api_dokumentstatus <- function(
  id = NULL,
  status = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 status = status,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dokumentstatus", params)
  filter <- build_filter(params, "Dokumentstatus")
  if (!is.null(filter)) {
    ft_get("/api/Dokumentstatus", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dokumentstatus", ...)
  }
}


get_api_dokumenttype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Dokumenttype", params)
  filter <- build_filter(params, "Dokumenttype")
  if (!is.null(filter)) {
    ft_get("/api/Dokumenttype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Dokumenttype", ...)
  }
}


get_api_emneord <- function(
  id = NULL,
  typeid = NULL,
  emneord = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 typeid = typeid,
                 emneord = emneord,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Emneord", params)
  filter <- build_filter(params, "Emneord")
  if (!is.null(filter)) {
    ft_get("/api/Emneord", `$filter` = filter, ... )
  } else {
    ft_get("/api/Emneord", ...)
  }
}


get_api_emneorddokument <- function(
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


get_api_emneordsag <- function(
  id = NULL,
  emneordid = NULL,
  sagid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 emneordid = emneordid,
                 sagid = sagid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("EmneordSag", params)
  filter <- build_filter(params, "EmneordSag")
  if (!is.null(filter)) {
    ft_get("/api/EmneordSag", `$filter` = filter, ... )
  } else {
    ft_get("/api/EmneordSag", ...)
  }
}


get_api_emneordstype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Emneordstype", params)
  filter <- build_filter(params, "Emneordstype")
  if (!is.null(filter)) {
    ft_get("/api/Emneordstype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Emneordstype", ...)
  }
}


get_api_entitetbeskrivelse <- function(
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


get_api_eusag <- function(
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
  validate_entity_params("EUsag", params)
  filter <- build_filter(params, "EUsag")
  if (!is.null(filter)) {
    ft_get("/api/EUsag", `$filter` = filter, ... )
  } else {
    ft_get("/api/EUsag", ...)
  }
}


get_api_fil <- function(
  id = NULL,
  dokumentid = NULL,
  titel = NULL,
  versionsdato = NULL,
  filurl = NULL,
  opdateringsdato = NULL,
  variantkode = NULL,
  format = NULL,
  ...) {
  params <- list(
                 id = id,
                 dokumentid = dokumentid,
                 titel = titel,
                 versionsdato = versionsdato,
                 filurl = filurl,
                 opdateringsdato = opdateringsdato,
                 variantkode = variantkode,
                 format = format
  )
  validate_entity_params("Fil", params)
  filter <- build_filter(params, "Fil")
  if (!is.null(filter)) {
    ft_get("/api/Fil", `$filter` = filter, ... )
  } else {
    ft_get("/api/Fil", ...)
  }
}


get_api_forslag <- function(
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
  validate_entity_params("Forslag", params)
  filter <- build_filter(params, "Forslag")
  if (!is.null(filter)) {
    ft_get("/api/Forslag", `$filter` = filter, ... )
  } else {
    ft_get("/api/Forslag", ...)
  }
}


get_api_kollonebeskrivelse <- function(
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


get_api_moede <- function(
  id = NULL,
  titel = NULL,
  lokale = NULL,
  nummer = NULL,
  dagsordenurl = NULL,
  starttidsbemærkning = NULL,
  offentlighedskode = NULL,
  dato = NULL,
  statusid = NULL,
  typeid = NULL,
  periodeid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 titel = titel,
                 lokale = lokale,
                 nummer = nummer,
                 dagsordenurl = dagsordenurl,
                 starttidsbemærkning = starttidsbemærkning,
                 offentlighedskode = offentlighedskode,
                 dato = dato,
                 statusid = statusid,
                 typeid = typeid,
                 periodeid = periodeid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Møde", params)
  filter <- build_filter(params, "Møde")
  if (!is.null(filter)) {
    ft_get("/api/M%C3%B8de", `$filter` = filter, ... )
  } else {
    ft_get("/api/M%C3%B8de", ...)
  }
}


get_api_moedeaktoer <- function(
  id = NULL,
  mødeid = NULL,
  aktørid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 mødeid = mødeid,
                 aktørid = aktørid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("MødeAktør", params)
  filter <- build_filter(params, "MødeAktør")
  if (!is.null(filter)) {
    ft_get("/api/M%C3%B8deAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/M%C3%B8deAkt%C3%B8r", ...)
  }
}


get_api_moedestatus <- function(
  id = NULL,
  status = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 status = status,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Mødestatus", params)
  filter <- build_filter(params, "Mødestatus")
  if (!is.null(filter)) {
    ft_get("/api/M%C3%B8destatus", `$filter` = filter, ... )
  } else {
    ft_get("/api/M%C3%B8destatus", ...)
  }
}


get_api_moedetype <- function(
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


get_api_omtryk <- function(
  id = NULL,
  dokumentid = NULL,
  dato = NULL,
  begrundelse = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 dokumentid = dokumentid,
                 dato = dato,
                 begrundelse = begrundelse,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Omtryk", params)
  filter <- build_filter(params, "Omtryk")
  if (!is.null(filter)) {
    ft_get("/api/Omtryk", `$filter` = filter, ... )
  } else {
    ft_get("/api/Omtryk", ...)
  }
}


get_api_periode <- function(
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


get_api_sag <- function(
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


get_api_sagaktoer <- function(
  id = NULL,
  aktørid = NULL,
  sagid = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 aktørid = aktørid,
                 sagid = sagid,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("SagAktør", params)
  filter <- build_filter(params, "SagAktør")
  if (!is.null(filter)) {
    ft_get("/api/SagAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagAkt%C3%B8r", ...)
  }
}


get_api_sagaktoerrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("SagAktørRolle", params)
  filter <- build_filter(params, "SagAktørRolle")
  if (!is.null(filter)) {
    ft_get("/api/SagAkt%C3%B8rRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagAkt%C3%B8rRolle", ...)
  }
}


get_api_sagdokument <- function(
  id = NULL,
  sagid = NULL,
  dokumentid = NULL,
  bilagsnummer = NULL,
  frigivelsesdato = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 sagid = sagid,
                 dokumentid = dokumentid,
                 bilagsnummer = bilagsnummer,
                 frigivelsesdato = frigivelsesdato,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("SagDokument", params)
  filter <- build_filter(params, "SagDokument")
  if (!is.null(filter)) {
    ft_get("/api/SagDokument", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagDokument", ...)
  }
}


get_api_sagdokumentrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("SagDokumentRolle", params)
  filter <- build_filter(params, "SagDokumentRolle")
  if (!is.null(filter)) {
    ft_get("/api/SagDokumentRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagDokumentRolle", ...)
  }
}


get_api_sagskategori <- function(
  id = NULL,
  kategori = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 kategori = kategori,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagskategori", params)
  filter <- build_filter(params, "Sagskategori")
  if (!is.null(filter)) {
    ft_get("/api/Sagskategori", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagskategori", ...)
  }
}


get_api_sagsstatus <- function(
  id = NULL,
  status = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 status = status,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagsstatus", params)
  filter <- build_filter(params, "Sagsstatus")
  if (!is.null(filter)) {
    ft_get("/api/Sagsstatus", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagsstatus", ...)
  }
}


get_api_sagstrin <- function(
  id = NULL,
  titel = NULL,
  dato = NULL,
  sagid = NULL,
  typeid = NULL,
  folketingstidendeurl = NULL,
  folketingstidende = NULL,
  folketingstidendesidenummer = NULL,
  statusid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 titel = titel,
                 dato = dato,
                 sagid = sagid,
                 typeid = typeid,
                 folketingstidendeurl = folketingstidendeurl,
                 folketingstidende = folketingstidende,
                 folketingstidendesidenummer = folketingstidendesidenummer,
                 statusid = statusid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagstrin", params)
  filter <- build_filter(params, "Sagstrin")
  if (!is.null(filter)) {
    ft_get("/api/Sagstrin", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagstrin", ...)
  }
}


get_api_sagstrinaktoer <- function(
  id = NULL,
  sagstrinid = NULL,
  aktørid = NULL,
  opdateringsdato = NULL,
  rolleid = NULL,
  ...) {
  params <- list(
                 id = id,
                 sagstrinid = sagstrinid,
                 aktørid = aktørid,
                 opdateringsdato = opdateringsdato,
                 rolleid = rolleid
  )
  validate_entity_params("SagstrinAktør", params)
  filter <- build_filter(params, "SagstrinAktør")
  if (!is.null(filter)) {
    ft_get("/api/SagstrinAkt%C3%B8r", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagstrinAkt%C3%B8r", ...)
  }
}


get_api_sagstrinaktoerrolle <- function(
  id = NULL,
  rolle = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 rolle = rolle,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("SagstrinAktørRolle", params)
  filter <- build_filter(params, "SagstrinAktørRolle")
  if (!is.null(filter)) {
    ft_get("/api/SagstrinAkt%C3%B8rRolle", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagstrinAkt%C3%B8rRolle", ...)
  }
}


get_api_sagstrindokument <- function(
  id = NULL,
  sagstrinid = NULL,
  dokumentid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 sagstrinid = sagstrinid,
                 dokumentid = dokumentid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("SagstrinDokument", params)
  filter <- build_filter(params, "SagstrinDokument")
  if (!is.null(filter)) {
    ft_get("/api/SagstrinDokument", `$filter` = filter, ... )
  } else {
    ft_get("/api/SagstrinDokument", ...)
  }
}


get_api_sagstrinsstatus <- function(
  id = NULL,
  status = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 status = status,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagstrinsstatus", params)
  filter <- build_filter(params, "Sagstrinsstatus")
  if (!is.null(filter)) {
    ft_get("/api/Sagstrinsstatus", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagstrinsstatus", ...)
  }
}


get_api_sagstrinstype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagstrinstype", params)
  filter <- build_filter(params, "Sagstrinstype")
  if (!is.null(filter)) {
    ft_get("/api/Sagstrinstype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagstrinstype", ...)
  }
}


get_api_sagstype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sagstype", params)
  filter <- build_filter(params, "Sagstype")
  if (!is.null(filter)) {
    ft_get("/api/Sagstype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sagstype", ...)
  }
}


get_api_sambehandlinger <- function(
  id = NULL,
  førstesagstrinid = NULL,
  andetsagstrinid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 førstesagstrinid = førstesagstrinid,
                 andetsagstrinid = andetsagstrinid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Sambehandlinger", params)
  filter <- build_filter(params, "Sambehandlinger")
  if (!is.null(filter)) {
    ft_get("/api/Sambehandlinger", `$filter` = filter, ... )
  } else {
    ft_get("/api/Sambehandlinger", ...)
  }
}


get_api_stemme <- function(
  id = NULL,
  typeid = NULL,
  afstemningid = NULL,
  aktørid = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 typeid = typeid,
                 afstemningid = afstemningid,
                 aktørid = aktørid,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Stemme", params)
  filter <- build_filter(params, "Stemme")
  if (!is.null(filter)) {
    ft_get("/api/Stemme", `$filter` = filter, ... )
  } else {
    ft_get("/api/Stemme", ...)
  }
}


get_api_stemmetype <- function(
  id = NULL,
  type = NULL,
  opdateringsdato = NULL,
  ...) {
  params <- list(
                 id = id,
                 type = type,
                 opdateringsdato = opdateringsdato
  )
  validate_entity_params("Stemmetype", params)
  filter <- build_filter(params, "Stemmetype")
  if (!is.null(filter)) {
    ft_get("/api/Stemmetype", `$filter` = filter, ... )
  } else {
    ft_get("/api/Stemmetype", ...)
  }
}
