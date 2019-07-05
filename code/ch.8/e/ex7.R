library(rstan)

d <- read.csv('…/ch.8/input/d1.csv')
F2int <- data.frame(X=c(0, 1))
rownames(F2int) <- c('C', 'T')
pots <- unique(d$pot)
N_Pot <- length(pots)
Pot2int <- data.frame(X=1:N_Pot)
rownames(Pot2int) <- pots

N <- nrow(d)
data <- list(N=N, N_Pot=N_Pot, F=F2int[d$f,], N2Pot=Pot2int[d$pot,], Y=d$y)
fit <- stan(file='…/ch.8/e/ex7.stan', data=data, seed=1234)
