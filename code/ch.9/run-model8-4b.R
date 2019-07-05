library(rstan)

d <- read.csv('ch.8/input/data-salary-2.txt')
N <- nrow(d)
K <- 4
data <- list(N=N, X=d$X, Y=d$Y, KID=d$KID)
fit <- stan(file='ch.9/model/model8-4b.stan', data=data, seed=1234)
