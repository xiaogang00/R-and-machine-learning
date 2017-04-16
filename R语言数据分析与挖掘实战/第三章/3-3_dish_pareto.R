# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter3/示例程序")
# 读取菜品数据，绘制帕累托图
dishdata <- read.csv(file = "./data/catering_dish_profit.csv")
barplot(dishdata[, 3], col = "blue1", names.arg = dishdata[, 2], width = 1, 
        space = 0, ylim = c(0, 10000), xlab = "菜品", ylab = "盈利：元")
accratio <- dishdata[, 3]
for ( i in 1:length(accratio)) {
  accratio[i] <- sum(dishdata[1:i, 3]) / sum(dishdata[, 3])
}

par(new = T, mar = c(4, 4, 4, 4))
points(accratio * 10000 ~ c((1:length(accratio) - 0.5)), new = FALSE, 
       type = "b", new = T)
axis(4, col = "red", col.axis = "red", at = 0:10000, label = c(0:10000 / 10000))
mtext("累积百分比", 4, 2)

points(6.5, accratio[7] * 10000, col="red")
text(7, accratio[7] * 10000,paste(round(accratio[7] + 0.00001, 4) * 100, "%")) 
