#Estimation of the posterior probabilty for binomial likelihood - grid approximation

bayes_est_binom <- function(successes, total_attempts, p_grid, prior_p){
  likelihood <- dbinom(successes, size = total_attempts, prob = prob_grid)
  unstd_posterior <- likelihood * prior_p
  posterior <- unstd_posterior / sum(unstd_posterior) 
  return(posterior)
} 
