#### Chapter 1 ####
# install.packages("ISwR")
library(ISwR)
plot(rnorm(1000))

#### Chapter 3 ####
sample(1:40, 5)
sample(c("succ", "fail"), 10, replace=T, prob=c(0.9, 0.1))
1/prod(40:36)

x <- seq(-4,4,0.1)
plot(x,dnorm(x),type="l")