# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter4/示例程序")
# 读取数据文件，提取标题行
data <- read.csv('./data/discretization_data.csv', header = TRUE) 

# 等宽离散化
v1 <- ceiling(data[, 1] * 10)

# 等频离散化
names(data) <- 'f'  # 变量重命名
attach(data)
seq(0, length(f), length(f) / 6)  # 等频划分为6组
v <- sort(f)  # 按大小排序作为离散化依据
v2 <- rep(0, 930)  # 定义新变量
for (i in 1:930) {
  v2[i] <- ifelse (f[i] <= v[155], 1,
                   ifelse (f[i] <= v[310], 2,
                           ifelse (f[i] <= v[465], 3,
                                   ifelse (f[i] <= v[620], 4, 
                                           ifelse (f[i] <= v[775], 5, 6)))))
} 

detach(data)

# 聚类离散化
result <- kmeans(data, 6)
v3 <- result$cluster

# 图示结果
plot(data[, 1], v1, xlab = '肝气郁结证型系数')
plot(data[, 1], v2, xlab = '肝气郁结证型系数')
plot(data[, 1], v3, xlab = '肝气郁结证型系数')
