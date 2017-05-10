# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter7/示例程序")
# 数据读取
datafile <- read.csv('./data/air_data.csv', header = TRUE)

# 确定要探索分析的变量
col <- c(15:18, 20:29)  # 去掉日期型变量

# 输出变量最值、缺失情况
summary(datafile[, col])
