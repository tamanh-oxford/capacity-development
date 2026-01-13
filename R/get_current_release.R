#'
#' Get current release tag
#' 

get_current_release_tag <- function() {
  piggyback::pb_releases() |>
    dplyr::arrange(dplyr::desc(published_at)) |>
    dplyr::slice(1) |>
    dplyr::pull(tag_name)
}
