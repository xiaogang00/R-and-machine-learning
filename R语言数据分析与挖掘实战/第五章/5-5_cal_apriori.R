# 设置工作空间
install.packages("arules")
library ( arules )
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter5/示例程序")
# 读入数据
tr <- read.transactions("./data/menu_orders.txt", format = "basket", sep=",")                              
summary(tr)                                  
inspect(tr)  
# 支持度0.2,置信度0.5
rules0 <- apriori(tr, parameter = list(support = 0.2, confidence = 0.5))
rules0
inspect(rules0)
