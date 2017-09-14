#' @export
oficio <- function(...){
  base <- inherit_pdf_document2(includes = list(
    in_header = find_resource('pdf_document', 'style.sty'),
    before_body = find_resource('pdf_document', 'body.tex')),
    template = find_resource("oficio", "template.tex"),
    ...)

  base$knitr$opts_chunk$comment <- F
  base$knitr$opts_chunk$message <- F

  base$knitr$opts_chunk$fig.pos <- "H"

  base
}
