options(digits=7)
library(pomp2)

logmeanexp(rep(10,10),se=TRUE)
logmeanexp(10^seq(8,10),se=TRUE)
logmeanexp(c(1.2e-100,1.4e-100,1.8e-100),se=TRUE)
logmeanexp(c(1e-200,1.5e-200,1.6e-200))
logmeanexp(10^seq(8,10),se=NA)
logmeanexp(10^seq(8,10),se=NULL)

