# 设置工作空间
setwd("F:/数据及程序/chapter14/示例程序")

Data <- read.csv("./data/standardized.csv", header = FALSE)
# colnames(Data) <- c("x1", "x2", "x3"," x4")
attach(Data)
dist <- dist(Data, method = 'euclidean')
hc1 <- hclust(dist, "ward.D2") 
plot(hc1, hang = -1)  
detach(Data)
