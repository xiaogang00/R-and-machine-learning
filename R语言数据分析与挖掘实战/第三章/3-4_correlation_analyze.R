# 餐饮销量数据相关性分析
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter3/示例程序")
# 读取数据
cordata <- read.csv(file = "./data/catering_sale_all.csv", header = TRUE)
# 求出相关系数矩阵
cor(cordata[, 2:11])