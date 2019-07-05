library(ggplot2)
source('…/common.R')

load('ch.7/output/result-model7-9.RData')
ms <- rstan::extract(fit)

d_est <- data.frame.quantile.mcmc(x=X_new, y_mcmc=ms$y_new)
p <- ggplot.5quantile(data=d_est)
p <- p + geom_point(data=d, aes(x=X, y=Y), shape=1, size=3)
p <- p + labs(x='X', y='Y')
p <- p + coord_cartesian(xlim=c(-0.2, 11.2), ylim=c(-25, 75))
ggsave(file='ch.7/output/fig7-12-right.png', plot=p, dpi=300, w=4, h=3)
