## Gene synbol conversion from different data bases

aaegl51_symbol_conversion <- readr::read_csv("data-raw/Aael51-GO-KEGG-NCBI.txt")

usethis::use_data(aaegl51_symbol_conversion, overwrite = TRUE, compress = "xz")
