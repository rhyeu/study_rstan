library(rstan)

d <- read.csv('.../ch.12/input/data-ss2.txt')
T <- nrow(d)
data <- list(T=T, Y=d$Y)
stanmodel <- stan_model(file='model/model12-6.stan')
fit <- sampling(stanmodel, data=data, iter=4000, thin=5, seed=1234)

save.image('.../ch.12/output/result-model12-6.RData')

stanmodel_b <- stan_model(file='.../ch.12/model/model12-6b.stan')
fit_b <- sampling(stanmodel_b, data=data,
  pars=c('mu', 'season', 's_mu', 's_season', 's_Y', 'y_mean'), iter=4000, thin=5, seed=1234)
