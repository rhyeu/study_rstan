library(rstan)
library(ggmcmc)

load('ch.4/output/result-model4-5.RData')

write.table(data.frame(summary(fit)$summary), file='ch.4/output/fit-summary.txt', sep='\t', quote=FALSE, col.names=NA)

ggmcmc(ggs(fit, inc_warmup=TRUE, stan_include_auxiliar=TRUE), file='ch.4/output/fit-traceplot.pdf', plot='traceplot')

ggmcmc(ggs(fit), file='ch.4/output/fit-ggmcmc.pdf')
# ggmcmc(ggs(fit), file='ch.4/output/fit-ggmcmc.pdf',
#   plot=c('traceplot', 'density', 'running', 'autocorrelation'))
