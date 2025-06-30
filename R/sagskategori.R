#' En Sagskategori er en evt. undertype af Sagstype.
#' @export
sagskategori <- function(
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


#' Sagsstatus angiver, hvor langt Sagen er nået i sin behandling.
#' @export
