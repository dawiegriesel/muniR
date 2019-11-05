## code to prepare `sf_local` dataset goes here

sf_local <- sf::read_sf("C:/Users/DawieG/Downloads/2016-Boundaries-Local")

dplyr::rename(sf_local["CAT_B"], "municipality.demarcation_code" = "CAT_B") %>% 
  dplyr::left_join() %>%
  plotly::plot_ly() %>%
  plotly::add_choropleth()

munis[munis$municipality.demarcation_code == "EC101",]


usethis::use_data(sf_local)
