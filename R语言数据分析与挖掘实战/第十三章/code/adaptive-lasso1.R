# 数据划分
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter13/示例程序")

# 读入数据
Data <- read.csv("./data/data1.csv", header = TRUE)
# 加载adapt-lasso源代码
source("./code/lasso.adapt.bic2.txt")
out1 <- lasso.adapt.bic2(x = Data[, 1:13], y = Data$y)
# adapt-lasso输出结果名称
names(out1)
# 变量选择输出结果序号
out1$x.ind
# 保留五位小数
round(out1$coeff, 5)
# 保存adapt-lasso模型
save(out1, file = "./tmp/out1.RData")
