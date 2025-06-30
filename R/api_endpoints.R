# Auto-generated from openapi.json
ft_base_url <- "https://oda.ft.dk"

ft_get <- function(path, ...) {
  url <- httr::modify_url(ft_base_url, path = path, query = list(...))
  res <- httr::GET(url)
  httr::stop_for_status(res)
  httr::content(res, encoding = "UTF-8")
}

#
# @title get_home_getpropertiesforentity
# @description Access endpoint /Home/GetPropertiesForEntity
# @param ... Named parameters passed as query parameters
# @export
get_home_getpropertiesforentity <- function(...) {
  ft_get("/Home/GetPropertiesForEntity", ...)
}

#
# @title get_home_getnavigationpropertiesforentity
# @description Access endpoint /Home/GetNavigationPropertiesForEntity
# @param ... Named parameters passed as query parameters
# @export
get_home_getnavigationpropertiesforentity <- function(...) {
  ft_get("/Home/GetNavigationPropertiesForEntity", ...)
}

#
# @title get_api_afstemning
# @description Access endpoint /api/Afstemning
# @param ... Named parameters passed as query parameters
# @export
get_api_afstemning <- function(...) {
  ft_get("/api/Afstemning", ...)
}

#
# @title get_api_afstemningstype
# @description Access endpoint /api/Afstemningstype
# @param ... Named parameters passed as query parameters
# @export
get_api_afstemningstype <- function(...) {
  ft_get("/api/Afstemningstype", ...)
}

#
# @title get_api_aktstykke
# @description Access endpoint /api/Aktstykke
# @param id Filter by ``id``
# @param typeid Filter by ``typeid``
# @param kategoriid Filter by ``kategoriid``
# @param statusid Filter by ``statusid``
# @param titel Filter by ``titel``
# @param titelkort Filter by ``titelkort``
# @param offentlighedskode Filter by ``offentlighedskode``
# @param nummer Filter by ``nummer``
# @param nummerprefix Filter by ``nummerprefix``
# @param nummernumerisk Filter by ``nummernumerisk``
# @param nummerpostfix Filter by ``nummerpostfix``
# @param resume Filter by ``resume``
# @param afstemningskonklusion Filter by ``afstemningskonklusion``
# @param periodeid Filter by ``periodeid``
# @param afgørelsesresultatkode Filter by ``afgørelsesresultatkode``
# @param baggrundsmateriale Filter by ``baggrundsmateriale``
# @param opdateringsdato Date used to filter ``opdateringsdato``
# @param statsbudgetsag Filter by ``statsbudgetsag``
# @param begrundelse Filter by ``begrundelse``
# @param paragrafnummer Filter by ``paragrafnummer``
# @param paragraf Filter by ``paragraf``
# @param afgørelsesdato Date used to filter ``afgørelsesdato``
# @param afgørelse Filter by ``afgørelse``
# @param rådsmødedato Date used to filter ``rådsmødedato``
# @param lovnummer Filter by ``lovnummer``
# @param lovnummerdato Date used to filter ``lovnummerdato``
# @param retsinformationsurl Filter by ``retsinformationsurl``
# @param fremsatundersagid Filter by ``fremsatundersagid``
# @param deltundersagid Filter by ``deltundersagid``
# @param ... Additional query parameters
# @export
get_api_aktstykke <- function(id = NULL,
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
  filter_parts <- c()

  add_filter <- function(name, value) {
    if (is.null(value)) return()
    if (inherits(value, "Date")) {
      d <- as.Date(value)
      filter_parts <<- c(filter_parts,
        sprintf("year(%s) eq %s and month(%s) eq %s and day(%s) eq %s",
                name, format(d, "%Y"), name, format(d, "%m"), name, format(d, "%d")))
    } else if (is.character(value)) {
      filter_parts <<- c(filter_parts,
        sprintf("%s eq '%s'", name, value))
    } else if (is.logical(value)) {
      filter_parts <<- c(filter_parts,
        sprintf("%s eq %s", name, tolower(value)))
    } else {
      filter_parts <<- c(filter_parts,
        sprintf("%s eq %s", name, value))
    }
  }

  params <- list(id = id,
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
                 deltundersagid = deltundersagid)

  invisible(lapply(names(params), function(nm) add_filter(nm, params[[nm]])))

  if (length(filter_parts) > 0) {
    filter <- paste(filter_parts, collapse = " and ")
    ft_get("/api/Aktstykke", `$filter` = filter, ...)
  } else {
    ft_get("/api/Aktstykke", ...)
  }
}

