# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter13/示例程序")

# 读入数据
Data <- read.csv("./data/data4.csv", header = TRUE)
# 加载GM(1,1)源文件
source("./code/gm11.txt")
gm11(x1 / 10000, length(x1 / 10000) + 2)
gm11(x2 / 10000, length(x2 / 10000) + 2)
gm11(x3 / 10000, length(x3 / 10000) + 2)
gm11(x4 / 10000, length(x4 / 10000) + 2)
gm11(x6, length(x6) + 2)
gm11(x7 / 10000, length(x7 / 10000) + 2)
gm11(x9 / 10000, length(x9 / 10000) + 2)
gm11(x10 / 10000, length(x10 / 10000) + 2)