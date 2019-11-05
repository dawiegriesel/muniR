## code to prepare `sf_district` dataset goes here

sf_district <- sf::read_sf("C:/Users/DawieG/Downloads/2016-Boundaries-District") 

dplyr::rename(sf_district["DISTRICT"], "municipality.demarcation_code" = "DISTRICT") %>% 
  leaflet::leaflet() %>% 
  leaflet::addTiles() %>%
  leaflet::addPolygons(color = "white") %>%
  leaflet::addLabelOnlyMarkers(1:52)

usethis::use_data(sf_district)
