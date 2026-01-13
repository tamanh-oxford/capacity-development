#'
#' Get version tag from CITATION.cff in current main branch
#' 

get_repo_main_tag <- function() {
  readLines("CITATION.cff") |>
    grepv(pattern = "^version") |>
    sub(pattern = "version: ", replacement = "v", x = _)
}

