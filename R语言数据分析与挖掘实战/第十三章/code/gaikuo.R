# 数据划分
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter13/示例程序")

# 读入数据
Data <- read.csv("./data/data1.csv", header = TRUE)[, 2:15]

# 数据概括性度量
Min <- sapply(Data, min) # 最小值
Max <- sapply(Data, max) # 最大值
Mean <- sapply(Data, mean) # 均值
SD <- sapply(Data, sd) # 方差
cbind(Min, Max, Mean, SD)