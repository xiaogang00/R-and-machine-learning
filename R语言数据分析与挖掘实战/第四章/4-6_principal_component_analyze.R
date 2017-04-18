# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter4/示例程序")
# 数据读取
inputfile <- read.csv('./data/principal_component.csv', header = FALSE)

# 主成分分析
PCA <- princomp(inputfile, cor = FALSE)
names(PCA)  # 查看输出项

(PCA$sdev) ^ 2  # 主成分特征根
summary(PCA)  # 主成分贡献率
PCA$loadings  # 主成分载荷      
PCA$scores  # 主成分得分
