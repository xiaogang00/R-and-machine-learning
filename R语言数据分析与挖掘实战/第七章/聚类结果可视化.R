# 各簇中心的条形图
# install.packages("reshape")
# install.packages("ggplot2")
library(reshape)
library(ggplot2)
# 条形图
# 将数据格式转换为画图所需要的格式
data.bar <- as.data.frame(t(result$center))
colnames(data.bar) <- paste("class", 1:5, sep = "")
data.bar <- data.frame(index = c("L", "R", "F", "M", "C"), data.bar)
data.bar <- melt(data.bar, c("index"))
colnames(data.bar) <- c("index", "class", "center")
head(data.bar)
ggplot(data.bar, aes(x = index, y = center, fill = class)) + 
  scale_y_continuous(limits = c(-1, 3)) + geom_bar(stat = "identity") + 
  facet_grid(class ~ .) + guides(fill = FALSE) + theme_bw()
# 每一簇各指标的关系程度  --雷达图
# install.packages("fmsb")
library(fmsb)
max <- apply(result$centers, 2, max)
min <- apply(result$centers, 2, min)
data.radar <- data.frame(rbind(max, min, result$centers))
radarchart(data.radar, pty = 32, plty = 1, plwd = 2, vlcex = 0.7)
# 给雷达图加图例
L <- 1.2
for(i in 1:5){
  text(1.8, L, labels = paste("--class", i), col = i)
  L <- L - 0.2
}
# 查看各簇个数占比 --饼图
# install.packages("plotrix")
library(plotrix)
data.pie <- c(result$size)
prob <- paste(round(result$size / sum(result$size) * 100, 2), "%", sep = "")
lbls <- c(paste("class", 1:k, sep = "", ": ", prob))
pie3D(data.pie, labels = lbls, labelcex = 0.8, explode = 0.1,
      col = c("lightskyblue", "lightcyan", "turquoise",
                "lightskyblue3", "steelblue"))
