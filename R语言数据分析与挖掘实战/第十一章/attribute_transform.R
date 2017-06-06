setwd("F:/数据及程序/chapter11/示例程序")
Data <- read.csv("./data/discdata.csv", header = T, encoding = 'utf-8')
# 删除重复项
index1 <- which(Data$VALUE == 52323324)
index2 <- which(Data$VALU == 157283328)
index <- sort(c(index1, index2))
Data <- Data[-index, ]
# 数据变换
x <- matrix(Data$VALUE, nrow = 47, ncol = 2, byrow = T)
index3 <- duplicated(Data$COLLECTTIME)
y <- Data[!index3, ]$COLLECTTIME
Data <- data.frame(Data[1:47, 1], x, y)
colnames(Data) <- c("SYS_NAME", "CWX-C", "CWX-D", "COLLECTTIME")
# 保存数据
write.csv(Data, "./tmp/chuliData.csv", row.names = T)