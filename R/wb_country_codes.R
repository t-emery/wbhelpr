

#' Country regex to iso3c
#'
#' Convert a country name to iso3c country code using regular expressions.
#'
#' This function uses regular expressions to convert a country name written in
#' a variety of formats into iso3c code.  For example, the function will convert both "Russia" and "Russian Federation"
#' to the correct iso3c code "RUS".  This can be particularly useful when merging data from multiple sources.
#' From iso3c country names can easily be converted into other formats. This is a simple convenience function written
#' on top of the \code{countrycode} package.
#'
#' @param country_name a string containing a country name
#'
#' @import countrycode
#'
#' @return a string containing the three letter iso3c country code
#' @export
#'
#' @examples
#' country_regex_to_iso3c("Russia")
#' country_regex_to_iso3c("Russian Federation")
country_regex_to_iso3c <- function(country_name) {
  countrycode::countrycode(sourcevar = country_name, origin = 'country.name', destination = 'iso3c', origin_regex = TRUE)
}






#' iso3c to country name
#'
#' Convert an iso3c country code into a country name
#'
#' This function converts an iso3c country code into the country name.  It is simple convenience function written on top of
#' the \code{countrycode package}. When working with data coming from different sources, a common workflow may be to use \code{country_regex_to_iso3c}
#' to convert country names written in different ways ("Ivory Coast" vs. "Cote D'Ivoire") into a unique iso3c country code, and then to use
#' \code{iso3c_to_country_name} to convert the iso3c codes back into uniform country names.
#'
#'
#' @param iso3c a string containing an iso3c country code
#'
#' @import countrycode
#'
#' @return  a string containing the country name
#' @export
#'
#' @examples
#' iso3c_to_country_name("NAM")
#'
#' "Bolivarian Republic of Venezuela" %>%
#'   country_regex_to_iso3c() %>%
#'   iso3c_to_country_name()
#'
#'
iso3c_to_country_name <- function(iso3c) {
  countrycode::countrycode(sourcevar = iso3c, origin = 'iso3c', destination = 'country.name')
}




#' iso2c to iso3c
#'
#' Convert an iso2c country code into an iso3c country code
#'
#' This function will convert an iso2c country code into an iso3c country code.
#' It is a simple convenience function built on top of the \code{countrycode} package.
#' While somewhat arbitrary, iso3c may be a better default because the iso2c for
#' Namibia is "NA", which can cause innadvertant (and often silent) errors if R interprets it as
#' an \code{NA} value.   Better to go with the iso3c code where Namibia is "NAM" and avoid those problems.
#'
#'
#' @param iso2c a string containing an iso2c country code
#'
#' @import countrycode
#'
#' @return string containing an iso3c country code
#' @export
#'
#' @examples
#' iso2c_to_iso3c("NA")
#'
iso2c_to_iso3c <- function(iso2c) {
  countrycode::countrycode(sourcevar = iso2c, origin = 'iso2c', destination = 'iso3c')
}
