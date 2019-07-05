library(rstan)

d <- read.csv(file='ch.4/input/data-salary.txt')
X_new <- 23:60
data <- list(N=nrow(d), X=d$X, Y=d$Y, N_new=length(X_new), X_new=X_new)
fit <- stan(file='ch.7/model/model7-6.stan', data=data, seed=1234)
