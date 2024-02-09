library(ggPlantmap)
library(rayshader)
library(tidyverse)
library(viridis)


data <- ggPm.Sl.root.crosssection %>%
  select(1,2) %>%
  unique() %>%
  mutate(value=ifelse(ROI.name=="Exodermis",ROI.id+1,NA))
data

plot <- ggPlantmap.merge(ggPm.Sl.root.crosssection,data,c("ROI.name","ROI.id")) %>%
  ggplot() +
  geom_polygon(aes(x,y,group=ROI.id,fill=value),show.legend=F,colour="#6F6F6F") +
  theme_bw() +
  theme(axis.text = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.border = element_blank()) +
  coord_fixed() +
  scale_fill_viridis(option="H",na.value="white")
plot


plot_gg(plot,multicore = TRUE,shadow_intensity = 0.5,shadow_darkness = 0.5, raytrace = T,
        width=5,
        sunangle = 90,
        height=5,
        scale=100)
render_snapshot("test3.png", clear = TRUE)



