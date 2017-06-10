setwd("F:/数据及程序/chapter11/示例程序")
Data <- read.csv("./data/discdata_processed.csv", header = TRUE)
colnames(Data) <- c("SYS_NAME", "COLLECTTIME", "CWC", "CWD")
attach(Data)
# 白噪声检验
Box.test(CWD, type = "Ljung-Box")