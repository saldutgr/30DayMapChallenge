
#data--------------------
#create polygon from Manhattan bbox for filtering
man_poly <- getbb("Manhattan, NYC", format_out = "polygon")
#retrieve restaurant location data
man_rest <- opq("Manhattan, NYC") %>%
  add_osm_feature(key = 'amenity', value = 'restaurant') %>%
  osmdata_sf() %>%
  trim_osmdata(man_poly[1:7])

#plot-------------------------------
font_add_google("PT Sans Caption", "ptcap")
showtext_auto()

map <- ggplot() +
  geom_sf(data = man_rest$osm_points,
          alpha = .4,
          size = .3, 
          show.legend = "point") +
  ggthemes::theme_map()
#add captions
map +
  labs(
    title = "Restaurants of Manhattan",
    caption="Source:OSM Data") +
  theme(
    text = element_text(family = "ptcap"),
    plot.title = element_text(size=20)
  )

#save plot
ggsave(here::here("R", "30dayMaps", "1-points.png"), dpi = 320, height = 10, width = 5.2)
