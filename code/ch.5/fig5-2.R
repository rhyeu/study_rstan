library(rstan)
library(ggplot2)
library(reshape2)

d <- read.csv(file='ch.5/input/data-attendance-1.txt')
X_new <- 50:200/200
data <- list(N=nrow(d), A=d$A, Score=d$Score/200, Y=d$Y, N_new=length(X_new), Score_new=X_new)
fit <- stan(file='ch.5/model/model1b.stan', data=data, seed=1234)

la <- rstan::extract(fit)

qua0 <- apply(la$y_pred0, 2, quantile, prob=c(0.025, 0.1, 0.5, 0.9, 0.975))
d_qua0 <- data.frame(X_new*200, t(qua0))
colnames(d_qua0) <- c('X', 'p2.5', 'p10', 'p50', 'p90', 'p97.5')
qua1 <- apply(la$y_pred1, 2, quantile, prob=c(0.025, 0.1, 0.5, 0.9, 0.975))
d_qua1 <- data.frame(X_new*200, t(qua1))
colnames(d_qua1) <- c('X', 'p2.5', 'p10', 'p50', 'p90', 'p97.5')
d$A <- factor(d$A)
p <- ggplot()
p <- p + theme_bw(base_size=18)
# p <- p + theme(legend.position='none')
# p <- p + geom_ribbon(data=d_qua0, aes(x=X, y=p50, ymin=p2.5, ymax=p97.5), fill='black', alpha=1/6)
p <- p + geom_ribbon(data=d_qua0, aes(x=X, y=p50, ymin=p10, ymax=p90), fill='black', alpha=1/5)
p <- p + geom_line(data=d_qua0, aes(x=X, y=p50), size=1)
# p <- p + geom_ribbon(data=d_qua1, aes(x=X, y=p50, ymin=p2.5, ymax=p97.5), fill='black', alpha=1/6)
p <- p + geom_ribbon(data=d_qua1, aes(x=X, y=p50, ymin=p10, ymax=p90), fill='black', alpha=1/5)
p <- p + geom_line(data=d_qua1, aes(x=X, y=p50), size=1)
p <- p + geom_point(data=d, aes(x=Score, y=Y, shape=A, fill=A), size=3)
# p <- p + scale_y_continuous(breaks=seq(from=, to=, by=))
# p <- p + coord_cartesian(xlim=c(48, 200))
p <- p + labs(x='Score', y='Y')
p <- p + scale_shape_manual(values=c(21, 24))
p <- p + scale_fill_manual(values=alpha(c('white', 'grey40'), 0.5))
ggsave(file='ch.5/output/fig5-2.png', plot=p, dpi=300, width=4, height=3)
