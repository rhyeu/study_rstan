library(rstan)

d <- read.csv(file='ch.11/input/data-poisson-binomial.txt')
data <- list(N=nrow(d), M_max=40, Y=d$Y)

stanmodel <- stan_model(file='ch.11/model/model11-2.stan')
fit <- sampling(stanmodel, data=data, seed=1234)

data_b <- list(N=nrow(d), Y=d$Y)
fit_b <- stan(file='ch.11/model/model11-2b.stan', data=data, seed=1234)
