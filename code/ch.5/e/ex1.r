# after run-model5-3.R

load('…/ch.5/output/result-model5-3.RData')

ms <- rstan::extract(fit)
noise <- t(-t(ms$mu) + d$Y)
