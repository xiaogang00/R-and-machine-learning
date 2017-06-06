setwd("F:/数据及程序/chapter11/示例程序")
library(forecast)
Data <- read.csv("./data/discdata_processed.csv", header = T)
colnames(Data) <- c("SYS_NAME", "COLLECTTIME", "CWC", "CWD")
attach(Data)
m1 <- arima(CWD, order = c(0, 1, 1))
r1 <- m1$residuals 
# 对残差进行平稳性检验
adfTest(r1)
# 对残差进行随机性检验
Box.test(r1, type = "Ljung-Box") 
m2 <- arima(CWD, order = c(0, 1, 2))
r2 <- m1$residuals
# 对残差进行平稳性检验
adfTest(r2)
# 对残差进行纯随机性检验
Box.test(r2, type = "Ljung-Box")
