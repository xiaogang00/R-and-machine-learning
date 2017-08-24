# 数据划分
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter13/示例程序")

# 读入数据
Data <- read.csv("./data/data1.csv", header = TRUE)[, 2:15]

# pearson相关系数，保留两位小数
round(cor(Data, method = c("pearson")), 2)