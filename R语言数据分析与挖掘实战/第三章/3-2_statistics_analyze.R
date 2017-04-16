# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter3/示例程序")
# 读入数据
saledata <- read.table(file = "./data/catering_sale.csv", sep=",", header = TRUE) 
sales <- saledata[, 2]

# 统计量分析
# 均值
mean_ <- mean(sales, na.rm = T)
# 中位数
median_ <- median(sales, na.rm = T)
# 极差
range_ <- max(sales, na.rm = T) - min(sales, na.rm = T)
# 标准差
std_ <- sqrt(var(sales, na.rm = T))
# 变异系数
variation_ <- std_ / mean_
# 四分位数间距
q1 <- quantile(sales, 0.25, na.rm = T)
q3 <- quantile(sales, 0.75, na.rm = T)
distance <- q3 - q1
a <- matrix(c(mean_, median_, range_, std_, variation_, q1, q3, distance),
            1, byrow = T)
colnames(a) <- c("均值", "中位数", "极差", "标准差", "变异系数", 
                 "1/4分位数", "3/4分位数", "四分位间距")
print(a) 
