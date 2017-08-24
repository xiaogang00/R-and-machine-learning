# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter13/示例程序")

# 读入数据
Data <- read.csv("./data/data3.csv", header = TRUE)
# 加载GM(1,1)源文件
source("./code/gm11.txt")
gm11(x3 / 10000, length(x3 / 10000) + 2)
gm11(x4 / 10000, length(x4 / 10000) + 2)
gm11(x6 / 10000, length(x6 / 10000) + 2)
gm11(x8 / 10000, length(x8 / 10000) + 2)
