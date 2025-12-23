# Setup PDF slides rendering ---------------------------------------------------

## Load packages ----
library(pagedown)


## Render slides to PDF ----

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

pagedown::chrome_print(
  input = "_slides/data-management/index.html", timeout = 300,
  extra_args = "--no-sandbox", "--disable-dev-shm-usage"
)
