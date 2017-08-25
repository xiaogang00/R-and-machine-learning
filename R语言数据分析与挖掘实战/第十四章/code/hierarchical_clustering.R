# 设置工作空间
setwd("F:/数据及程序/chapter14/示例程序")

library(ggplot2)
Data <- read.csv("./data/standardized.csv", header = FALSE)

attach(Data)
dist <- dist(Data, method = 'euclidean')
hc1 <- hclust(dist, "ward.D2")
plot(hc1)
# 分成三类
re1 <- rect.hclust(hc1, k = 3)  
a <- re1[[2]]
b <- re1[[3]]
c <- re1[[1]]
# 商圈类别1
matrix <- Data[a,]
d <- dim(matrix)
y <- as.numeric(t(matrix))
row <- factor(rep(1:d[1], each = d[2]))
x <- rep(1:d[2], times = d[1])
data <- data.frame(y = y, x = x, row = row)
ggplot(data = data, aes(x = x, y = y, group = row)) + geom_line() + 
  scale_x_continuous(breaks = c(1, 2, 3, 4),
                     labels = c("工作日人均停留时间", "凌晨人均停留时间",
                                "周末人均停留时间", "日均人流量")) + 
  labs(title = "商圈类别1", x = "", y = "")
# 商圈类别2
matrix <- Data[b, ]
d <- dim(matrix)
y <- as.numeric(t(matrix))
row <- factor(rep(1:d[1], each = d[2]))
x <- rep(1:d[2], times = d[1])
data <- data.frame(y = y, x = x, row = row)
ggplot(data = data, aes(x = x, y = y, group = row)) + geom_line() +
  scale_x_continuous(breaks = c(1, 2, 3, 4),
                     labels = c("工作日人均停留时间", "凌晨人均停留时间",
                                "周末人均停留时间", "日均人流量")) +
  labs(title="商圈类别2", x="", y="")
# 商圈类别3
matrix <- Data[c,]
d <- dim(matrix)
y <- as.numeric(t(matrix))
row <- factor(rep(1:d[1], each = d[2]))
x <- rep(1:d[2], times = d[1])
data <- data.frame(y = y, x = x, row = row)
ggplot(data = data, aes(x = x, y = y, group = row)) + geom_line() +
  scale_x_continuous(breaks = c(1, 2, 3, 4),
                     labels = c("工作日人均停留时间", "凌晨人均停留时间",
                                "周末人均停留时间", "日均人流量")) +
  labs(title = "商圈类别3", x = "", y = "")

