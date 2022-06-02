library(readxl)
library(readr)
library(janitor)
library(dplyr)
library(tidyr)
library(lubridate)
library(deltafish)

setwd("~/burdi_submission/")










### stations


stations <- read.csv("raw_files/station regions.csv") %>%
    clean_names() %>%
    rename(lon = startx,
           lat = starty)


write.csv(stations, "converted_files/stations.csv", row.names = F)

zoop_weight_conv <- read_csv("raw_files/Zooplankton Weight Conversions.csv", show_col_types = F) %>%
    clean_names()

zoop_lw_eq <- read_csv("raw_files/Zooplankton Length Weight Equations.csv", show_col_types = F) %>%
    clean_names()





