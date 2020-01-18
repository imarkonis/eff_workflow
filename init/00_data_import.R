#Import data from probes

source('./source/libraries.R')

probe_run_01 <- fread('./data/raw/probe_run_01', header = F, 
                      col.names = 'value')

save(probe_run_01, file = './data/probe_run_01.Rdata')
