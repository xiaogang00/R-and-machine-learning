# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter3/示例程序")
# 读入数据
saledata <- read.csv(file = "./data/catering_sale.csv", header = TRUE) 

# 缺失值检测 并打印结果，由于R把TRUE和FALSE分别当作1、0，可以用sum()和mean()函数来分别获取缺失样本数、缺失比例
sum(complete.cases(saledata))
sum(!complete.cases(saledata))
mean(!complete.cases(saledata))
saledata[!complete.cases(saledata), ]

# 异常值检测箱线图
sp <- boxplot(saledata$"销量", boxwex = 0.7)
title("销量异常值检测箱线图")
xi <- 1.1
sd.s <- sd(saledata[complete.cases(saledata), ]$"销量")
mn.s <- mean(saledata[complete.cases(saledata), ]$"销量")
points(xi, mn.s, col = "red", pch = 18)
arrows(xi, mn.s - sd.s, xi, mn.s + sd.s, code = 3, col = "pink", angle = 75, length = .1)
text(rep(c(1.05, 1.05, 0.95, 0.95), length = length(sp$out)), 
     labels = sp$out[order(sp$out)], sp$out[order(sp$out)] + 
       rep(c(150, -150, 150, -150), length = length(sp$out)), col = "red")
