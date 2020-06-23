#' World Bank country groupings.
#'
#' A dataset in tidy format containing the constituent countries of all
#' World Bank country groupings.  These groupings are related to geographical
#' regions, income groups, demographic groups, and other characteristics. A
#' list of all of the groups in available in the data object
#' `wb_country_groups_list`
#'
#'
#' @format A tibble with 2,066 rows and 4 variables:
#' \describe{
#'   \item{group_code}{World Bank three letter code for the country grouping.}
#'   \item{group_name}{World Bank country grouping.}
#'   \item{iso3c}{The iso3c three letter country code}
#'   \item{country}{The country or region}
#'   ...
#' }
#' @source \url{http://databank.worldbank.org/data/download/site-content/CLASS.xls}
"wb_country_groups"

#' World Bank country groupings.
#'
#' A dataset in tidy format containing the 46 unique country groupings.  They
#' are related to region, income groups, demographic groups, and other
#' features.  The constituent countries of these groups can be found in d
#' `wb_country_groups``
#'
#'
#' @format A tibble with 46 rows and 2 variables:
#' \describe{
#'   \item{group_code}{World Bank three letter code for the country grouping.}
#'   \item{group_name}{World Bank country grouping.}
#'   ...
#' }
#' @source \url{http://databank.worldbank.org/data/download/site-content/CLASS.xls}
"wb_country_groups_list"
