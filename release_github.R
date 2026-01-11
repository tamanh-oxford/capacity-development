# Setup GitHub release uploads -------------------------------------------------


## Get list and organise files for upload ----

pdfs <- list.files(
  path = "_site", 
  pattern = "pdf",
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
