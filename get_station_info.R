library(deltafish)
library(dplyr)
library(janitor)
library(readr)

sur <- open_survey()
diet <- read_csv("~/burdi_submission/converted_files/diet-by-number-matrix.csv")

diet_stations <- diet %>%
    distinct(station)

surv_stations <- sur %>%
    distinct(Station, Latitude, Longitude) %>%
    collect() %>%
    clean_names()

diet_loc <- left_join(diet_stations, surv_stations) %>%
    group_by(station) %>%
    summarise(longtidue = mean(longitude),
              latitude = mean(latitude))

write_csv(diet_loc, "~/burdi_submission/converted_files/station_locations.csv")
