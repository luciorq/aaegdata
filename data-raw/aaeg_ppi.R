## data-raw/aaeg_ppi.R
## source:https://stringdb-static.org/download/protein.links.v10.5/7227.protein.links.v10.5.txt.gz
## source:https://stringdb-static.org/download/protein.links.v10.5/7159.protein.links.v10.5.txt.gz
## Path: "data-raw/ppi/7227.protein.links.v10.5.txt" for dmel
## Path: "data-raw/ppi/7159.protein.links.v10.5.txt" for aaeg

library(dplyr)


## Drosophila melanogaster data:
dmel_ppi_df <- readr::read_table2("data-raw/ppi/7227.protein.links.v10.5.txt")

dmel_ppi_df <- dmel_ppi_df %>%
  dplyr::mutate(protein1 = stringr::str_remove(protein1, "^7227\\.")) %>%
  dplyr::mutate(protein2 = stringr::str_remove(protein2, "^7227\\.")) %>%
  dplyr::distinct()

dmel_string_ppi <- dmel_ppi_df

#usethis::use_data(dmel_string_ppi, overwrite = TRUE, compress = "xz")


## Aedes aegypti data:
aaeg_ppi_df <- readr::read_table2("data-raw/ppi/7159.protein.links.v10.5.txt")

aaeg_ppi_df <- aaeg_ppi_df %>%
  dplyr::mutate(protein1 = stringr::str_remove(protein1, "^7159\\.")) %>%
  dplyr::mutate(protein1 = stringr::str_remove(protein1, "-P.*$")) %>%
  dplyr::mutate(protein2 = stringr::str_remove(protein2, "^7159\\.")) %>%
  dplyr::mutate(protein2 = stringr::str_remove(protein2, "-P.*$")) %>%
  dplyr::distinct()

aaeg_string_ppi <- aaeg_ppi_df

#usethis::use_data(aaeg_string_ppi, overwrite = TRUE, compress = "xz")

