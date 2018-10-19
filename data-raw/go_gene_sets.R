## data-raw/go_gene_sets.R
## source: http://biomart.vectorbase.org/biomart/martview?VIRTUALSCHEMANAME=vb_mart_1806&ATTRIBUTES=alvpagwg_eg_gene.default.feature_page.ensembl_gene_id|alvpagwg_eg_gene.default.feature_page.go_id|alvpagwg_eg_gene.default.feature_page.name_1006|alvpagwg_eg_gene.default.feature_page.namespace_1003&FILTERS=&VISIBLEPANEL=resultspanel
## Path: "data-raw/vectorbase/aaegl51_vectorbase_go.csv"

## Gene Ontology
library(dplyr)
aaegl51_go <- readr::read_csv("data-raw/vectorbase/aaegl51_vectorbase_go.csv")
aaegl51_go_df <- aaegl51_go %>%
  dplyr::arrange(`GO term accession`, `Gene stable ID`) %>%
  dplyr::filter(!is.na(`GO term accession`)) %>%
  tidyr::unite(GO, `GO term accession`, `GO term name`) %>%
  dplyr::rename(gene_ontology = GO) %>%
  dplyr::rename(gene = `Gene stable ID`) %>%
  dplyr::rename(go_domain = `GO domain`) %>%
  dplyr::select(gene_ontology, gene, go_domain) %>%
  dplyr::distinct()

temp_list <- aaegl51_go_df %>%
  dplyr::select(-go_domain) %>%
  dplyr::group_by(gene_ontology) %>%
  dplyr::summarise(gene = list(gene))

aaegl51_go_gene_set_list <- temp_list$gene
names(aaegl51_go_gene_set_list) <- temp_list$gene_ontology

## go gene_sets df
go_gene_sets <- aaegl51_go_df
usethis::use_data(go_gene_sets, overwrite = TRUE, compress = "xz")

## go gene_sets list
go_gene_sets_list <- aaegl51_go_gene_set_list
usethis::use_data(go_gene_sets_list, overwrite = TRUE, compress = "xz")
