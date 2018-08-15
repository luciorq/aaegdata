#' @title Drosophila melanogaster orthologs to Aedes aegypti genes
#'
#' @description This dataset contains the Drosophila melanogaster fruitfly
#'   orthologous genes to Aedes aegypti genes with the orthology type and
#'   percent identity from D. melanogaster to A. aegypti and from A. aegypti to
#'   D. melanogaster, in a data frame.
#'
#' @format a \code{tibble} with 7 column which are:
#' \describe{
#'   \item{gene}{VectorBase gene symbol}
#'   \item{dmel_gene}{FlyBase gene accession}
#'   \item{dmel_gene_name}{Drosophila melanogaster gene name}
#'   \item{dmel_homology_type}{Drosophila melanogaster homology type}
#'   \item{dmel_to_aaeg_identity}{percentage identity target Drosophila melanogaster gene identical to query gene}
#'   \item{aaeg_to_dmel_identity}{percentage identity query gene identical to target Drosophila melanogaster gene}
#'   \item{dmel_protein}{Drosophila melanogaster protein accession}
#' }
#' @source \url{http://biomart.vectorbase.org/biomart/martview?VIRTUALSCHEMANAME=vb_mart_1806&ATTRIBUTES=alvpagwg_eg_gene.default.homologs.ensembl_gene_id|alvpagwg_eg_gene.default.homologs.dmelanogaster_eg_homolog_ensembl_gene|alvpagwg_eg_gene.default.homologs.dmelanogaster_eg_homolog_associated_gene_name|alvpagwg_eg_gene.default.homologs.dmelanogaster_eg_homolog_orthology_type|alvpagwg_eg_gene.default.homologs.dmelanogaster_eg_homolog_perc_id|alvpagwg_eg_gene.default.homologs.dmelanogaster_eg_homolog_perc_id_r1|alvpagwg_eg_gene.default.homologs.dmelanogaster_eg_homolog_ensembl_peptide&FILTERS=&VISIBLEPANEL=resultspanel}
#'
"aaeg_dmel_orthologs"
