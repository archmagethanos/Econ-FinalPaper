################
# Victor Boyer
# April 3rd 2022
################
# Librarys
################
library(tidyverse)
library(data.table)
library(readxl)
library(readr)
################
# Load Data
################

natality <- read_delim("data/Natality, 2007-2020(1).txt", 
                                    delim = "\t", escape_double = FALSE, 
                                    trim_ws = TRUE)

incomes <- read_csv("data/CAINC1__ALL_AREAS_1969_2020.csv")

income = incomes %>%
  select(2, 55, 56) %>%
  separate(GeoName, c("county, state"), sep=",")

dt = natality %>%
  select(-1,-3) %>%
  separate(County, c("county", "state"), sep=",")


################
# Model
################
preprocess = as.data.table(dt)