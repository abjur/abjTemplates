inherit_pdf_document2 <- function(...) {
  fmt <- bookdown::pdf_document2(...)
  fmt$inherits <- "pdf_document2"
  fmt
}

find_file <- function (template, file) {
  template <- system.file("rmarkdown", "templates", template,
                          file, package = "abjTemplates")
  if (template == "") {
    stop("Couldn't find template file ", template, "/", file,
         call. = FALSE)
  }
  template
}

find_resource <- function (template, file) {
  find_file(template, file.path("resources", file))
}
#' Pipe operator
#'
#' See \code{\link[magrittr]{\%>\%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL
