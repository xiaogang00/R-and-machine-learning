# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter6/示例程序")

# 读取数据
data_loss <- read.csv("./data/线损.csv")

# 构造线损
data_loss$日线损率 <- (data_loss[, 3] - data_loss[, 4]) / data_loss[, 3]


# 便于代码调用，将日线损率数据赋予变量v
V <- data_loss$日线损率

# Vb为当天与后5天共6天的线损率平均值
# Vf为当天与前5天共6天的线损率平均值
n <- nrow(data_loss)
Vb <- rep(0, n) 
Vf <- rep(0, n) 
E <- rep(0, n)   # 设置变量E，存放线损指标
for (i in 1:n) {  # 循环所有天，求出每天的线损指标
  if (i <= 5) {  # 前面不足5天的情况
    Vb[i] <- mean(V[i:(i + 5)])
    Vf[i] <- mean(V[1:i])
  }
  if (i > 5 & i < n - 5) {  # 前后均满足5天的情况
    Vb[i] <- mean(V[i:(i + 5)])
    Vf[i] <- mean(V[(i - 5):i])
  }
  if (i >= n - 5) {  # 后面不足5天的情况
    Vb[i] <- mean(V[i:n])
    Vf[i] <- mean(V[(i - 5):i])
  }
  if ((Vb[i] - Vf[i]) / Vf[i] > 0.01) {
    E[i] <- 1  # Vb比Vf的增长率判断，并标记
  }
  if ((Vb[i]-Vf[i]) / Vf[i] <= 0.01) {
    E[i] <- 0
  }
}
