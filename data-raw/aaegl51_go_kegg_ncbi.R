## data-raw/aaegl51_go_kegg_ncbi.R
## Gene Ontology and KEGG data for aaegL5.1 gene set
## NCBI conversion
## Source VectorBase BioMart
##

aaegl51_gene_conversion <- readr::read_csv("data-raw/Aael51-GO-KEGG-NCBI.txt")

usethis::use_data(aaegl51_gene_conversion, overwrite = TRUE, compress = "xz")
