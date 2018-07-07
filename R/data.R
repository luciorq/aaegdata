#' @title aaegL5.1 Gene symbol Conversion Dataset
#'
#' @description This dataset is used to convert gene symbols used in different
#'              databases, e.g. NCBI Gene, KEGG, emsembl and VectorBase.
#'
#' @format a \code{tibble} with X column which are:
#' \describe{
#'   \item{gene}{gene symbol}
#'   \item{vectorbase}{gene symbol used by vectorbase}
#'   \item{ncbi}{gene symbol used by ncbi}
#' }
#' @source \url{https://www.vectorbase.org/}
#'
"aaegl51_symbol_conversion"
