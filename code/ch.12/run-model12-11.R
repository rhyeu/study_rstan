library(rstan)

Y <- read.csv('.../ch.12/input/data-kubo11a.txt')$Y
I <- length(Y)
d <- data.frame(X=1:I, Y=Y)
data <- list(I=I, Y=Y)
stanmodel <- stan_model(file='.../ch.12/model/model12-11.stan')
fit <- sampling(stanmodel, data=data, seed=1234)

save.image('.../ch.12/output/result-model12-11.RData')
