library(rstan)

d <- read.csv('ch.8/input/data-salary-2.txt')
N <- nrow(d)
K <- 4
data <- list(N=N, K=K, X=d$X, Y=d$Y, KID=d$KID)
fit6 <- stan(file='ch.10/model/model10-6.stan', data=data, seed=1234)

save.image('ch.10/output/result-model10-6.RData')

