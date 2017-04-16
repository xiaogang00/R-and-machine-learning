# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter4/示例程序")
# 读取数据
data <- read.csv('./data/normalization_data.csv', header = FALSE) 

# 最小-最大规范化
b1 <- (data[, 1] - min(data[, 1])) / (max(data[, 1]) - min(data[, 1]))
b2 <- (data[, 2] - min(data[, 2])) / (max(data[, 2]) - min(data[, 2]))
b3 <- (data[, 3] - min(data[, 3])) / (max(data[, 3]) - min(data[, 3]))
b4 <- (data[, 4] - min(data[, 4])) / (max(data[, 4]) - min(data[, 4]))
data_scatter <- cbind(b1, b2, b3, b4)

# 零-均值规范化
data_zscore <- scale(data)

# 小数定标规范化
i1 <- ceiling(log(max(abs(data[, 1])), 10))  # 小数定标的指数
c1 <- data[, 1] / 10 ^ i1
i2 <- ceiling(log(max(abs(data[, 2])), 10))
c2 <- data[, 2] / 10 ^ i2
i3 <- ceiling(log(max(abs(data[, 3])), 10))
c3 <- data[, 3] / 10 ^ i3
i4 <- ceiling(log(max(abs(data[, 4])), 10))
c4 <- data[, 4] / 10 ^ i4
data_dot <- cbind(c1, c2, c3, c4)

# 打印结果
options(digits = 4)  # 控制输出结果的有效位数
data
data_scatter
data_zscore
data_dot
