library(rstan)

d <- read.csv('ch.9/input/data-mvn.txt')
data <- list(N=nrow(d), D=2, Y=d)
fit <- stan(file='ch.9/model/model9-2.stan', data=data, seed=1234)
fit_b <- stan(file='ch.9/model/model9-2b.stan', data=data, seed=1234)
