library(rstan)

d <- read.csv('ch.8/input/data-salary-2.txt')
N <- nrow(d)
K <- 4
data <- list(N=N, K=K, X=d$X, Y=d$Y, KID=d$KID)
fit4 <- stan(file='ch.8/model/model8-4.stan', data=data, seed=1234)
fit4w <- stan(file='ch.8/model/model8-4w.stan', data=data, seed=1234)

ms4 <- extract(fit4)
d <- data.frame(X=ms4$s_a)
bw <- 20
p <- ggplot(data=d, aes(x=X))
p <- p + theme_bw(base_size=18)
p <- p + geom_histogram(aes(y=..density..), binwidth=bw, color='black', fill='white')
p <- p + geom_density(color=NA, fill='black', alpha=0.3)
p <- p + labs(x=expression(sigma[a]), y='probability density')
p <- p + scale_x_continuous(breaks=seq(0,600,200), limit=c(-20,650))
p <- p + scale_y_continuous(breaks=seq(0,0.02,0.004), limit=c(0,0.014))
ggsave(file='ch.10/output/fig10-4-left.png', plot=p, dpi=300, width=4, height=3)


ms4w <- extract(fit4w)
d <- data.frame(X=ms4w$s_a)
bw <- 20
p <- ggplot(data=d, aes(x=X))
p <- p + theme_bw(base_size=18)
p <- p + geom_histogram(aes(y=..density..), binwidth=bw, color='black', fill='white')
p <- p + geom_density(color=NA, fill='black', alpha=0.3)
p <- p + labs(x=expression(sigma[a]), y='probability density')
p <- p + scale_x_continuous(breaks=seq(0,600,200), limit=c(-20,650))
p <- p + scale_y_continuous(breaks=seq(0,0.02,0.004), limit=c(0,0.014))
ggsave(file='ch.10/output/fig10-4-right.png', plot=p, dpi=300, width=4, height=3)
