library(rstan)

d <- read.csv(file='ch.10/input/data-usagitokame.txt')
data <- list(N=2, G=nrow(d), LW=d)
fit <- stan(file='ch.10/model/model10-3.stan', data=data, pars=c('b'), seed=1234)
