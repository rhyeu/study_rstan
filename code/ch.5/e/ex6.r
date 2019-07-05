library(rstan)

d <- read.csv(file='…/ch.5/input/data3a.csv')
d_conv <- data.frame(X=c(0, 1))
rownames(d_conv) <- c('C', 'T')
data <- list(N=nrow(d), Y=d$y, X=d$x, F=d_conv[d$f,])
fit <- stan(file='…/ch.5/e/ex6.stan', data=data, seed=1234)
