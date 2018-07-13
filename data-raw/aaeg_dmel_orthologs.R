## data-raw/aaeg_dmel_orthologs.R
## Drosophila melanogaster orthologs from vectorbase - flybase??
## data file: "data-raw/vectorbase/aaegl51_vectorbase_dmel_ortolog.csv"


library(dplyr)
aaeg_dmel_orthologs <- readr::read_csv("data-raw/vectorbase/aaegl51_vectorbase_dmel_ortolog.csv")

aaeg_dmel_orthologs <- aaeg_dmel_orthologs %>%
  dplyr::rename(gene = `Gene stable ID`) %>%
  dplyr::rename(dmel_gene = `Drosophila melanogaster gene stable ID` ) %>%
  dplyr::rename(dmel_gene_name = `Drosophila melanogaster gene name` ) %>%
  dplyr::rename(dmel_homology_type = `Drosophila melanogaster homology type` ) %>%
  dplyr::rename( dmel_to_aaeg_identity = `%id. target Drosophila melanogaster gene identical to query gene`) %>%
  dplyr::rename( aaeg_to_dmel_identity = `%id. query gene identical to target Drosophila melanogaster gene`)

#aaeg_dmel_orthologs %>%
#  dplyr::filter(gene == "AAEL026022")


usethis::use_data(aaeg_dmel_orthologs, overwrite = TRUE, compress = "xz")
