##### ORGIN POINTS: income#####
#ALL scooters
library(tidyverse)

points_geog <- read_csv("/Users/tlim/Desktop/points_with_geog_info.csv")

income_scooter_df <- points_geog %>%
  filter(!is.na(poverty_Q_min) & is_trip) %>%
  group_by(poverty_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    pov_Q = as.character(poverty_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = pov_Q)) +
  geom_point(size = 3) +
  geom_path(mapping = aes(group = pov_Q), size = 1) +
  facet_wrap("day_O", nrow = 3, labeller = labeller(day_O = labels)) + 
  scale_color_discrete() +
  theme(text = element_text(size=18, family = "serif"))

labels = c(`17` = "Wednesday 7/17", `18` = "Thursday 7/18", `19` = "Friday 7/19", `20` = "Saturday 7/20", `21` = "Sunday 7/21", `22` = "Monday 7/22", `23` = "Tuesday 7/23", `24` = "Wednesday 7/24")

#just relocation trips
income_scooter_df <- points_geog %>%
  filter(!is.na(poverty_Q_min) & (is_relocation | is_recharge)) %>%
  group_by(poverty_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    poverty_Q = as.character(poverty_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = poverty_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = poverty_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()

#just recharge trips
income_scooter_df <- points_geog %>%
  filter(!is.na(poverty_Q_min) & is_recharge) %>%
  group_by(poverty_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    poverty_Q = as.character(poverty_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = poverty_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = poverty_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()

##### ORGIN POINTS: race#####
#ALL scooters
income_scooter_df <- points_geog %>%
  filter(!is.na(AA_Q_min) & is_trip) %>%
  group_by(AA_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    AA_Q = as.character(AA_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = AA_Q)) +
  geom_point(size = 3) +
  geom_path(mapping = aes(group = AA_Q), size = 1) +
  facet_wrap("day_O", nrow = 3, labeller = labeller(day_O = labels)) + 
  scale_color_discrete() +
  theme(text = element_text(size=18, family = "serif"))

labels = c(`17` = "Wednesday 7/17", `18` = "Thursday 7/18", `19` = "Friday 7/19", `20` = "Saturday 7/20", `21` = "Sunday 7/21", `22` = "Monday 7/22", `23` = "Tuesday 7/23", `24` = "Wednesday 7/24")

#just relocation trips
income_scooter_df <- points_geog %>%
  filter(!is.na(AA_Q_min) & is_relocation) %>%
  group_by(AA_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    AA_Q = as.character(AA_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = AA_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = AA_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete() +
  theme(text = element_text(size=20))

#just recharge trips
income_scooter_df <- points_geog %>%
  filter(!is.na(AA_Q_min) & is_recharge) %>%
  group_by(AA_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    AA_Q = as.character(AA_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = AA_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = AA_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()

##### DEST POINTS: income#####
#ALL scooters
library(tidyverse)

points_geog <- read_csv("/Users/tlim/Desktop/DEST_points_with_geog_info.csv")

income_scooter_df <- points_geog %>%
  filter(!is.na(poverty_Q_min)) %>%
  group_by(poverty_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    poverty_Q = as.character(poverty_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = poverty_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = poverty_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()

#just relocation trips
income_scooter_df <- points_geog %>%
  filter(!is.na(poverty_Q_min) & (is_relocation | is_recharge)) %>%
  group_by(poverty_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    poverty_Q = as.character(poverty_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = poverty_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = poverty_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()

#just recharge trips
income_scooter_df <- points_geog %>%
  filter(!is.na(poverty_Q_min) & is_recharge) %>%
  group_by(poverty_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    poverty_Q = as.character(poverty_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = poverty_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = poverty_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()

##### DEST POINTS: race#####
#ALL scooters
income_scooter_df <- points_geog %>%
  filter(!is.na(AA_Q_min) & is_trip) %>%
  group_by(AA_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    AA_Q = as.character(AA_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = AA_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = AA_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()

#just relocation trips
income_scooter_df <- points_geog %>%
  filter(!is.na(AA_Q_min) & is_relocation) %>%
  group_by(AA_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    AA_Q = as.character(AA_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = AA_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = AA_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()

# reloc + recharge trips
income_scooter_df <- points_geog %>%
  filter(!is.na(AA_Q_min) & is_recharge) %>%
  group_by(AA_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    AA_Q = as.character(AA_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = AA_Q)) +
  geom_point() +
  geom_path(mapping = aes(group = AA_Q)) +
  facet_wrap("day_O", nrow = 2) + 
  scale_color_discrete()


#Presentation plots
income_scooter_df <- points_geog %>%
  filter(!is.na(poverty_Q_min) & is_trip) %>%
  group_by(poverty_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    pov_Q = as.character(poverty_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = pov_Q)) +
  geom_point(size = 15) +
  geom_path(mapping = aes(group = pov_Q), size = 6) +
  facet_wrap("day_O", nrow = 2, labeller = labeller(day_O = labels)) + 
  scale_color_discrete() +
  theme(text = element_text(size=80, family = "sans", face = "bold"))

income_scooter_df <- points_geog %>%
  filter(!is.na(AA_Q_min) & is_trip) %>%
  group_by(AA_Q_min, day_O, hour_O) %>%
  mutate(
    count = n()
  ) %>%
  ungroup() %>% 
  mutate(
    AA_Q = as.character(AA_Q_min)
  ) %>%
  distinct(count, .keep_all = TRUE) %>%
  arrange(day_O, hour_O)

ggplot(income_scooter_df, mapping = aes(x = hour_O, y = count, color = AA_Q)) +
  geom_point(size = 15) +
  geom_path(mapping = aes(group = AA_Q), size = 7) +
  facet_wrap("day_O", nrow = 2, labeller = labeller(day_O = labels)) + 
  scale_color_discrete() +
  theme(text = element_text(size=80, family = "sans", face = "bold"))

