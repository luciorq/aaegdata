## data-raw/annotation_conversion.R
## source: https://www.vectorbase.org/downloads?field_organism_taxonomy_tid%5B%5D=372&field_download_file_type_tid%5B%5D=1228&field_download_file_format_tid=All&field_status_value=Current
## source: https://www.vectorbase.org/download/aedes-aegypti-liverpoolmappingsaaegl35-aaegl51txt
## Path "data-raw/id_mappings/Aedes-aegypti-Liverpool_MAPPINGS_AaegL3.5-AaegL5.1.txt"

library(dplyr)

##
aaegl33_to_aaegl34_df <- readr::read_table2("data-raw/id_mappings/Aedes-aegypti-Liverpool_MAPPINGS_AaegL3.3-AaegL3.4.txt",
                                            col_types = readr::cols(
                                              new_end = readr::col_character(),
                                              new_start = readr::col_character(),
                                              new_strand = readr::col_character(),
                                              old_end = readr::col_character(),
                                              old_start = readr::col_character(),
                                              old_strand = readr::col_character()
                                            )
)
## ids that were deprecated
aaegl33_to_aaegl34_df %>%
  dplyr::select(old_stable_id) %>%
  dplyr::distinct() %>%
  dplyr::mutate(gene = stringr::str_extract(old_stable_id,"AAEL\\d+")) %>%
  dplyr::mutate(gene_id = as.numeric(stringr::str_extract(gene, "\\d+"))) %>%
  .$gene_id %>%
  boxplot()#hist()


## type change from aaegL3.3 to aaegL3.4
aaegl33_to_aaegl34_df %>%
  dplyr::select(old_biotype,new_biotype) %>%
  dplyr::distinct()
##

## From AaegL3.5 to AaegL5.1
## [Stable ID mapping between genesets AaegL3.5 and AaegL5.1]
aaegl35_to_aaegl51_df <- readr::read_table2("data-raw/id_mappings/Aedes-aegypti-Liverpool_MAPPINGS_AaegL3.5-AaegL5.1.txt",
                                            col_types = readr::cols(new_version = readr::col_character()))


annotation_conversion <- aaegl35_to_aaegl51_df %>%
  dplyr::select(old_stable_id, new_stable_id) %>%
  dplyr::rename(gene_aaegl35 = old_stable_id) %>%
  dplyr::rename(gene_aaegl51 = new_stable_id) %>%
  dplyr::mutate(gene_aaegl35 = dplyr::if_else(gene_aaegl35 == "NULL", NA_character_, gene_aaegl35)) %>%
  dplyr::mutate(gene_aaegl51 = dplyr::if_else(gene_aaegl51 == "NULL", NA_character_, gene_aaegl51)) %>%
  dplyr::distinct() %>%
  #dplyr::filter(gene_aaegl35 %>% is.na())
  {.}


usethis::use_data(annotation_conversion, overwrite = TRUE, compress = "xz")
