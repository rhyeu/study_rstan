library(rstan)

d <- read.csv('.../ch.12/input/data-map-temperature.txt')
d2 <- read.csv('.../ch.12/input/data-map-neighbor.txt')
N <- nrow(d)
data <- list(N=N, Y=d$Y, I=nrow(d2), From=d2$From, To=d2$To)

stanmodel <- stan_model(file='.../ch.12/model/model12-14.stan')
fit <- sampling(
  stanmodel, data=data, seed=1234,
  init=function() { list(r=d$Y, s_r=1, s_Y=0.1) }
)

save.image('.../ch.12/output/result-model12-14.RData')
