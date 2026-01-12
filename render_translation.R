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

## Translate data-frameworks ----

qmd_files <- list.files(
  path = "data-frameworks", pattern = "qmd", full.names = TRUE
)

qmd_output_files <- sub(pattern = "qmd", replacement = "vi.qmd", x = qmd_files)

Map(
  f = deepl_translate,
  path = qmd_files,
  out_path = qmd_output_files,
  yaml_fields = rep(list(c("title", "subtitle")), length(qmd_files)),
  source_lang = source_lang,
  target_lang = target_lang,
  formality = "more"
)
