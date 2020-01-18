# Statistical estimation of land cover for probe run 01

# Source and load----
source('./source/libraries.R')
source('./source/functions.R')
source('./experiments/01_land_cover_run_01/auxiliary.R')

load('./data/probe_run_01.Rdata')

# Variables----
total_hits <- probe_run_01[!is.na(value), length(value)]
land_hits <- probe_run_01[value == 'L', length(value)]
prob_land <- 0.5
grid_length <- 20
prob_grid <- seq(from = 0, to = 1, length.out = grid_length)
prior_prob <- rep(1, grid_length)

# Estimation----
dbinom(land_hits, size = total_hits, prob = prob_land)

land_cover <- bayes_est_binom(successes = land_hits,
                total_attempts = total_hits, 
                p_grid = prob_grid, 
                prior_p = prior_prob)

land_estimate <- data.table(probability = prob_grid,
                            land_cover = land_cover)

save(land_estimate, file = paste0(experiment_path, 'land_est_run_01.Rdata'))


