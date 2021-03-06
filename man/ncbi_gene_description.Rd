% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ncbi_gene_description.R
\docType{data}
\name{ncbi_gene_description}
\alias{ncbi_gene_description}
\title{NCBI Gene gene description}
\format{a \code{tibble} with 5 column which are:
\describe{
  \item{gene}{VectorBase gene symbol}
  \item{ncbi_gene}{accesion number used by ncbi}
  \item{Symbol}{NCBI gene symbol}
  \item{description}{Gene description}
  \item{Other_description}{Alternative gene annotation}
}}
\source{
\url{https://www.vectorbase.org/}
}
\usage{
ncbi_gene_description
}
\description{
This dataset is used to convert gene symbols,accession and
             ids from VectorBase to NCBI Gene information and check annotataion
             data, AaegL5.1
}
\keyword{datasets}
