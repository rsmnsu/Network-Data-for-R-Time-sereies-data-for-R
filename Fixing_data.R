rm(list=ls(all=TRUE))
graphics.off
install.packages("xts")
library("xts")
# Chapter 1
#Simulate data
x<- matrix(1:4, nrow=2,ncol=2)
idx<- as.Date(c("2015-01-01","2015-02-01"))
x<-xts(x, order.by = idx)
