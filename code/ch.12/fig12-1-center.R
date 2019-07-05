library(ggplot2)

set.seed(1)
tp <- c(1, 2, 4, 8, 12, 24)
Time <- c(0:1200/50)
C <-  13.16
k <- 0.231
y <- C*(1-exp(-k*Time))
yp <- C*(1-exp(-k*tp))
df <- data.frame(X=Time, Y=y)
df2 <- data.frame(X=tp, Y=round(rnorm(length(yp), mean=yp, sd=0.5), 1))
# write.table(df2, file='ch.7/input/data-conc.txt', sep=',', quote=FALSE, row.names=FALSE)

p <- ggplot()
p <- p + theme_bw(base_size=18)
p <- p + geom_line(data=df, aes(x=Time, y=Y), size=3, alpha=0.4)
p <- p + geom_line(data=df2, aes(x=X, y=Y), size=2)
p <- p + geom_point(data=df2, aes(x=X, y=Y), size=4)
p <- p + labs(x='Time (hour)', y='Y')
p <- p + scale_x_continuous(breaks=tp)
p <- p + ylim(0,NA)
ggsave(file="ch.12/output/fig12-1-center.png", plot=p, dpi=300, width=4, height=3)
