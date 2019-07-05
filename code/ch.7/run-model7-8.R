library(rstan)

d <- read.csv(file='ch.7/input/data-outlier.txt')
X_new <- seq(from=0, to=11, length=100)
data <- list(N=nrow(d), X=d$X, Y=d$Y, N_new=length(X_new), X_new=X_new)
fit <- stan(file='ch.7/model/model7-8.stan', data=data, seed=1234)

save.image('ch.7/output/result-model7-8.RData')
