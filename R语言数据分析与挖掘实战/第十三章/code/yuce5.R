# 设置工作空间
library(nnet)
setwd("F:/数据及程序/chapter13/示例程序")
# 读入数据
Data <- read.csv("./data/Personal_Income.csv", header = FALSE)
asData <- scale(Data)
colnames(asData) <- c("x1", "x4", "x5", "x7", "y")  # 每列列名
nn <- nnet(y ~ ., asData[1:15, ], size = 6, decay = 0.00001, maxit = 2000,
           linout = T, trace = T)
predict <- predict(nn, asData[, 1:4], type = "raw")
predict <- predict * sd(Data[1:15, 5]) + mean(Data[1:15, 5])
a <- 1999:2015

# 画出序列预测值、真实值图像
plot(predict, col = 'red', type = 'b', pch = 16, xlab = '年份',
     ylab = '个人所得税 / 万元', xaxt = "n")
points(Data[1:15, 5], col = 'blue', type = 'b', pch = 4)
legend('topleft', c('个人所得税预测值', '个人所得税真实值'), pch = c(16, 4), 
       col = c('red', 'blue'))
axis(1, at = 1:17, labels = a)

