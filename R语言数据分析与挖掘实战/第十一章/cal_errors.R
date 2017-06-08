setwd("F:/数据及程序/chapter11/示例程序")
Data <- read.csv("./data/predictdata.csv", header = T)
colnames(Data) <- c("num", "pre", "real")
attach(Data)
# 平均绝对误差
mae <- mean(abs(pre - real))
# 均方根误差
rmse <- mean((pre - real) ^ 2)
# 平均绝对百分误差
mape <- mean(abs(pre - real) / real)
