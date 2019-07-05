library(ggplot2)

d <- read.csv(file='ch.12/input/data-changepoint.txt')
p <- ggplot()
p <- p + theme_bw(base_size=18)
p <- p + geom_line(data=d, aes(x=X, y=Y), size=0.3)
p <- p + labs(x='Time (Second)', y='Y')
ggsave(file='ch.12/output/fig12-5-left.png', plot=p, dpi=300, w=4, h=3)
