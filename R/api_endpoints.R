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

