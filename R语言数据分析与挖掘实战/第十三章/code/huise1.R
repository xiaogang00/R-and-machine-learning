# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter13/示例程序")

# 读入数据
Data <- read.csv("./data/data1.csv", header = TRUE)
attach(Data)
# 加载GM(1, 1)源文件
source("./code/gm11.txt")
gm11(x1 / 10000, length(x1 / 10000) + 2) 
gm11(x2, length(x2) + 2)
gm11(x3, length(x3) + 2)
gm11(x4, length(x4) + 2)
gm11(x5, length(x5) + 2)
gm11(x7, length(x7) + 2)
