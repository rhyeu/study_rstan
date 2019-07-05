library(rstan)

d <- read.csv(file='D:/006966_wonderful2/02. 원고개발/실습/ch.5/데이터/data-attendance-2.txt')
data <- list(N=nrow(d), A=d$A, Score=d$Score/200, M=d$M)
fit <- stan(file='D:/006966_wonderful2/02. 원고개발/실습/ch.9/연습문제/ex2.stan', data=data, seed=1234)