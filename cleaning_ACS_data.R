library(tidyverse)

setwd("/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files")

SNAP_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/ACS_17_5YR_S2201_with_ann.csv", na = "-") %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HC03_EST_VC01", "HC04_EST_VC01", "HC05_EST_VC01", "HC06_EST_VC01") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "HH_T_SNAP" = "HC03_EST_VC01", #"households receiving SNAP"
    "HH_P_SNAP" = "HC04_EST_VC01", #"percent households receiving SNAP"
    "HH_T_nSNAP" = "HC05_EST_VC01", #"households not receiving SNAP"
    "HH_P_nSNAP" = "HC06_EST_VC01" #"percent households not receiving SNAP"
  ) %>% 
  mutate( 
    "HH_T_SNAP" = ifelse(is.na(HH_T_SNAP), 0, HH_T_SNAP), 
    "HH_P_SNAP" = ifelse(is.na(HH_P_SNAP), 0, HH_P_SNAP),
    "HH_T_nSNAP" = ifelse(is.na(HH_T_nSNAP), 0, HH_T_nSNAP),
    "HH_P_nSNAP" = ifelse(is.na(HH_P_nSNAP), 0, HH_P_nSNAP)
  )

poverty_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/ACS_17_5YR_S1702_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HC01_EST_VC01", "HC02_EST_VC01") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "HH_T_num" = "HC01_EST_VC01",
    "HH_P_pov" = "HC02_EST_VC01" #percent of households below poverty line
  ) %>%
  mutate(
    "HH_P_pov" = ifelse(is.na(HH_P_pov), 0, HH_P_pov)
  )

unemployment_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/ACS_17_5YR_S2301_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HC01_EST_VC01", "HC02_EST_VC01", "HC03_EST_VC01", "HC04_EST_VC01") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "I_T_wa" = "HC01_EST_VC01", #number of people over 16
    "I_R_lfpart" = "HC02_EST_VC01", #labor force participation rate
    "I_O_ratio" = "HC03_EST_VC01", #employment/population ratio
    "I_R_unemp" = "HC04_EST_VC01" #unemployment rate
  )

eng_speaking_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/aff_download (1)/ACS_17_5YR_B06007_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HD01_VD03", "HD01_VD04", "HD01_VD05", "HD01_VD06", "HD01_VD07", "HD01_VD08", "HD01_VD09", "HD01_VD34") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "I_T_OE" = "HD01_VD03", 
    "I_T_SS" = "HD01_VD04", 
    "I_T_SS_E" = "HD01_VD05", 
    "I_T_SS_nE" = "HD01_VD06",
    "I_T_OL" = "HD01_VD07",
    "I_T_OL_E" = "HD01_VD08",
    "I_T_OL_nE" = "HD01_VD09",
    "I_T_FB" = "HD01_VD34"
  )

AA_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/aff_download (1)/ACS_17_5YR_B02009_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HD01_VD01") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "HH_T_AA" = "HD01_VD01"
  )

AI_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/aff_download (1)/ACS_17_5YR_B02010_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HD01_VD01") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "HH_T_AI" = "HD01_VD01"
  )

Latino_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/aff_download (1)/ACS_17_5YR_B03003_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HD01_VD03") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "HH_T_HL" = "HD01_VD03"
  )

commute_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/aff_download (1)/ACS_17_5YR_B08303_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HD01_VD02", "HD01_VD03", "HD01_VD04", "HD01_VD05", "HD01_VD06", "HD01_VD07", "HD01_VD08", "HD01_VD09", "HD01_VD10", "HD01_VD11","HD01_VD12", "HD01_VD13") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "I_T_5" = "HD01_VD02", 
    "I_T_59" = "HD01_VD03", 
    "I_T_1014" = "HD01_VD04", 
    "I_T_1519" = "HD01_VD05",
    "I_T_2024" = "HD01_VD06",
    "I_T_2529" = "HD01_VD07",
    "I_T_3034" = "HD01_VD08",
    "I_T_3539" = "HD01_VD09",
    "I_T_4044" = "HD01_VD10",
    "I_T_4559" = "HD01_VD11",
    "I_T_6089" = "HD01_VD12",
    "I_T_90" = "HD01_VD13"
  )

