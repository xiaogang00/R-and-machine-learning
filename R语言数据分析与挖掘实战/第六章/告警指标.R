# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter6/示例程序")

# 读取数据
data_alarm <- read.csv("./data/告警.csv")
data <- read.csv("./data/用户.csv")

# 构造ID&date属性
data_alarm$ID_date <- paste(data_alarm[, 1], data_alarm[, 2])
data$ID_date <- paste(data[, 1], data[, 2])

# 统计用户每天的告警次数
D <- data.frame(matrix(0, nrow(data), nrow(data_alarm)))

for (i in (1:nrow(data))) {
  for (k in (1:nrow(data_alarm))) {
    if (data$ID_date[i] == data_alarm$ID_date[k]) {
      D[i, k] <- 1
    } else {
      D[i, k] <- 0}
  }
}

D$sum <- apply(D, 1, sum)  # 按行计算总和
data$alarm_ind <- D$sum
data <- data[, c(1, 2, 6)]  # 去除不需要的ID，日期和告警次数
