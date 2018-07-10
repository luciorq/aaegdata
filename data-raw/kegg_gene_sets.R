## data-raw/kegg_gene_sets.R
## source: https://www.kegg.jp/kegg-bin/download_htext?htext=aag00001&format=json&filedir=
## Path: "data-raw/kegg/aag00001.json"


library(dplyr)
x <- jsonlite::fromJSON("data-raw/kegg/aag00001.json")

x2 <- dplyr::data_frame(x)
x3 <- x2[2,] %>%
  tidyr::unnest() %>%
  tidyr::unnest() %>%
  tidyr::unnest()

names(x3$children) <- x3$name2
x4 <- x3$children %>%
  unlist()
x5 <- dplyr::data_frame(
  pathway = names(x4),
  gene = x4
)
x6 <- x5 %>%
  tidyr::separate(pathway,c("pathway", "to_drop"), sep = stringr::fixed(".name")) %>%
  dplyr::select(-to_drop) %>%
  dplyr::mutate(ncbi_gene = stringr::str_extract(gene,"\\d+"))

aaegl51_ncbi <- readr::read_csv("data-raw/vectorbase/aaegl51_vectorbase_gene_ncbi.csv") %>%
  dplyr::mutate("ncbi_gene" = as.character(`NCBI gene ID`))

aaegl51_kegg_gene_set_df <- x6 %>%
  dplyr::select(-gene) %>%
  dplyr::left_join(aaegl51_ncbi, by = "ncbi_gene") %>%
  dplyr::select(-c(`NCBI gene ID`, ncbi_gene) ) %>%
  dplyr::rename(gene = `Gene stable ID`) %>%
  dplyr::arrange(pathway, gene) %>%
  dplyr::distinct()
#aaegl51_kegg_gene_set_df

temp_list <- aaegl51_kegg_gene_set_df %>%
  dplyr::group_by(pathway) %>%
  dplyr::summarise(gene = list(gene))

aaegl51_kegg_gene_set_list <- temp_list$gene
names(aaegl51_kegg_gene_set_list) <- temp_list$pathway

#aaegl51_kegg_gene_set_list %>%
#  head
kegg_gene_sets <- aaegl51_kegg_gene_set_df
usethis::use_data(kegg_gene_sets, overwrite = TRUE, compress = "xz")

kegg_gene_sets_list <- aaegl51_kegg_gene_set_list
usethis::use_data(kegg_gene_sets_list, overwrite = TRUE, compress = "xz")
