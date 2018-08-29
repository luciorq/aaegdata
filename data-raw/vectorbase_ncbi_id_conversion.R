## data_raw/vectorbase_ncbi_id_conversion.R
## source: http://biomart.vectorbase.org/biomart/martview?VIRTUALSCHEMANAME=vb_mart_1806&ATTRIBUTES=alvpagwg_eg_gene.default.feature_page.ensembl_gene_id|alvpagwg_eg_gene.default.feature_page.entrezgene&FILTERS=&VISIBLEPANEL=resultspanel
## path to file: "data-raw/vectorbase/aaegl51_vectorbase_gene_ncbi.csv"

library(dplyr)
aaegl51_vectorbase_gene_ncbi <- readr::read_csv("data-raw/vectorbase/aaegl51_vectorbase_gene_ncbi.csv")

aaegl51_vectorbase_gene_ncbi %<>%
  dplyr::rename( gene = `Gene stable ID`) %>%
  dplyr::rename( ncbi_gene = `NCBI gene ID`) %>%
  dplyr::distinct() %>%
  {.}

aaegl51_vectorbase_gene_ncbi %>%
  dplyr::select(ncbi_gene) %>%
  dplyr::distinct()

utils::download.file(
  "ftp://ftp.ncbi.nlm.nih.gov/gene/DATA/GENE_INFO/Invertebrates/All_Invertebrates.gene_info.gz",
  "data-raw/ncbi/ncbi_invertebrate_gene_info.txt.gz"
)

ncbi_invertebrate_gene_info_txt <- readr::read_delim("data-raw/ncbi/ncbi_invertebrate_gene_info.txt.gz",
                                                     "\t", escape_double = FALSE, trim_ws = TRUE)


aaeg_taxid = "7159"
ncbi_invertebrate_gene_info_txt %>%
  nrow()
aaeg_ncbi_gene_description <- ncbi_invertebrate_gene_info_txt %>%
  dplyr::filter(`#tax_id` == aaeg_taxid ) %>%
  dplyr::select( -`#tax_id` )

ncbi_gene_description <- aaeg_ncbi_gene_description %>%
  dplyr::mutate(gene = stringr::str_remove(LocusTag,"AaeL_")) %>%
  dplyr::mutate(ncbi_gene = as.character(GeneID)) %>%
  #DT::datatable()
  dplyr::select(gene, ncbi_gene, Symbol, description, Other_designations) %>%
  dplyr::distinct()

usethis::use_data(ncbi_gene_description, overwrite = TRUE, compress = "xz")


