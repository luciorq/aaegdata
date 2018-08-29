
<!-- README.md is generated from README.Rmd. Please edit that file -->
aaegdata <img src="man/figures/logo.png" align="right" height=140/>
===================================================================

[![DOI](https://zenodo.org/badge/138066714.svg)](https://zenodo.org/badge/latestdoi/138066714) <!-- [![Travis-CI Build Status](https://travis-ci.org/r-lib/pkgdown.svg?branch=master)](https://travis-ci.org/r-lib/pkgdown) --> <!-- [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/r-lib/pkgdown?branch=master&svg=true)](https://ci.appveyor.com/project/r-lib/pkgdown) --> <!-- [![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing) --> <!-- [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) --> <!-- [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/pkgdown)](https://cran.r-project.org/package=pkgdown) --> <!-- [![Coverage Status](https://img.shields.io/codecov/c/github/r-lib/pkgdown/master.svg)](https://codecov.io/github/r-lib/pkgdown?branch=master) -->

This is a data package containing *Aedes aegypti* vector mosquitoes biologically relevant molecular and biochemical data. Data colected from public available databases and presented here in a clean, structured and ready to use format. The consistent format used for the data allows the use of modern syntax and tools to be used with this package.

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

Examples
--------

Those are basic examples which shows you how to solve common problems:

### Check first 15 genes that changed annotation in AaegL5.1

``` r
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
```

| gene\_aaegl35 | gene\_aaegl51 |
|:--------------|:--------------|
| AAEL000003    | AAEL021256    |
| AAEL000014    | AAEL019508    |
| AAEL000015    | AAEL019624    |
| AAEL000015    | AAEL019625    |
| AAEL000034    | AAEL023601    |
| AAEL000054    | AAEL021963    |
| AAEL000060    | AAEL024813    |
| AAEL000062    | AAEL022948    |
| AAEL000067    | AAEL026496    |
| AAEL000068    | AAEL021083    |
| AAEL000070    | AAEL021708    |
| AAEL000082    | AAEL020708    |
| AAEL000083    | AAEL019508    |
| AAEL000086    | AAEL026937    |
| AAEL000093    | AAEL025818    |

### Retrieving gene ontologies for a gene

``` r
## Using gene AAEL000986
aaegdata::go_gene_sets %>%
  dplyr::filter(gene == "AAEL000986") %>%
  dplyr::select( -gene)
```

| gene\_ontology                                                    | go\_domain          |
|:------------------------------------------------------------------|:--------------------|
| <GO:0003954_NADH> dehydrogenase activity                          | molecular\_function |
| <GO:0005739_mitochondrion>                                        | cellular\_component |
| <GO:0005747_mitochondrial> respiratory chain complex I            | cellular\_component |
| <GO:0006120_mitochondrial> electron transport, NADH to ubiquinone | biological\_process |
| <GO:0008137_NADH> dehydrogenase (ubiquinone) activity             | molecular\_function |
| <GO:0016021_integral> component of membrane                       | cellular\_component |

### Checking gene description by part of name

``` r
library(stringr)
aaegdata::gene_description %>%
  dplyr::filter( stringr::str_detect( gene_name, "Rpl") )
```

| gene       | description                                                                 | gene\_name |
|:-----------|:----------------------------------------------------------------------------|:-----------|
| AAEL000010 | 60S ribosomal protein L36 \[Source:UniProtKB/TrEMBL;Acc:Q1HR17\]            | Rpl36-1    |
| AAEL000823 | 60S ribosomal protein L35A, putative \[Source:UniProtKB/TrEMBL;Acc:Q17N60\] | Rpl35      |
| AAEL002639 | 60S ribosomal protein L36 \[Source:UniProtKB/TrEMBL;Acc:Q17HK5\]            | Rpl36-2    |

### Computed homology in the closest model organism (*D. melanogaster*)

``` r
aaegdata::aaeg_dmel_orthologs %>%
  dplyr::filter( gene == "AAEL000986")
```

| gene       | dmel\_gene  | dmel\_gene\_name | dmel\_homology\_type |  dmel\_to\_aaeg\_identity|  aaeg\_to\_dmel\_identity| dmel\_protein |
|:-----------|:------------|:-----------------|:---------------------|-------------------------:|-------------------------:|:--------------|
| AAEL000986 | FBgn0029888 | ND-ASHI          | ortholog\_one2one    |                   56.3218|                        56| FBpp0070950   |

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
