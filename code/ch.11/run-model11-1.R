library(rstan)

d <- read.csv(file='ch.11/input/data-coin.txt')
data <- list(N=nrow(d), Y=d$Y)
fit <- stan(file='ch.11/model/model11-1.stan', data=data, seed=1234)
