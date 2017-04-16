# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter4/示例程序")
# 读取销售数据文件，提取标题行
inputfile <- read.csv('./data/catering_sale.csv', header = TRUE) 

# 变换变量名
inputfile <- data.frame(sales = inputfile$'销量', date = inputfile$'日期')

# 数据截取
inputfile <- inputfile[5:16, ]

# 缺失数据的识别
is.na(inputfile)  # 判断是否存在缺失
n <- sum(is.na(inputfile))  # 输出缺失值个数

# 异常值识别
par(mfrow = c(1, 2))  # 将绘图窗口划为1行两列，同时显示两图
dotchart(inputfile$sales)  # 绘制单变量散点图
boxplot(inputfile$sales, horizontal = TRUE)  # 绘制水平箱形图

# 异常数据处理
inputfile$sales[5] = NA  # 将异常值处理成缺失值
fix(inputfile)  # 表格形式呈现数据

# 缺失值的处理
inputfile$date <- as.numeric(inputfile$date)  # 将日期转换成数值型变量
sub <- which(is.na(inputfile$sales))  # 识别缺失值所在行数
inputfile1 <- inputfile[-sub, ]  # 将数据集分成完整数据和缺失数据两部分
inputfile2 <- inputfile[sub, ]

# 行删除法处理缺失，结果转存
result1 <- inputfile1

# 均值替换法处理缺失，结果转存
avg_sales <- mean(inputfile1$sales)  # 求变量未缺失部分的均值
inputfile2$sales <- rep(avg_sales,n)  # 用均值替换缺失
result2 <- rbind(inputfile1, inputfile2)  # 并入完成插补的数据

# 回归插补法处理缺失，结果转存
model <- lm(sales ~ date, data = inputfile1)  # 回归模型拟合
inputfile2$sales <- predict(model, inputfile2)  # 模型预测
result3 <- rbind(inputfile1, inputfile2)

# 多重插补法处理缺失，结果转存
library(lattice)  # 调入函数包
library(MASS)
library(nnet)
library(mice)  # 前三个包是mice的基础
imp <- mice(inputfile, m = 4)  # 4重插补，即生成4个无缺失数据集
fit <- with(imp,lm(sales ~ date, data = inputfile))  # 选择插补模型
pooled <- pool(fit)
summary(pooled)
result4 <- complete(imp, action = 3)  # 选择第三个插补数据集作为结果
