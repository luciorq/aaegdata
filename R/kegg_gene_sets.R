#' @title KEGG Pathways Gene Sets
#'
#' @description This dataset contains the Aedes aegypti genes from
#'   each KEGG Pathway in a tidy format.
#'
#' @format a \code{tibble} with 2 column which are:
#' \describe{
#'   \item{pathway}{KEGG Pathway name with code}
#'   \item{gene}{VectorBase gene symbol}
#' }
#' @source \url{https://www.kegg.jp/kegg-bin/download_htext?htext=aag00001&format=json&filedir=}
#'
"kegg_gene_sets"

#' @title KEGG Pathways Gene Sets
#'
#' @description This dataset contains the Aedes aegypti genes from
#'   each KEGG Pathway in a list format,
#'   required for some bioconductor packages.
#'
#' @format a named \code{list} which each element is a KEGG Pathway, containg a
#'   vector of the VectorBase genes for each pathway
#'
#' @source \url{https://www.kegg.jp/kegg-bin/download_htext?htext=aag00001&format=json&filedir=}
#'
"kegg_gene_sets_list"
