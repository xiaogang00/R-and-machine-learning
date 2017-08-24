# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter13/示例程序")

# 读入数据
Data <- read.csv("./data/data2.csv", header = TRUE)
# 加载adapt-lasso源代码
source("./code/lasso.adapt.bic2.txt")
out2 <- lasso.adapt.bic2(x=Data[,1:5], y = Data$y)
# adapt-lasso输出结果名称
names(out2)
# 变量选择输出结果序号
out2$x.ind
# 保留五位小数
round(out2$coeff, 5)
# 保存adapt-lasso模型
save(out2, file = "./tmp/out2.RData")

