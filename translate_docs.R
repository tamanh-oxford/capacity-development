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
  target_lang = target_lang
)

