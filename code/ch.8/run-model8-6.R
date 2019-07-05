library(rstan)

d <- read.csv('ch.8/input/data-salary-3.txt')
N <- nrow(d)
K <- 30
G <- 3
K2G <- unique(d[ , c('KID','GID')])$GID
data6 <- list(N=N, G=G, K=K, X=d$X, Y=d$Y, KID=d$KID, GID=d$GID, K2G=K2G)
fit6 <- stan(file='ch.8/model/model8-6.stan', data=data6, seed=123)

save.image('ch.8/output/result-model8-6.RData')
