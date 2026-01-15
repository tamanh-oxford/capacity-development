# Setup GitHub release uploads -------------------------------------------------

## Load project-specific functions ----
for (f in list.files(here::here("R"), full.names = TRUE)) source (f)


## Create new major release ----

current_tag <- get_current_release_tag()
new_tag <- get_repo_main_tag()

check_release_tags(tag1 = current_tag, tag2 = new_tag)

piggyback::pb_release_create(
  tag = new_tag,
  body = "This is a full release of the Tâm Anh Oxford Partnership (TOP) Data Capacity Development Courses."
)


## Get list and organise files for upload ----

pdfs <- list.files(
  path = "_site", 
  pattern = ".pdf",
  recursive = TRUE, 
  full.names = TRUE
) |>
  grepv(pattern = "data_governance", invert = TRUE)

### Create filenames for PDF files for uploading ----

pdfs_names <- pdfs |>
  gsub(
    pattern = "_site/|data-frameworks/|data-management/", 
    replacement = "", x = _
  ) |>
  (\(x)
    {
      ifelse(
        grepl(pattern = "vi/", x = x),
        basename(x) |>
          sub(pattern = ".pdf", replacement = "_vi.pdf", x = _),
        x
      )
    }
  )()

ppts <- list.files(
  path = "_site", 
  pattern = "pptx",
  recursive = TRUE, 
  full.names = TRUE
)

### Create filenames for PPTX files for uploading ----

ppts_names <- ppts |>
  gsub(
    pattern = "_site/|data-frameworks/|data-management/", 
    replacement = "", x = _
  ) |>
  (\(x)
    {
      x <- sub(pattern = "index", replacement = "data_management", x = x)
    
      ifelse(
        grepl(pattern = "vi/", x = x),
        basename(x) |>
          sub(pattern = ".pptx", replacement = "_vi.pptx", x = _),
        x
      )
    }
  )()


## Upload to latest GitHub release ----

### Upload PDF versions of presentations ----

Map(
  f = piggyback::pb_upload,
  file = pdfs,
  repo = "tamanh-oxford/capacity-development",
  name = pdfs_names
)

### Upload PPTX versions of presentations ----

Map(
  f = piggyback::pb_upload,
  file = ppts,
  repo = "tamanh-oxford/capacity-development",
  name = ppts_names
)
