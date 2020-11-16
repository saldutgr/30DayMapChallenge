#setup
library(tidyverse)
library(sf)
library(ggmap)
library(osmdata)
library(cowplot)
library(ggdark)

#tokyo--------------
#load and clean tokyo KML file
tokyo_sf <- st_read("~/R/30dayMaps/lines_day2/tokyo.kml")
tokyo_sf <- tokyo_sf[1:15,]

#create bounding box for Plot area
tokyo_bbox <- st_bbox(tokyo_sf)

#retrieve OSM data

#motorways
tok_mway <- opq(tokyo_bbox) %>%
  add_osm_feature(key = "highway", value = "motorway") %>%
  osmdata_sf() 
#trunks
tok_trnk <- opq(tokyo_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "trunk") %>%
  osmdata_sf() 
#tertiary
tok_tert <- opq(tokyo_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "tertiary") %>%
  osmdata_sf() 
#secondary
tok_sec <- opq(tokyo_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "secondary") %>%
  osmdata_sf() 

#join, clean and resize
tok <- c(tok_mway, tok_trnk, tok_tert, tok_sec)
tok <- tok$osm_lines %>%
  select(osm_id, highway, geometry)
rm(tok_mway, tok_trnk, tok_tert, tok_sec, tok_list)

#nyc------------------
#nycsite.com
nyc_mara <- st_read("http://www.nyc-site.com/rubriche/archives/nyc_marathon.kmz")
#retrieve bbox from marathon file
nyc_bbox <- st_bbox(nyc_mara)

#retrieve OSM data

#motorways
nyc_mway <- opq(nyc_bbox) %>%
  add_osm_feature(key = "highway", value = "motorway") %>%
  osmdata_sf() 
#trunks
nyc_trnk <- opq(nyc_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "trunk") %>%
  osmdata_sf() 
#tertiary
nyc_tert <- opq(nyc_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "tertiary") %>%
  osmdata_sf() 
#secondary
nyc_sec <- opq(nyc_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "secondary") %>%
  osmdata_sf() 

#join, clean and resize
nyc_list <- c(nyc_mway, nyc_trnk, nyc_tert, nyc_sec)
nyc <- nyc_list$osm_lines %>%
  select(osm_id, highway, geometry)
rm(nyc_mway, nyc_trnk, nyc_tert, nyc_sec, nyc_list)

#boston------------------
#espn
boston_mara <- st_read("~/R/30dayMaps/lines_day2/marathon_v26.kml")
#retrieve bbox from marathon file
boston_bbox <- st_bbox(boston_mara)

#retrieve OSM data

#motorways
boston_mway <- opq(boston_bbox) %>%
  add_osm_feature(key = "highway", value = "motorway") %>%
  osmdata_sf() 
#trunks
boston_trnk <- opq(boston_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "trunk") %>%
  osmdata_sf() 
#tertiary
boston_tert <- opq(boston_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "tertiary") %>%
  osmdata_sf() 
#secondary
boston_sec <- opq(boston_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "secondary") %>%
  osmdata_sf() 

#join, clean and resize
boston_list <- c(boston_mway, boston_trnk, boston_tert, boston_sec)
boston <- boston_list$osm_lines %>%
  select(osm_id, highway, geometry)
rm(boston_mway, boston_trnk, boston_tert, boston_sec, boston_list)

#london------------------
#goodrunningguide.co.uk
london_mara <- st_read("~/R/30dayMaps/lines_day2/london.kml")
#retrieve bbox from marathon file
london_bbox <- st_bbox(london_mara)

#retrieve OSM data

#motorways
london_mway <- opq(london_bbox) %>%
  add_osm_feature(key = "highway", value = "motorway") %>%
  osmdata_sf() 
#trunks
london_trnk <- opq(london_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "trunk") %>%
  osmdata_sf() 
#tertiary
london_tert <- opq(london_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "tertiary") %>%
  osmdata_sf() 
#secondary
london_sec <- opq(london_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "residential") %>%
  osmdata_sf() 

#join, clean and resize
london_list <- c(london_mway, london_trnk, london_tert, london_sec)
london <- london_list$osm_lines %>%
  select(osm_id, highway, geometry)
rm(london_mway, london_trnk, london_tert, london_sec, london_list)


#Berlin------------------
#goodrunningguide.co.uk
berlin_mara <- st_read("~/R/30dayMaps/lines_day2/berlin.kml")
#retrieve bbox from marathon file
berlin_bbox <- st_bbox(berlin_mara)

