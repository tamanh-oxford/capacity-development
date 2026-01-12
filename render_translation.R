# Translate various components of capacity development materials ---------------


## Load required packages ----
library(babeldown)
library(babelquarto)


## Set global parameters ----
source_lang <- "en"
target_lang <- "vi"


## Translate index.qmd ----

deepl_translate(
  path = "index.qmd",
  out_path = "index.vi.qmd",
  source_lang = source_lang,
  target_lang = target_lang,
  formality = "more"
)

## Translate data-management/index.qmd ----

deepl_translate(
  path = "data-management/index.qmd",
  out_path = "data-management/index.vi.qmd",
  yaml_fields = c("title", "description", "subtitle"),
  source_lang = source_lang,
  target_lang = target_lang,
  formality = "more"
)

