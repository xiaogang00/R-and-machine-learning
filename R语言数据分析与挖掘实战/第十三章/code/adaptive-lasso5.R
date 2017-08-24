# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter13/示例程序")

# 读入数据
Data <- read.csv("./data/data5.csv", header = TRUE)
# 加载adapt-lasso源代码
source("./code/lasso.adapt.bic2.txt")
out5 <- lasso.adapt.bic2(x = Data[, 1:10], y = Data$y)
# adapt-lasso输出结果名称
names(out5)
# 变量选择输出结果序号
out5$x.ind
# 保留五位小数
round(out5$coeff, 5)
# 保存adapt-lasso模型
save(out5, file = "./tmp/out5.RData")