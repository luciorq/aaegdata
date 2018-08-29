#' @title NCBI Gene gene description
#'
#' @description This dataset is used to convert gene symbols,accession and
#'              ids from VectorBase to NCBI Gene information and check annotataion
#'              data, AaegL5.1
#'
#' @format a \code{tibble} with 5 column which are:
#' \describe{
#'   \item{gene}{VectorBase gene symbol}
#'   \item{ncbi_gene}{accesion number used by ncbi}
#'   \item{Symbol}{NCBI gene symbol}
#'   \item{description}{Gene description}
#'   \item{Other_description}{Alternative gene annotation}
#' }
#' @source \url{https://www.vectorbase.org/}
#'
"ncbi_gene_description"
