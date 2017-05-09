# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter7/示例程序")
# 数据读取
inputfile <- read.csv('./data/zscoreddata.csv', header = TRUE)

# 聚类分析
result <- kmeans(inputfile, 5)

# 结果输出
type <- result$cluster
table(type)  # 查看类别分布
centervec <- result$center
