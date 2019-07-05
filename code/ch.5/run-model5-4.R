library(rstan)

d <- read.csv(file='ch.5/input/data-attendance-2.txt')
data <- list(N=nrow(d), A=d$A, Score=d$Score/200, M=d$M, Y=d$Y)
fit <- stan(file='ch.5/model/model5-4.stan', data=data, seed=1234)

save.image('ch.5/output/result-model5-4.RData')