#retrieve OSM data

#motorways
berlin_mway <- opq(berlin_bbox) %>%
  add_osm_feature(key = "highway", value = "motorway") %>%
  osmdata_sf() 
#trunks
berlin_trnk <- opq(berlin_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "trunk") %>%
  osmdata_sf() 
#tertiary
berlin_tert <- opq(berlin_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "tertiary") %>%
  osmdata_sf() 
#secondary
berlin_res <- opq(berlin_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "residential") %>%
  osmdata_sf() 

#join, clean and resize
berlin_list <- c(berlin_mway, berlin_trnk, berlin_tert, berlin_res)
berlin <- berlin_list$osm_lines %>%
  select(osm_id, highway, geometry)
rm(berlin_mway, berlin_trnk, berlin_tert, berlin_res, berlin_list)
#chicago--------------

#spothero.com
#load and clean tokyo KML file
chicago_mara <- st_read("~/R/30dayMaps/lines_day2/chicago.kml")

#create bounding box for Plot area
chicago_bbox <- st_bbox(chicago_mara)

#retrieve OSM data

#motorways
chicago_mway <- opq(chicago_bbox) %>%
  add_osm_feature(key = "highway", value = "motorway") %>%
  osmdata_sf() 
#trunks
chicago_trnk <- opq(chicago_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "trunk") %>%
  osmdata_sf() 
#tertiary
chicago_tert <- opq(chicago_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "tertiary") %>%
  osmdata_sf() 
#secondary
chicago_res <- opq(chicago_bbox) %>%
  add_osm_feature(key = "highway",
                  value = "residential") %>%
  osmdata_sf() 

#join, clean and resize
chicago <- c(chicago_mway, chicago_trnk, chicago_tert, chicago_res)
chicago <- chicago$osm_lines %>%
  select(osm_id, highway, geometry)
rm(chicago_mway, chicago_trnk, chicago_tert, chicago_res)



#Plots--------------------
theme_set(theme_void())

alphax = .35

#tokyo plot
tok_plot <- ggplot(tok) +
  geom_sf(alpha = alphax) +
  geom_sf(data = tokyo_sf,
          col = "#ee9d3e",
          size = 1) +
  ylim(35.62, 35.72) 

nyc_plot <- ggplot(nyc) +
  geom_sf(alpha = alphax) +
  geom_sf(data = nyc_mara,
          col = "#ee9d3e",
          size = 1) 

boston_plot <- ggplot(boston) +
  geom_sf(alpha = alphax) +
  geom_sf(data = boston_mara,
          col = "#ee9d3e",
          size = 1) 

london_plot <- ggplot(london) +
  geom_sf(alpha = alphax) +
  geom_sf(data = london_mara,
          col = "#ee9d3e",
          size = 1) 

chicago_plot <- ggplot(chicago) +
  geom_sf(alpha = alphax) +
  geom_sf(data = chicago_mara,
          col = "#ee9d3e",
          size = 1) +
  xlim(-87.69, -87.62) +
  ylim(41.83, 41.95)


boston_plot <- ggplot(boston) +
  geom_sf(alpha = alphax) +
  geom_sf(data = boston_mara,
          col = "#ee9d3e",
          size = 1)


berlin_plot <- ggplot(berlin) +
  geom_sf(alpha = alphax) +
  geom_sf(data = berlin_mara,
          col = "#ee9d3e",
          size = 1) 

maps <- plot_grid(chicago_plot, tok_plot, boston_plot,
          london_plot, berlin_plot, nyc_plot,
          labels = c("Chicago", "Tokyo", "Boston",
                     "London", "Berlin", "New York City"),
          label_size = 12)

title <- ggdraw()+ 
  draw_label("World Major Marathons",
             fontface = 'bold',
             hjust = .5) +
  draw_label("Data: OSM, nycsite.com, goodrunningguide.co.uk, ESPN, spothero.com",
             y = -9.8,
             x = .1,
             size = 6, 
             lineheight = 1,
             fontface = 'italic') +
  theme(plot.margin = margin(0, 0 ,0, 7))
plot_grid(title, maps, ncol = 1,
          rel_heights = c(.1, 1))

ggsave("day2_lines", device = "png", path = "~/R/30dayMaps/lines_day2", dpi = 320, height = 7, width = 13)
