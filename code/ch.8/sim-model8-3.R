set.seed(123)
N <- 40
K <- 4
N_k <- c(15, 12, 10, 3)
a0 <- 3500
b0 <- 120
s_a <- 600
s_b <- 40
s_Y <- 250
X <- sample(x=0:35, size=N, replace=TRUE)
KID <- rep(1:4, times=N_k)

a <- rnorm(K, mean=0, sd=s_a) + a0
b <- rnorm(K, mean=0, sd=s_b) + b0
d <- data.frame(X=X, KID=KID, a=a[KID], b=b[KID])
d <- transform(d, Y_sim=rnorm(N, mean=a + b*X, sd=s_Y))