#
# @title get_api_aktoer
# @description Access endpoint /api/Akt%C3%B8r
# @param ... Named parameters passed as query parameters
# @export
get_api_aktoer <- function(...) {
  ft_get("/api/Akt%C3%B8r", ...)
}

#
# @title get_api_aktoeraktoer
# @description Access endpoint /api/Akt%C3%B8rAkt%C3%B8r
# @param ... Named parameters passed as query parameters
# @export
get_api_aktoeraktoer <- function(...) {
  ft_get("/api/Akt%C3%B8rAkt%C3%B8r", ...)
}

#
# @title get_api_aktoeraktoerrolle
# @description Access endpoint /api/Akt%C3%B8rAkt%C3%B8rRolle
# @param ... Named parameters passed as query parameters
# @export
get_api_aktoeraktoerrolle <- function(...) {
  ft_get("/api/Akt%C3%B8rAkt%C3%B8rRolle", ...)
}

#
# @title get_api_aktoertype
# @description Access endpoint /api/Akt%C3%B8rtype
# @param ... Named parameters passed as query parameters
# @export
get_api_aktoertype <- function(...) {
  ft_get("/api/Akt%C3%B8rtype", ...)
}

#
# @title get_api_almdel
# @description Access endpoint /api/Almdel
# @param ... Named parameters passed as query parameters
# @export
get_api_almdel <- function(...) {
  ft_get("/api/Almdel", ...)
}

#
# @title get_api_dagsordenspunkt
# @description Access endpoint /api/Dagsordenspunkt
# @param ... Named parameters passed as query parameters
# @export
get_api_dagsordenspunkt <- function(...) {
  ft_get("/api/Dagsordenspunkt", ...)
}

#
# @title get_api_dagsordenspunktdokument
# @description Access endpoint /api/DagsordenspunktDokument
# @param ... Named parameters passed as query parameters
# @export
get_api_dagsordenspunktdokument <- function(...) {
  ft_get("/api/DagsordenspunktDokument", ...)
}

#
# @title get_api_dagsordenspunktsag
# @description Access endpoint /api/DagsordenspunktSag
# @param ... Named parameters passed as query parameters
# @export
get_api_dagsordenspunktsag <- function(...) {
  ft_get("/api/DagsordenspunktSag", ...)
}

#
# @title get_api_debat
# @description Access endpoint /api/Debat
# @param ... Named parameters passed as query parameters
# @export
get_api_debat <- function(...) {
  ft_get("/api/Debat", ...)
}

#
# @title get_api_dokument
# @description Access endpoint /api/Dokument
# @param ... Named parameters passed as query parameters
# @export
get_api_dokument <- function(...) {
  ft_get("/api/Dokument", ...)
}

#
# @title get_api_dokumentaktoer
# @description Access endpoint /api/DokumentAkt%C3%B8r
# @param ... Named parameters passed as query parameters
# @export
get_api_dokumentaktoer <- function(...) {
  ft_get("/api/DokumentAkt%C3%B8r", ...)
}

#
# @title get_api_dokumentaktoerrolle
# @description Access endpoint /api/DokumentAkt%C3%B8rRolle
# @param ... Named parameters passed as query parameters
# @export
get_api_dokumentaktoerrolle <- function(...) {
  ft_get("/api/DokumentAkt%C3%B8rRolle", ...)
}

#
# @title get_api_dokumentkategori
# @description Access endpoint /api/Dokumentkategori
# @param ... Named parameters passed as query parameters
# @export
get_api_dokumentkategori <- function(...) {
  ft_get("/api/Dokumentkategori", ...)
}

#
# @title get_api_dokumentstatus
# @description Access endpoint /api/Dokumentstatus
# @param ... Named parameters passed as query parameters
# @export
get_api_dokumentstatus <- function(...) {
  ft_get("/api/Dokumentstatus", ...)
}

#
# @title get_api_dokumenttype
# @description Access endpoint /api/Dokumenttype
# @param ... Named parameters passed as query parameters
# @export
get_api_dokumenttype <- function(...) {
  ft_get("/api/Dokumenttype", ...)
}

#
# @title get_api_emneord
# @description Access endpoint /api/Emneord
# @param ... Named parameters passed as query parameters
# @export
get_api_emneord <- function(...) {
  ft_get("/api/Emneord", ...)
}

#
# @title get_api_emneorddokument
# @description Access endpoint /api/EmneordDokument
# @param ... Named parameters passed as query parameters
# @export
get_api_emneorddokument <- function(...) {
  ft_get("/api/EmneordDokument", ...)
}

