# Plots land cover probability density function for probe run 01

source('./source/libraries.R')
source('./source/graphics.R')
source('./experiments/01_land_cover_run_01/auxiliary.R')

load(paste0(experiment_path, 'land_est_run_01.Rdata')) #produced by 02_land_estimation_run_01

g1 <- ggplot(land_estimate, aes(x = probability, y = land_cover)) +
  geom_point(col = colset_sun_sky[2]) +
  geom_line(col = colset_sun_sky[2]) +
  labs(subtitle = paste0(nrow(land_estimate), '-points approximation'),
       x = 'Land cover',
       y = 'Probability') +
  theme_bw()

ggsave(filename = paste0(experiment_path, 'land_est_plot_run_01.pdf'), 
       plot = g1, width = 7, height = 5)
