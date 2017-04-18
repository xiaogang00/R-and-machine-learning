# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter4/示例程序")
# 数据读取
inputfile <- read.csv('./data/electricity_data.csv', header = TRUE)

# 构造属性
loss <- 100 * (inputfile[, 1] - inputfile[, 2]) / inputfile[, 1] 
# 数据第一列为供入电量，第二列为供出电量

# 保存结果
outputfile <- data.frame(inputfile, '线损率(%)' = loss)  # 变量重命名，存入数据
