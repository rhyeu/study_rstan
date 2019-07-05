library(rstan)

d <- read.csv(file='ch.7/input/data-aircon.txt')
N_new <- 60
X_new <- seq(from=-3, to=32, length=N_new)
data <- list(N=nrow(d), X=d$X, Y=d$Y, N_new=N_new, X_new=X_new)
fit <- stan(file='ch.7/model/model7-3.stan', data=data, seed=1234)

save.image('ch.7/output/result-model7-3.RData')
