library(rstan)

d <- read.csv(file='…/ch.11/input/data-coin.txt')
data <- list(N=nrow(d), Y=d$Y)
fit_A <- stan(file='…/ch.11/e/ex3_A.stan', data=data, seed=1234)
fit_B <- stan(file='…/ch.11/e/ex3_B.stan', data=data, seed=1234)
