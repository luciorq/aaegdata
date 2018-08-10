
<!-- README.md is generated from README.Rmd. Please edit that file -->
aaegdata
========

This is a data package containing *Aedes aegypti* vector mosquitoes biological relevant molecular and biochemical data. Data colected from public available databases and presented here in a clean, structured and ready to use format. The consistent format used for the data allows the use of modern syntax and tools to be used with this package.

Installation
------------

<!-- You can install the released version of aaegdata from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("aaegdata")
```
-->
You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("luciorq/aaegdata")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
## Check first 15 genes that changed annotation

library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

aaegdata::annotation_conversion %>%
  dplyr::filter( !is.na(gene_aaegl35) & !is.na(gene_aaegl51)) %>%
  dplyr::filter( gene_aaegl35 != gene_aaegl51 ) %>%
  head(15)
#> # A tibble: 15 x 2
#>    gene_aaegl35 gene_aaegl51
#>    <chr>        <chr>       
#>  1 AAEL000003   AAEL021256  
#>  2 AAEL000014   AAEL019508  
#>  3 AAEL000015   AAEL019624  
#>  4 AAEL000015   AAEL019625  
#>  5 AAEL000034   AAEL023601  
#>  6 AAEL000054   AAEL021963  
#>  7 AAEL000060   AAEL024813  
#>  8 AAEL000062   AAEL022948  
#>  9 AAEL000067   AAEL026496  
#> 10 AAEL000068   AAEL021083  
#> 11 AAEL000070   AAEL021708  
#> 12 AAEL000082   AAEL020708  
#> 13 AAEL000083   AAEL019508  
#> 14 AAEL000086   AAEL026937  
#> 15 AAEL000093   AAEL025818
```

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
