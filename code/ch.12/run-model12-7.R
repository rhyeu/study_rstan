library(rstan)
rstan_options(auto_write=TRUE)
options(mc.cores=parallel::detectCores())

d <- read.csv('.../ch.12/input/data-changepoint.txt')
T <- nrow(d)
data <- list(T=T, Y=d$Y)
stanmodel <- stan_model(file='.../ch.12/model/model12-7.stan')
fit <- sampling(stanmodel, data=data, pars=c('mu', 's_mu', 's_Y'), seed=1234)

save.image('.../ch.12/output/result-model12-7.RData')
