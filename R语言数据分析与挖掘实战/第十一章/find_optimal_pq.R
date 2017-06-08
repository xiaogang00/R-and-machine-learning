setwd("F:/数据及程序/chapter11/示例程序")
library(TSA)
library(forecast)
Data <- read.csv("./data/discdata_processed.csv", header = T)
colnames(Data) <- c("SYS_NAME", "COLLECTTIME", "CWC", "CWD")
attach(Data)
# BIC图
res <- armasubsets(y = CWD, nar = 5, nma = 5, y.name = 'test',
                   ar.method = 'ols')
plot(res)
# 选择拥有最小bic值得p、q值
auto.arima(CWD, ic = "bic")
