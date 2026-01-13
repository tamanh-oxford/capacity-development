#'
#' Check if tags are equal, less, or more
#' 
#' 

check_release_tags <- function(tag1, tag2) {
  x <- tag1 |>
    sub(pattern = "v", replacement = "", x = _) |>
    stringr::str_split(pattern = "\\.", simplify = TRUE)

  y <- tag2 |>
    sub(pattern = "v", replacement = "", x = _) |>
    stringr::str_split(pattern = "\\.", simplify = TRUE)

  if (y[1, 1] < x[1, 1]) {
    stop(
      "New release tag is earlier than current release tag. ",
      "Please review and try again."
    )
  } else {
    if ((y[1, 1] == x[1, 1]) & (y[1, 2] < x[1, 2])) {
      stop(
        "New release tag is earlier than current release tag. ",
        "Please review and try again."
      )
    } else {
      if ((y[1, 1] == x[1, 1]) & (y[1, 2] == x[1, 2]) & (y[1, 3] <= x[1, 3])) {
        stop(
          "New release tag is the same or earlier than current release tag. ",
          "Please review and try again."
        )
      } else {
        message(
          "New release tag is later than current release tag."
        )
      }
    }
  }
}