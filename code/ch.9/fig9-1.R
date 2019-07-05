library(ggplot2)

d <- read.csv(file='ch.9/input/data-mvn.txt')
p <- ggplot(data=d, aes(x=Y1, y=Y2))
p <- p + theme_bw(base_size=18)
p <- p + geom_point(shape=1, size=3)
ggsave(file='ch.9/output/fig9-1.png', plot=p, dpi=300, w=4, h=3)
