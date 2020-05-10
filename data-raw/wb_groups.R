# World Bank Country Groups
#
# Purpose:  This script cleans and processes data from a World Bank spreadsheet that has
# information about country groups (region, income group, lending category, other groupings)
#
# Output:
# wb_lending_groups:  this tibble has 218 economies (usually, but not always, sovereign countries).
# for each it has the region, current income group, lending category, and other (HIPC/EMU)
#
# wb_country_groups:  this tibble has the full list of countries in each country grouping..
# The groupings are based on region, income groups, demographic traits, & political groupings.
#
# wb_country_groups_list:  this tibble has all 46 unique groupings in the wb_country_groups tibble.


library(tidyverse)
library(readxl) # for reading excel documents
library(here) # for files paths
library(janitor) # for clean_names()
###

# create data and data-raw directory if it doesn't exist

if (!dir.exists("data-raw")) {
  dir.create("data-raw")
}

if (!dir.exists("data")) {
  dir.create("data")
}

## info about the file

url <- "http://databank.worldbank.org/data/download/site-content/CLASS.xls"

file_name <- basename(url)

file_path <- here("data-raw",file_name)

# dowload the file if it hasn't been downloaded
if (!file.exists(file_path)) {
  download.file(url = url, file_path)
}

#
wb_country_list <- read_excel(file_path, skip = 4,
                                sheet = "List of economies",
                                #  NAs show up as ".."
                                na = c(".."))  %>%
  # get rid of empty columns
  select(-`x...2`, -X) %>%
  # there are regional groups after the last country (Zimbabwe). We're going to use the index
  # number to deal with this issue
  rename(index_number = `x...1`) %>%
  filter(index_number != "x") %>%
  mutate(index_number = as.numeric(index_number)) %>%
  #makes all colunn names into snake_case
  clean_names() %>%
  rename(iso3c = code, country = economy)

wb_country_list

index_of_last_country <- wb_country_list %>%
  filter(country == "Zimbabwe") %>%
  pull(index_number)

index_of_last_country

wb_country_list <- wb_country_list %>%
  head(index_of_last_country) %>%
  select(-index_number)

wb_country_list

write_csv(wb_country_list, here("data-raw","wb_country_list.csv"))
save(wb_country_list, file =  here("data","wb_country_list.rda"))


# Now for the second sheet containing country groups

wb_country_groups <- read_excel(here("data-raw","Class.xls"),
                                sheet = "Groups") %>%
  clean_names() %>%
  # for consistency with the tibble above
  rename(iso3c = country_code, country = country_name)

wb_country_groups

write_csv(wb_country_groups, here("data-raw","wb_country_groups.csv"))
save(wb_country_groups, file =  here("data","wb_country_groups.rda"))

#

wb_country_groups_list <- wb_country_groups %>%
  select(contains("group")) %>%
  unique()

wb_country_groups_list

write_csv(wb_country_groups_list, here("data-raw","wb_country_groups_list.csv"))
save(wb_country_groups_list, file =  here("data","wb_country_groups_list.rda"))





