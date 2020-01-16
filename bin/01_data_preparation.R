# Data pre-processing.

source('./source/libraries.R')

load('./data/probe_run_01.Rdata')

probe_run_01[value == -999, value := NA]
probe_run_01[, value := factor(value, labels = c('O', 'L'))] # O corresponds to ocean and L to land

save(probe_run_01, file = './data/probe_run_01.Rdata')
