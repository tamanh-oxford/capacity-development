# Setup PDF slides rendering ---------------------------------------------------

## Load packages ----
library(pagedown)


## Render data frameworks slides to PDF ----

html_files <- list.files(
  path = "_slides/data-frameworks", 
  pattern = "html", 
  full.names = TRUE
)

Map(
  f = pagedown::chrome_print,
  input = html_files,
  wait = 15,
  timeout = 300,
  extra_args = rep(
    list(c("--no-sandbox", "--disable-dev-shm-usage")), length(html_files)
  )
)

## Combine data frameworks slides into a single PDF ----

pdf_files <- list.files(
  path = "_slides/data-frameworks",
  pattern ="pdf",
  full.names = TRUE
)

qpdf::pdf_combine(
  input = pdf_files, output = "_slides/data-frameworks/data_governance.pdf"
)

## Render data management slides to PDF ----

pagedown::chrome_print(
  input = "_slides/data-management/index.html",
  output = "_slides/data-management/data_management.pdf",
  timeout = 300,
  extra_args = c("--no-sandbox", "--disable-dev-shm-usage")
)


