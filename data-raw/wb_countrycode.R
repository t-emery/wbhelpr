# wb_countrycode

library(tidyverse)
library(countrycode)
library(here)
library(janitor)

# create data and data-raw directory if it doesn't exist

if (!dir.exists("data-raw")) {
  dir.create("data-raw")
}

if (!dir.exists("data")) {
  dir.create("data")
}
#

country_codes_select <- c("country.name.en","wb.name", "cldr.short.en", "iso2c",
                          "iso3c", "iso3n","imf", "continent", "country.name.en.regex")

wb_countrycode <- countrycode::codelist %>%
  select(all_of(country_codes_select)) %>%
  clean_names() %>%
  as_tibble() %>%
  rename(country = country_name_en) %>%
  mutate(is_wb_country = if_else(!is.na(wb_name), true = TRUE, false = FALSE)) %>%
  select(country, is_wb_country, everything())

wb_countrycode

write_csv(wb_countrycode, here("data-raw","wb_countrycode.csv"))
save(wb_countrycode, file =  here("data","wb_countrycode.rda"))