demographic_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/ACS_17_5YR_DP05/ACS_17_5YR_DP05.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HC01_VC03", "HC01_VC83", "HC03_VC83", "HC01_VC84", "HC03_VC84", "HC01_VC85", "HC03_VC85", "HC01_VC86", "HC03_VC86", "HC01_VC87", "HC03_VC87","HC01_VC88", "HC03_VC88", "HC01_VC93", "HC03_VC93") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "I_T_pop" = "HC01_VC03",
    "I_T_WH" = "HC01_VC83", 
    "I_P_WH" = "HC03_VC83", 
    "I_T_AA" = "HC01_VC84", 
    "I_P_AA" = "HC03_VC84",
    "I_T_AI" = "HC01_VC85",
    "I_P_AI" = "HC03_VC85",
    "I_T_AS" = "HC01_VC86",
    "I_P_AS" = "HC03_VC86",
    "I_T_PI" = "HC01_VC87",
    "I_P_PI" = "HC03_VC87",
    "I_T_OT" = "HC01_VC88",
    "I_P_OT" = "HC03_VC88",
    "I_T_HL" = "HC01_VC93",
    "I_P_HL" = "HC03_VC93"
  )

income_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/ACS_17_5YR_S1901_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HC01_EST_VC02", "HC01_EST_VC03", "HC01_EST_VC04", "HC01_EST_VC05", "HC01_EST_VC06", "HC01_EST_VC07", "HC01_EST_VC08", "HC01_EST_VC09", "HC01_EST_VC10", "HC01_EST_VC11") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "HH_T_10k" = "HC01_EST_VC02", 
    "HH_T_1014k" = "HC01_EST_VC03", 
    "HH_T_1524k" = "HC01_EST_VC04", 
    "HH_T_2534k" = "HC01_EST_VC05",
    "HH_T_3549k" = "HC01_EST_VC06",
    "HH_T_5074k" = "HC01_EST_VC07",
    "HH_T_7599k" = "HC01_EST_VC08",
    "HH_T_100k" = "HC01_EST_VC09",
    "HH_T_150k" = "HC01_EST_VC10",
    "HH_T_200k" = "HC01_EST_VC11"
  ) %>%
  mutate(
    "HH_T_10k" = ifelse(is.na(HH_T_10k), 0, HH_T_10k), 
    "HH_T_1014k" = ifelse(is.na(HH_T_1014k), 0, HH_T_1014k), 
    "HH_T_1524k" = ifelse(is.na(HH_T_1524k), 0, HH_T_1524k), 
    "HH_T_2534k" = ifelse(is.na(HH_T_2534k), 0, HH_T_2534k),
    "HH_T_3549k" = ifelse(is.na(HH_T_3549k), 0, HH_T_3549k),
    "HH_T_5074k" = ifelse(is.na(HH_T_5074k), 0, HH_T_5074k),
    "HH_T_7599k" = ifelse(is.na(HH_T_7599k), 0, HH_T_7599k),
    "HH_T_100k" = ifelse(is.na(HH_T_100k), 0, HH_T_100k),
    "HH_T_150k" = ifelse(is.na(HH_T_150k), 0, HH_T_150k),
    "HH_T_200k" = ifelse(is.na(HH_T_200k), 0, HH_T_200k)
  )

edu_data <- read_csv("/Users/tlim/Desktop/acs_2017_DC/ACS_17_5YR_S1501/ACS_17_5YR_S1501_with_ann.csv", na = c("-", "**")) %>%
  slice(-1) %>%
  type_convert() %>%
  select("GEO.id", "GEO.id2", "GEO.display-label", "HC01_EST_VC09", "HC01_EST_VC10", "HC02_EST_VC17", "HC02_EST_VC18") %>%
  rename(
    "Geo_id" = "GEO.id", 
    "Geo_id2" = "GEO.id2",
    "Geo_display_label"= "GEO.display-label",
    "I_T_uHS" = "HC01_EST_VC09",
    "I_T_912" = "HC01_EST_VC10",
    "I_P_HS" = "HC02_EST_VC17", 
    "I_P_BA" = "HC02_EST_VC18"
  ) %>%
  mutate(
    "I_T_nHS" = I_T_uHS + I_T_912
  )




write_csv(SNAP_data, "/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files/SNAP_data.csv")
write_csv(poverty_data, "/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files/poverty_data.csv")
write_csv(unemployment_data, "/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files/unemployment_data.csv")
write_csv(eng_speaking_data, "/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files/lang_data.csv")
write_csv(demographic_data, "/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files/demographic_data.csv")
write_csv(commute_data, "/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files/commute_data.csv")
write_csv(income_data, "/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files/income_data.csv")
write_csv(edu_data, "/Users/tlim/Desktop/Scooter_RMP_Project/Modified_ACS_files/edu_attain_data.csv")


battery <-battery %>% filter(!is.na("battery_level") & company != "Bird")
