# 设置工作空间
setwd("D:/test")
library(nnet)
# 读入数据
Data <- read.csv("./data/revenue.csv", header = FALSE)
asData <- scale(Data)
colnames(asData) <- c("x1", "x2", "x3", "x4", "x5", "x7", "y")  # 每列列名
nn <- nnet(y ~ ., asData[1:22, ], size = 6, decay = 0.00000001, 
           maxit = 10000, linout = T, trace = T)
predict <- predict(nn,asData[, 1:6])
predict <- predict * sd(Data[1:22, 7]) + mean(Data[1:22, 7])
a <- 1994:2015
# 画出序列预测值、真实值图像
plot(predict, col = 'red', type = 'b', pch = 16, xlab = '年份', 
     ylab = '地方财政收入 / 万元', xaxt = "n")
points(Data[1:22, 7], col = 'blue', type = 'b', pch = 4)
legend('topleft', c('地方财政收入预测值', '地方财政收入真实值'), 
       pch = c(16, 4), col = c('red', 'blue'))
axis(1, at = 1:22, labels = a)
