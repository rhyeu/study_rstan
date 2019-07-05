library(ggplot2)

set.seed(123)
N <- 10
X <- 1:10
Y <- rnorm(N, mean=12+7.1*X, sd=0.8)
d <- data.frame(X=X, Y=round(Y,1))
d_true <- data.frame(X=X, Y=round(12+7.1*X, 1))

p <- ggplot()
p <- p + theme_bw(base_size=18)
p <- p + geom_line(data=d_true, aes(x=X, y=Y), size=3, alpha=0.4)
p <- p + geom_line(data=d, aes(x=X, y=Y), size=1)
p <- p + geom_point(data=d, aes(x=X, y=Y), size=3)
p <- p + scale_x_continuous(breaks=1:10)
p <- p + scale_y_continuous(breaks=seq(from=20, to=80, by=20))
p <- p + labs(x='Time (Minute)', y='Y')
ggsave(file='ch.12/output/fig12-1-left.png', plot=p, dpi=300, width=4, height=3)
