library(rstan)

d <- read.csv('…/ch.8/input/data-salary-3.txt')
N <- nrow(d)
K <- 30
G <- 3
K2G <- unique(d[ , c('KID','GID')])$GID
data <- list(N=N, G=G, K=K, X=d$X, Y=d$Y, KID=d$KID, K2G=K2G)
fit <- stan(file='…/ch.9/e/ex4.stan', data=data, seed=1234)
