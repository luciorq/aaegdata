## data-raw/aaegl51.R
## Gene Ontology and KEGG data for aaegL5.1 gene set
## NCBI conversion
## Source VectorBase BioMart
##

library(dplyr)

aaegl51_gene_tx_description <- readr::read_csv("data-raw/vectorbase/aaegl51_vectorbase_gene_description.csv")

## Gene description
aaegl51_description <- aaegl51_gene_tx_description %>%
  dplyr::select(-`Transcript stable ID`) %>%
  dplyr::arrange(`Gene stable ID`) %>%
  dplyr::distinct() %>%
  dplyr::rename(gene = `Gene stable ID`) %>%
  dplyr::rename(description = `Gene description`) %>%
  dplyr::rename(gene_name = `Gene name`)

gene_description <- aaegl51_description
usethis::use_data(gene_description, overwrite = TRUE, compress = "xz")

## tx2gene
aaegl51_tx2gene <- aaegl51_gene_tx_description %>%
  dplyr::select(`Gene stable ID`, `Transcript stable ID`) %>%
  dplyr::arrange(`Gene stable ID`) %>%
  dplyr::distinct() %>%
  dplyr::rename(TXNAME = `Transcript stable ID`) %>%
  dplyr::rename(GENEID = `Gene stable ID`)

transcript_to_gene <- aaegl51_tx2gene
usethis::use_data(transcript_to_gene, overwrite = TRUE, compress = "xz")

## Vectorbase to NCBI genes
aaegl51_ncbi <- readr::read_csv("data-raw/vectorbase/aaegl51_vectorbase_gene_ncbi.csv")
aaegl51_ncbi
# aaegl51_ncbi %>%
#  dplyr::filter(`NCBI gene ID` == 33307548)
# aaegl51_description %>%
#  dplyr::filter(`Gene stable ID` == "AAEL018681")

## KEGG Pathways - incomplete
aaegl51_kegg_df <- readr::read_csv("data-raw/vectorbase/aaegl51_vectorbase_kegg.csv")
aaegl51_kegg_df %>%
  dplyr::filter(!is.na(`KEGG Pathway and Enzyme ID`)) %>%
  tidyr::separate(`KEGG Pathway and Enzyme ID`, c("KEGG", "enzyme_id")) %>%
  dplyr::select(-enzyme_id)
# readr::read_rds("data-raw/gene_sets/aag_kegg_gene_sets.rds")
