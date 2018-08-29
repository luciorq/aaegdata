#' @title Gene Ontology Gene Sets
#'
#' @description This dataset contains the Aedes aegypti genes from
#'   each Gene Ontology in a tidy format. AaegL5.1
#'
#' @format a \code{tibble} with 3 column which are:
#' \describe{
#'   \item{gene_ontology}{Gene Ontology with code}
#'   \item{gene}{VectorBase gene symbol}
#'   \item{go_domain}{Gene Ontology domain}
#' }
#' @source \url{http://biomart.vectorbase.org/biomart/martview?VIRTUALSCHEMANAME=vb_mart_1806&ATTRIBUTES=alvpagwg_eg_gene.default.feature_page.ensembl_gene_id|alvpagwg_eg_gene.default.feature_page.go_id|alvpagwg_eg_gene.default.feature_page.name_1006|alvpagwg_eg_gene.default.feature_page.namespace_1003&FILTERS=&VISIBLEPANEL=resultspanel}
#'
"go_gene_sets"

#' @title Gene Ontology Gene Sets
#'
#' @description This dataset contains the Aedes aegypti genes from
#'   each Gene Ontology in a list format,
#'   required for some bioconductor packages.
#'
#' @format a named \code{list} which each element is a Gene Ontology,
#'   containg a vector of the VectorBase genes for each GO
#'
#' @source \url{http://biomart.vectorbase.org/biomart/martview?VIRTUALSCHEMANAME=vb_mart_1806&ATTRIBUTES=alvpagwg_eg_gene.default.feature_page.ensembl_gene_id|alvpagwg_eg_gene.default.feature_page.go_id|alvpagwg_eg_gene.default.feature_page.name_1006|alvpagwg_eg_gene.default.feature_page.namespace_1003&FILTERS=&VISIBLEPANEL=resultspanel}
#'
"go_gene_sets_list"
