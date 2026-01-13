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

ppts <- list.files(
  path = "_site", 
  pattern = "pptx",
  recursive = TRUE, 
  full.names = TRUE
)

### Create filenames for PPTX files for uploading ----

ppts_names <- basename(ppts) |>
  (\(x) ifelse(x == "index.pptx", "data_management.pptx", x))()


## Upload to latest GitHub release ----

### Upload PDF versions of presentations ----

lapply(X = pdfs, FUN = piggyback::pb_upload)


### Upload PPTX versions of presentations ----

Map(
  f = piggyback::pb_upload,
  file = ppts,
  name = ppts_names
)