#
# @title get_api_emneordsag
# @description Access endpoint /api/EmneordSag
# @param ... Named parameters passed as query parameters
# @export
get_api_emneordsag <- function(...) {
  ft_get("/api/EmneordSag", ...)
}

#
# @title get_api_emneordstype
# @description Access endpoint /api/Emneordstype
# @param ... Named parameters passed as query parameters
# @export
get_api_emneordstype <- function(...) {
  ft_get("/api/Emneordstype", ...)
}

#
# @title get_api_entitetbeskrivelse
# @description Access endpoint /api/EntitetBeskrivelse
# @param ... Named parameters passed as query parameters
# @export
get_api_entitetbeskrivelse <- function(...) {
  ft_get("/api/EntitetBeskrivelse", ...)
}

#
# @title get_api_eusag
# @description Access endpoint /api/EUsag
# @param ... Named parameters passed as query parameters
# @export
get_api_eusag <- function(...) {
  ft_get("/api/EUsag", ...)
}

#
# @title get_api_fil
# @description Access endpoint /api/Fil
# @param ... Named parameters passed as query parameters
# @export
get_api_fil <- function(...) {
  ft_get("/api/Fil", ...)
}

#
# @title get_api_forslag
# @description Access endpoint /api/Forslag
# @param ... Named parameters passed as query parameters
# @export
get_api_forslag <- function(...) {
  ft_get("/api/Forslag", ...)
}

#
# @title get_api_kollonebeskrivelse
# @description Access endpoint /api/KolloneBeskrivelse
# @param ... Named parameters passed as query parameters
# @export
get_api_kollonebeskrivelse <- function(...) {
  ft_get("/api/KolloneBeskrivelse", ...)
}

#
# @title get_api_moede
# @description Access endpoint /api/M%C3%B8de
# @param ... Named parameters passed as query parameters
# @export
get_api_moede <- function(...) {
  ft_get("/api/M%C3%B8de", ...)
}

#
# @title get_api_moedeaktoer
# @description Access endpoint /api/M%C3%B8deAkt%C3%B8r
# @param ... Named parameters passed as query parameters
# @export
get_api_moedeaktoer <- function(...) {
  ft_get("/api/M%C3%B8deAkt%C3%B8r", ...)
}

#
# @title get_api_moedestatus
# @description Access endpoint /api/M%C3%B8destatus
# @param ... Named parameters passed as query parameters
# @export
get_api_moedestatus <- function(...) {
  ft_get("/api/M%C3%B8destatus", ...)
}

#
# @title get_api_moedetype
# @description Access endpoint /api/M%C3%B8detype
# @param ... Named parameters passed as query parameters
# @export
get_api_moedetype <- function(...) {
  ft_get("/api/M%C3%B8detype", ...)
}

#
# @title get_api_omtryk
# @description Access endpoint /api/Omtryk
# @param ... Named parameters passed as query parameters
# @export
get_api_omtryk <- function(...) {
  ft_get("/api/Omtryk", ...)
}

#
# @title get_api_periode
# @description Access endpoint /api/Periode
# @param ... Named parameters passed as query parameters
# @export
get_api_periode <- function(...) {
  ft_get("/api/Periode", ...)
}

#
# @title get_api_sag
# @description Access endpoint /api/Sag
# @param ... Named parameters passed as query parameters
# @export
get_api_sag <- function(...) {
  ft_get("/api/Sag", ...)
}

#
# @title get_api_sagaktoer
# @description Access endpoint /api/SagAkt%C3%B8r
# @param ... Named parameters passed as query parameters
# @export
get_api_sagaktoer <- function(...) {
  ft_get("/api/SagAkt%C3%B8r", ...)
}

#
# @title get_api_sagaktoerrolle
# @description Access endpoint /api/SagAkt%C3%B8rRolle
# @param ... Named parameters passed as query parameters
# @export
get_api_sagaktoerrolle <- function(...) {
  ft_get("/api/SagAkt%C3%B8rRolle", ...)
}

#
# @title get_api_sagdokument
# @description Access endpoint /api/SagDokument
# @param ... Named parameters passed as query parameters
# @export
get_api_sagdokument <- function(...) {
  ft_get("/api/SagDokument", ...)
}

#
# @title get_api_sagdokumentrolle
# @description Access endpoint /api/SagDokumentRolle
# @param ... Named parameters passed as query parameters
# @export
get_api_sagdokumentrolle <- function(...) {
  ft_get("/api/SagDokumentRolle", ...)
}

