#' @title VectorBase Gene Description
#'
#' @description This dataset contains the description and names for
#'   Aedes aegypti genes.
#'
#' @format a \code{tibble} with 3 column which are:
#' \describe{
#'   \item{gene}{VectorBase gene symbol}
#'   \item{description}{Gene product name or description}
#'   \item{gene_name}{Gene name}
#' }
#' @source \url{http://biomart.vectorbase.org/biomart/}
#'
"gene_description"

#' @title Transcript to Gene Level Conversion Table
#'
#' @description Dataset used to convert transcript level to gene level analysis
#'   for the Aedes aegypti AaegL5.1 - TX2GENE.
#'
#' @format a \code{tibble} with 2 column which are:
#' \describe{
#'   \item{TXNAME}{VectorBase transcript}
#'   \item{GENEID}{VectorBase gene}
#' }
#' @source \url{http://biomart.vectorbase.org/biomart/}
#'
"transcript_to_gene"
