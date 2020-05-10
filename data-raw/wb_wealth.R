
library(tidyverse)
library(here) # for files paths
library(wbstats)

# create data and data-raw directory if it doesn't exist

if (!dir.exists("data-raw")) {
  dir.create("data-raw")
}

if (!dir.exists("data")) {
  dir.create("data")
}

####

load(here("data", "wb_country_list.rda"))

wb_countries <- wb_country_list %>%
  select(country, iso3c)

wb_countries

###

wealth_data <- wb(indicator = "NY.GNP.PCAP.CD") %>%
  as_tibble()

##
wealth_data <- wealth_data %>%
  select(iso3c:value)

wealth_data

##

wb_country_wealth_data <- wb_countries %>%
  left_join(wealth_data, by = c("iso3c")) %>%
  mutate(date = as.numeric(date)) %>%
  rename(year = date, gni_per_capita = value)

wb_country_wealth_data

##

write_csv(wb_country_wealth_data, here("data-raw","wb_country_wealth_data.csv"))
save(wb_country_wealth_data, file =  here("data","wb_country_wealth_data.rda"))

##
country_wealth_latest_year <- wb_country_wealth_data %>%
  group_by(country, iso3c) %>%
  summarize(gni_per_capita_latest_year = max(year)) %>%
  ungroup()

country_wealth_latest_year


##

wb_country_wealth_latest_year <- wb_country_wealth_data %>%
  left_join(country_wealth_latest_year, by = c("country", "iso3c")) %>%
  filter(year == gni_per_capita_latest_year) %>%
  mutate(gni_per_capita_decile = ntile(gni_per_capita, n = 10),
         gni_per_capita_percentile = percent_rank(gni_per_capita) * 100)

wb_country_wealth_latest_year

##

write_csv(wb_country_wealth_latest_year, here("data-raw","wb_country_wealth_latest_year.csv"))
save(wb_country_wealth_latest_year, file =  here("data","wb_country_wealth_latest_year.rda"))



##

wb_country_wealth_2017 <- wb_country_wealth_data %>%
  left_join(country_wealth_latest_year, by = c("country", "iso3c")) %>%
  mutate(year_to_choose = if_else(gni_per_capita_latest_year < 2017,
                                  true = gni_per_capita_latest_year,
                                  false = 2017)) %>%
  filter(year == year_to_choose) %>%
  mutate(gni_per_capita_decile = ntile(gni_per_capita, n = 10),
         gni_per_capita_percentile = percent_rank(gni_per_capita) * 100) %>%
  select(-year_to_choose)

wb_country_wealth_2017




write_csv(wb_country_wealth_2017, here("data-raw","wb_country_wealth_2017.csv"))
save(wb_country_wealth_2017, file =  here("data","wb_country_wealth_2017.rda"))
