# Plots land cover probability density functions for different outcomes of missing
# value probe run 01

source('./source/libraries.R')
source('./source/graphics.R')
source('./experiments/02_na_effect_run_01/main.R')

load(paste0(experiment_path, 'land_est_na_effect.Rdata')) #produced by 01_land_estimation_na_effect
load('./experiments/01_land_cover_run_01/land_est_run_01.Rdata') #produced by 02_land_estimation_run_01

land_estimate$experiment <- factor('9 probes')
land_estimate_na_land$experiment <- factor('10 probes - Land')
land_estimate_na_ocean$experiment <- factor('10 probes - Ocean')
to_plot <- rbind(land_estimate, land_estimate_na_land, land_estimate_na_ocean)

g1 <- ggplot(to_plot, aes(x = probability, y = land_cover, col = experiment)) +
  geom_point() +
  geom_line() +
  scale_color_manual(values = colset_sun_sky[c(4, 1, 2)]) +
  labs(subtitle = paste0(nrow(land_estimate_na_land), '-points approximation'),
       x = 'Land cover',
       y = 'Probability') +
  theme_bw()
ggsave(filename = paste0(experiment_path, 'land_est_plot_na_effect.pdf'), 
       plot = g1, width = 7, height = 5)
