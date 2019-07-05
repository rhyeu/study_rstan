library(rstan)

d <- read.csv('…/ch.8/input/data7a.csv')
N <- nrow(d)
data <- list(N=N, Y=d$y)
fit <- stan(file='…/ch.8/e/ex6.stan', data=data, seed=1234)
