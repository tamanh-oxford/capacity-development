# Setup PDF slides rendering ---------------------------------------------------

## Load packages ----
library(pagedown)


## Render data frameworks slides to PDF ----

html_files <- list.files(
  path = "_site/data-frameworks", 
  pattern = "html", 
  full.names = TRUE
)

file.copy(from = html_files, to = "_site")

Map(
  f = pagedown::chrome_print,
  input = sub(pattern = "data-frameworks/", replacement = "", x = html_files),
  output = sub(pattern = "html", replacement = "pdf", x = html_files),
  wait = 15,
  timeout = 300,
  extra_args = rep(
    list(c("--no-sandbox", "--disable-dev-shm-usage")), length(html_files)
  )
)

file.remove(sub(pattern = "data-frameworks/", replacement = "", x = html_files))

## Combine data frameworks slides into a single PDF ----

pdf_files <- list.files(
  path = "_site/data-frameworks",
  pattern ="pdf",
  full.names = TRUE
) |>
  grepv(pattern = "data_governance", invert = TRUE) |>
  (\(x) x[c(14, 1:13)])()

qpdf::pdf_combine(
  input = pdf_files, output = "_site/data-frameworks/data_governance.pdf"
)

## Render Vietnamese data frameworks slides to PDF ----

# html_files <- list.files(
#   path = "_site/vi/data-frameworks", 
#   pattern = "html", 
#   full.names = TRUE
# )

# Map(
#   f = pagedown::chrome_print,
#   input = html_files,
#   wait = 15,
#   timeout = 300,
#   extra_args = rep(
#     list(c("--no-sandbox", "--disable-dev-shm-usage")), length(html_files)
#   )
# )

## Combine data frameworks slides into a single PDF ----

# pdf_files <- list.files(
#   path = "_site/data-frameworks",
#   pattern ="pdf",
#   full.names = TRUE
# ) |>
#   grepv(pattern = "data_governance", invert = TRUE) |>
#   (\(x) x[c(14, 1:13)])()

# qpdf::pdf_combine(
#   input = pdf_files, output = "_site/data-frameworks/data_governance.pdf"
# )

## Render data management slides to PDF ----

file.copy(
  from = "_site/data-management/index.html",
  to = "_site/index_temp.html"
)

pagedown::chrome_print(
  input = "_site/index_temp.html",
  output = "_site/data-management/data_management.pdf",
  timeout = 300,
  extra_args = c("--no-sandbox", "--disable-dev-shm-usage")
)

file.remove("_site/index_temp.html")

## Render Vietnamese data management slides to PDF ----

file.copy(
  from = "_site/vi/data-management/index.html",
  to = "_site/index_temp.html"
)

pagedown::chrome_print(
  input = "_site/index_temp.html",
  output = "_site/vi/data-management/data_management_vi.pdf",
  timeout = 300,
  extra_args = c("--no-sandbox", "--disable-dev-shm-usage")
)

file.remove("_site/index_temp.html")
