new_abj_draft <- function(name, template,  data = format(Sys.Date(), "%Y%m%d")){

  cleaned_name <- name %>%
    stringr::str_replace_all("[^a-z0-9]+", "_") %>%
    stringr::str_to_lower()

  folder_name <- stringr::str_c(data, cleaned_name, sep = "_")

  rmarkdown::draft(folder_name, template = 'pdf_document', package = 'abjTemplates')
}

#' @export
new_document <- function(name){
  new_draft(name, template = 'pdf_document')
}
