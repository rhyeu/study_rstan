library(rstan)

d <- read.csv('ch.8/input/data-salary-2.txt')
N <- nrow(d)
K <- 4
data <- list(N=N, X=d$X, Y=d$Y, KID=d$KID)
fit1 <- stan(file='ch.8/model/model8-1.stan', data=data, seed=1234)

save.image('ch.8/output/result-model8-1.RData')
