# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter6/示例程序")

library(XLConnect)
missing_data <- XLConnect::readWorksheetFromFile(file = "./data/missing_data.xls",
                                                 sheet = 1, header = FALSE)

lagrange <- function(x, xi, yi) {
  n <- length(xi)
  lage <- 0
  for (i in 1:n) {
    li <- 1
    for (j in 1:n) {
      if (i != j) {
        li <- li * (x - xi[j]) / (xi[i] - xi[j])
      }
    }
    lage <- li * yi[i] + lage
  }
  return(lage)
}

missdata <- missing_data

for (k in 1:3) {
  x <- which(is.na(missing_data[, k]))
  x1 <- c(0, x)
  x2 <- c(x, nrow(missing_data))
  x12 <- x2 - x1 - 1
  xx1 <- x12[1:(length(x12) - 1)]  # 缺失值前面的行数
  xx2 <- x12[2:(length(x12))]  # 缺失值后面的行数
  
  j <- 1
  for (m in x) {
    if (xx1[j] >= 5) {  # 空值前的判断
      xi <- (m - 5):(m - 1)
    } else {
      xi <- (m - xx1[j]):(m - 1)
    }
    if (xx2[j] >= 5) {  # 空值后的判断
      xi <- c(xi, (m + 1):(m + 5))
    } else {
      xi <- c(xi, (m + 1):(m + xx2[j]))
    }
    yi <- missing_data[xi, k]
    missdata[m, k] <- lagrange(m, xi, yi) 
    print(c(m, missdata[m, k]))
    j <- j + 1
  }
}