#
# @title get_api_sagskategori
# @description Access endpoint /api/Sagskategori
# @param ... Named parameters passed as query parameters
# @export
get_api_sagskategori <- function(...) {
  ft_get("/api/Sagskategori", ...)
}

#
# @title get_api_sagsstatus
# @description Access endpoint /api/Sagsstatus
# @param ... Named parameters passed as query parameters
# @export
get_api_sagsstatus <- function(...) {
  ft_get("/api/Sagsstatus", ...)
}

#
# @title get_api_sagstrin
# @description Access endpoint /api/Sagstrin
# @param ... Named parameters passed as query parameters
# @export
get_api_sagstrin <- function(...) {
  ft_get("/api/Sagstrin", ...)
}

#
# @title get_api_sagstrinaktoer
# @description Access endpoint /api/SagstrinAkt%C3%B8r
# @param ... Named parameters passed as query parameters
# @export
get_api_sagstrinaktoer <- function(...) {
  ft_get("/api/SagstrinAkt%C3%B8r", ...)
}

#
# @title get_api_sagstrinaktoerrolle
# @description Access endpoint /api/SagstrinAkt%C3%B8rRolle
# @param ... Named parameters passed as query parameters
# @export
get_api_sagstrinaktoerrolle <- function(...) {
  ft_get("/api/SagstrinAkt%C3%B8rRolle", ...)
}

#
# @title get_api_sagstrindokument
# @description Access endpoint /api/SagstrinDokument
# @param ... Named parameters passed as query parameters
# @export
get_api_sagstrindokument <- function(...) {
  ft_get("/api/SagstrinDokument", ...)
}

#
# @title get_api_sagstrinsstatus
# @description Access endpoint /api/Sagstrinsstatus
# @param ... Named parameters passed as query parameters
# @export
get_api_sagstrinsstatus <- function(...) {
  ft_get("/api/Sagstrinsstatus", ...)
}

#
# @title get_api_sagstrinstype
# @description Access endpoint /api/Sagstrinstype
# @param ... Named parameters passed as query parameters
# @export
get_api_sagstrinstype <- function(...) {
  ft_get("/api/Sagstrinstype", ...)
}

#
# @title get_api_sagstype
# @description Access endpoint /api/Sagstype
# @param ... Named parameters passed as query parameters
# @export
get_api_sagstype <- function(...) {
  ft_get("/api/Sagstype", ...)
}

#
# @title get_api_sambehandlinger
# @description Access endpoint /api/Sambehandlinger
# @param andetsagstrinid Filter by ``andetsagstrinid``
# @param foerstesagstrinid Filter by ``førstesagstrinid``
# @param opdateringsdato Date used to filter ``opdateringsdato``
# @param ... Additional query parameters
# @export
get_api_sambehandlinger <- function(andetsagstrinid = NULL,
                                    foerstesagstrinid = NULL,
                                    opdateringsdato = NULL,
                                    ...) {
  filter_parts <- c()

  if (!is.null(andetsagstrinid)) {
    filter_parts <- c(filter_parts,
                      paste0("andetsagstrinid eq ", andetsagstrinid))
  }

  if (!is.null(foerstesagstrinid)) {
    filter_parts <- c(filter_parts,
                      paste0("førstesagstrinid eq ", foerstesagstrinid))
  }

  if (!is.null(opdateringsdato)) {
    d <- as.Date(opdateringsdato)
    filter_parts <- c(filter_parts,
                      sprintf("year(opdateringsdato) eq %s and month(opdateringsdato) eq %s and day(opdateringsdato) eq %s",
                              format(d, "%Y"),
                              format(d, "%m"),
                              format(d, "%d")))
  }

  if (length(filter_parts) > 0) {
    filter <- paste(filter_parts, collapse = " and ")
    ft_get("/api/Sambehandlinger", `$filter` = filter, ...)
  } else {
    ft_get("/api/Sambehandlinger", ...)
  }
}

#
# @title get_api_stemme
# @description Access endpoint /api/Stemme
# @param ... Named parameters passed as query parameters
# @export
get_api_stemme <- function(...) {
  ft_get("/api/Stemme", ...)
}

#
# @title get_api_stemmetype
# @description Access endpoint /api/Stemmetype
# @param ... Named parameters passed as query parameters
# @export
get_api_stemmetype <- function(...) {
  ft_get("/api/Stemmetype", ...)
}

