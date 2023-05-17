
<!-- README.md is generated from README.Rmd. Please edit that file -->

# D6recaptureR

<!-- badges: start -->
<!-- badges: end -->

The goal of D6recaptureR is to help us during swallow recapturing

## Installation

You can install the development version of D6recaptureR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mariusgrabow/D6recaptureR")
```

## Example

This is a basic example which shows you how to handle a recapture:

1.  You need a dataframe named cmr (case-sensitive) from the last years
    (provided by Marius). Here, we will work with one example from one
    bird (included in the package)

Please note: In this example, cmr has 11 rows

``` r

library(D6recaptureR)

cmr<-D6recaptureR::cmr_filter
nrow(cmr)
#> [1] 11
```

Imagine you recaptured bird (VH59051) and would like to know the capture
history:

(You can write vh59051 or VH59051, the package corrects to Uppercase)

``` r
re(vh59051)
#> Adding missing grouping variables: `ring_id`
#>    ring_id       date     time sex tars_mm weight_g blood_infection
#> 1  VH59051 2020-06-06 12:40:00   f    11.5     20.1            <NA>
#> 2  VH59051 2020-06-06 17:06:00   f    11.5     20.1            <NA>
#> 3  VH59051 2020-06-06 17:30:00   f    11.5     20.1            <NA>
#> 4  VH59051 2020-06-17 10:37:00   f    11.5     19.9            <NA>
#> 5  VH59051 2020-06-17 14:43:00   f    11.5     19.7            <NA>
#> 6  VH59051 2020-06-17 15:15:00   f    11.5     19.3            <NA>
#> 7  VH59051 2021-05-26 17:49:00   f    11.0     19.8               y
#> 8  VH59051 2021-06-07 16:06:00   f    11.5     19.7               y
#> 9  VH59051 2022-05-26 10:50:00   f    11.4     20.6               n
#> 10 VH59051 2022-05-26 14:45:00   f    11.3     20.6               n
#> 11 VH59051 2022-06-09 13:08:00   f    11.3     19.4               n
#>    infection_type tag_id
#> 1            <NA>     NA
#> 2            <NA>     NA
#> 3            <NA>     NA
#> 4            <NA>     NA
#> 5            <NA>     NA
#> 6            <NA>     NA
#> 7    haemoproteus     NA
#> 8    haemoproteus     NA
#> 9            none     NA
#> 10           none     NA
#> 11           none     NA
#> observation was added into global environment. cmr hat 1 more row now
```

Please note, cmr has 12 rows now (one was added with the System date &
time)

``` r
nrow(cmr)
#> [1] 12
```

Let’s look at the last observation, which we just added. Here, there is
data missing, although we might collected it manually on the field
sheets. However, this should save us a lot of time because we don’t have
to screen a pile of paper.

``` r
dplyr::slice_tail(cmr,n=1)
#> # A tibble: 1 × 9
#> # Groups:   ring_id [1]
#>   ring_id date   time            sex   tars_mm weight_g blood_infection
#>   <chr>   <date> <time>          <chr>   <dbl>    <dbl> <chr>          
#> 1 VH59051 NA     10:45:09.928695 <NA>       NA       NA <NA>           
#> # ℹ 2 more variables: infection_type <chr>, tag_id <dbl>
```
