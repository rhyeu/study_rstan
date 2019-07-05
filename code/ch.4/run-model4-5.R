library(rstan)

d <- read.csv(file='ch.4/input/data-salary.txt')
data <- list(N=nrow(d), X=d$X, Y=d$Y)
fit <- stan(file='ch.4/model/model4-5.stan', data=data, seed=1234)

save.image(file='ch.4/output/result-model4-5.RData')
