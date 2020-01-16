# Statistical estimation of land cover for probe run 01

source('./source/libraries.R')
source('./source/functions.R')
source('./experiments/02_na_effect_run_01/main.R')

load('./data/probe_run_01.Rdata')

total_hits <- probe_run_01[, length(value)]
land_hits_na_land <- probe_run_01[value == 'L' | is.na(value), length(value)]
land_hits_na_ocean <- probe_run_01[value == 'L' & !is.na(value), length(value)]
prob_land <- 0.5
grid_length <- 20
prob_grid <- seq(from = 0, to = 1, length.out = grid_length)
prior_prob <- rep(1, grid_length)

dbinom(land_hits_na_land, size = total_hits, prob = prob_land)
dbinom(land_hits_na_ocean, size = total_hits, prob = prob_land)

land_cover_na_land <- bayes_est_binom(successes = land_hits_na_land,
                total_attempts = total_hits, 
                p_grid = prob_grid, 
                prior_p = prior_prob)

land_cover_na_ocean <- bayes_est_binom(successes = land_hits_na_ocean,
                total_attempts = total_hits, 
                p_grid = prob_grid, 
                prior_p = prior_prob)

land_estimate_na_land <- data.table(probability = prob_grid,
                            land_cover = land_cover_na_land)
land_estimate_na_ocean <- data.table(probability = prob_grid,
                            land_cover = land_cover_na_ocean)

save(land_estimate_na_land, 
     land_estimate_na_ocean, 
     file = paste0(experiment_path, 'land_est_na_effect.Rdata'))


