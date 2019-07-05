library(rstan)

d <- read.csv(file='…/ch.5/input/data-attendance-3.txt')
d_conv <- data.frame(X=c(1, 2, 3))
rownames(d_conv) <- c('A', 'B', 'C')
data <- list(I=nrow(d), A=d$A, Score=d$Score/200, WID=d_conv[d$Weather, ], Y=d$Y)

fit <- stan(file='…/ch.5/e/ex4.stan', data=data, pars=c('b', 'bw2', 'bw3'), seed=1234)
