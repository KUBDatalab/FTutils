dagsordenspunktdokument <- function(
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


