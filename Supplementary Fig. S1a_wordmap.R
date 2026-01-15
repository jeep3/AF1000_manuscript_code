library(ggplot2)
library(maps)
world_map <- map_data("world")
points_df <- read.csv("D:\\Rdata\\sampling_points.csv", stringsAsFactors = FALSE)

p <- ggplot() +
  geom_polygon(
    data = world_map,
    aes(x = long, y = lat, group = group),
    fill = "grey90",
    color = "grey50",
    linewidth = 0.2
  ) +
  geom_point(
    data = points_df,
    aes(x = Longitude, y = Latitude, color = Group),
    size = 2,
    alpha = 0.85
  ) +
  coord_fixed(1.3) +
  scale_x_continuous(
    name = "Longitude",
    breaks = seq(-180, 180, by = 60),
    labels = function(x) paste0(x, "°")
  ) +
  scale_y_continuous(
    name = "Latitude",
    breaks = seq(-90, 90, by = 30),
    labels = function(y) paste0(y, "°")
  ) +
  scale_color_brewer(palette = "Set1", name = "Group") +
  theme_classic() +
  theme(
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.6),
    axis.title = element_text(size = 12),
    axis.text  = element_text(size = 10),
    legend.title = element_text(size = 11),
    legend.text  = element_text(size = 10)
  )

p
