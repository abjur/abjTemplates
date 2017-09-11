#' @export
pdf_document <- function(...) {
  inherit_pdf_document2(includes = list(
    in_header = find_resource('pdf_document', 'style.sty'),
    before_body = find_resource('pdf_document', 'body.tex')),
    template = find_resource("pdf_document", "template.tex"),
    ...)
}
