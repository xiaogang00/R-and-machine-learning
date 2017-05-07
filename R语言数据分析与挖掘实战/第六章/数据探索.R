# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter6/示例程序")
# 读入数据
data_FB <- read.csv("./data/窃漏电用户分布分析.csv", header = TRUE)


# ----------------------------窃漏电用户分布分析-------------------------------

# 计算每类用户类别及用户数
Type <- table(data_FB[, 3])

# 方法1：基础绘图
p <- barplot(Type, space = 0, ylim = c(0, 30), col = rainbow(7), xaxt = "n",
             ylab = "计数", main = "窃电用户用电类别分布分析")
df <- data.frame(Type)
axis(1, p, df$Var1, las = 2)
text(p, Type, labels = Type,pos = 3)  # 添加数值标签
# xaxt="n"设置是否显示x轴信息,axes=F不显示坐标轴
# 颜色可以用heat.colors,terrain.colors,cm.colors等


# 方法2：饼图
Type <- data.frame(Type)
pct <- round(Type$Freq / sum(Type$Freq) * 100, 1)
lbls <- paste0(Type$Var1, pct, "%")
pie(Type$Freq, labels = lbls)  # 普通饼图
library(plotrix)  # 3D饼图
pie3D(Type$Freq, labels = lbls, main = "窃电用户用电类别分布",
      labelrad = 1.4, start = 3)
pie3D(Type$Freq, labels = lbls, explode = 0.1, radius = 1) 
# radius半径，explode分离度


# ----------------------------正常用户用电量趋势分析---------------------------

Regular <- read.csv("./data/正常用电量数据.csv",header=T)

# 基础绘图
plot(1:59, Regular[, 2], type = "l", col = "blue", 
     main = "正常用户的用电量趋势")  # 主标题，x,y轴标题


# ---------------------------窃漏电用户用电量趋势分析--------------------------

Unusual <- read.csv("./data/窃电用电量数据.csv", header = T)

# 方法1：基础绘图
plot(Unusual[, 2], type = "l", col = "blue")  # 设置主标题，x,y轴标题

# 方法2：在一张图上对比
plot(Regular[,2], col = "blue", lty = 1, type = "l", 
     main = "正常用户与窃电用户的用电趋势比较", ylim = c(0,8000), 
     ylab = "用电量", xlab = "", xaxt = "n")  # axes = F

axis(1, at = 1:59, Regular[, 1], las = 2)  # 设置x轴
lines(Unusual[,2], col = "red", lty = 2, type = "l")  # 添加窃电数据
legend("bottomleft", legend = c("正常用户","窃电用户"), 
       lty = 1:2, col = c("blue", "red"))  # 添加图例
