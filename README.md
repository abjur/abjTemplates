# abjTemplates

## Installation

If you wish to install the development version from GitHub you can do this:

devtools::install_github("abjur/abjTemplates")

## Overview

The `abjTemplates` package provides a suite of custom R Markdown LaTeX formats and templates used by the Brazilian Jurimetrics Association (ABJ), including:

- letterhead (or _papel timbrado_)
- simple documents
- meeting minutes (or _atas de reunião_)
- summons of assembly (or _convocações de assembleia_)

## Using abjTemplates from RStudio

To use **abjTemplates** from RStudio:

1) Install the latest [RStudio](http://www.rstudio.com/products/rstudio/download/).

2) Install the **abjTemplates** package: 
    
    install.packages("abjTemplates", type = "source")
    
3) Use the **New R Markdown** dialog to create a markdown:

 ![New R Markdown](http://rmarkdown.rstudio.com/images/new_r_markdown.png)
    
    
### Using rticles outside of RStudio

1) Install [pandoc](http://johnmacfarlane.net/pandoc/) using the [instructions for your platform](https://github.com/rstudio/rmarkdown/blob/master/PANDOC.md).

2) Install the **rmarkdown** and **abjTemplates** packages:

    
    install.packages("rmarkdown")
    devtools::install_github("abjur/abjTemplates")
    
    
3) Use the `rmarkdown::draft` function to create articles:

    
    rmarkdown::draft("documento.Rmd", template = "pdf_document", package = "abjTemplates")
