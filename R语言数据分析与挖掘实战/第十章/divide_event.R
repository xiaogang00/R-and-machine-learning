# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter10/示例程序")

data <- read.csv("./data/water_heater.csv", header = TRUE)
data$"发生时间" <- strptime(data$"发生时间", "%Y%m%d%H%M%S")
data$eventnum <- as.numeric(row.names(data))

whdata <- data[data$"水流量" != 0, ]
t1 <- whdata$"发生时间"
m <- length(t1)  # 得到读取的表格的数据维数
Tm <- 240  # 阀值设置为4分钟(240秒)
t2 <- c(t1[1], t1[1:(m - 1)])
t3 <- c(t1[2:m], t1[m])
td1 <- difftime(t1, t2, units = "secs")  # 生成向前时差列
td2 <- difftime(t1, t3, units = "secs")  # 生成向后时差列

headornot <- rep(0, m)
endornot <- rep(0, m)
if (whdata$"水流量"[1] != 0) headornot[1] = 1
if (whdata$"水流量"[m] != 0) endornot[m] = 1
for ( i in 2:length(headornot)) {  # 寻找连续用水起点
  if (abs(td1[i]) >= Tm){
    headornot[i] <- 1
  }else{
    headornot[i] <- 0
  }
}
for ( i in 1:(length(endornot)-1)) {  # 寻找连续用水终点
  if (abs(td2[i]) >= Tm){
    endornot[i] <- 1
  }else{
    endornot[i] <- 0
  }
}
dividsequence <- data.frame(matrix(NA, sum(headornot == 1), 3))
colnames(dividsequence) <- c("事件序号", "事件起始编号", "事件终止编号")
dividsequence[,1] <- c(1:sum(headornot == 1))
dividsequence[,2] <- whdata$eventnum[which(headornot == 1)]
dividsequence[,3] <- whdata$eventnum[which(endornot == 1)]
write.csv(file = "./tmp/dividsequence.csv", dividsequence, row.names = F)

