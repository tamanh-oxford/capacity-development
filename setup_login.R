
subdir <- file.path(
  paste0(
    "x", 
    openssl::sha1(Sys.getenv("TOP_USERNAME"))
  )
)

projdir <- file.path(
  paste0(
    "x",
    openssl::sha1(Sys.getenv("TOP_PASSWORD"))
  )
)

fulldir <- file.path(subdir, projdir)

site_files <- list.files(
  path = "_site", full.names = TRUE, recursive = TRUE
)

dir.create(
  path = projdir, 
  showWarnings = FALSE, recursive = TRUE
)

withr::with_dir(
  new = "_site",
  code = {
    files_to_move <- list.files(full.names = TRUE, recursive = TRUE)
    
    zip(zipfile = "temp_zip.zip", files = files_to_move)
  }
)

unzip("_site/temp_zip.zip", exdir = projdir)

file.remove("_site/temp_zip.zip")

file.remove(site_files)

unlink("_site", recursive = TRUE)

dir.create(file.path("_site", subdir), recursive = TRUE)

file.copy(
  from = projdir,
  to = file.path("_site", subdir),
  recursive = TRUE
)

file.remove(list.files(projdir, full.names = TRUE, recursive = TRUE))

unlink(projdir, recursive = TRUE)

file.copy(from = "auth/index.html", to = "_site")
file.copy(from = "auth/styles.css", to = "_site")

