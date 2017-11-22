#' @export
knit_print.data.frame = function(x, lof = list(f1 = identity), names_from = "", names_to = "", names_title_case = TRUE, ...){

  if(stringr::str_detect(rmarkdown::all_output_formats(knitr::current_input()), "pdf")){

    result <- capture.output(x %>%
      prettify_names(names_from, names_to, names_title_case) %>%
      # Change names
      apply_lof(lof) %>%
      # Ordered and iteratively apply a list of functions
      xtable::xtable(
        label = knitr::opts_current$get("label"),
        caption = knitr::opts_current$get("tab.cap"),
        ...) %>%
        #Get table and captions from chunks
      print(tabular.environment = 'longtable',
            comment = F,
            floating = FALSE,
            include.rownames = F,
            caption.placement = 'top'))

    result %>%
      add_hline_before_rowsum() %>%
      # Add hline before rowsum
      paste0(collapse = '\n') %>%
      remove_double_hline() %>%
      # Remove double_hlines
      knitr::asis_output()
  } else {
    knit_print.data.frame = purrr::partial(knitr::kable, format = 'pandoc')
  }
}

add_hline_before_rowsum <- function(xtable_lines){

  new_lines <- character(length(xtable_lines))

  line_with_totals <- stringr::str_which(xtable_lines, "Total")

  if(length(line_with_totals) == 0){
    return(xtable_lines)
  }

  new_lines[1:line_with_totals] <- c(xtable_lines[1:(line_with_totals-1)], "\\hline")
  new_lines[line_with_totals+1] <- xtable_lines[line_with_totals]
  new_lines[(line_with_totals+2):length(xtable_lines)] <- xtable_lines[(line_with_totals+2):length(xtable_lines)]

  return(new_lines)
}

remove_double_hline <- function(xtable_lines){
  stringr::str_replace_all(xtable_lines, stringr::fixed('\\hline\n\\hline\n'), '\\hline\n')
}

prettify_names = function(data_set, from = '', to = '', to_title = TRUE){

  from <- c(from, "n", "p", "p_acum", "nome", "assunto", "descricao", "total")
  to <- c(to, "Frequência", "Percentual", "Percentual Acumulado", "Nome", "Assunto", "Descrição", "Total")
  #Default replacements are overrided by the parameters

  matches <- match(names(data_set), from, nomatch = 0)
  # Find the index of the names to be changed

  names(data_set)[matches > 0] = to[matches]
  # Replaces bad name with pretty names

  if(to_title){names(data_set) <- stringr::str_to_title(names(data_set))}
  # Titles should be title cased?

  data_set
}

apply_lof <- function(x, lof){

  res <- x

  for(ii in seq_along(lof)){
    res <- lof[[ii]](res)
  }

  res
}
