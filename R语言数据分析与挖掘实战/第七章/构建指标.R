# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter7/示例程序")

cleanedfile <- read.csv('./tmp/cleanedfile.csv', header = TRUE)

# 构造L、R、F、M、C指标
# 转换为时间格式
cleanedfile$FFP_DATE <- as.Date(cleanedfile$FFP_DATE)
cleanedfile$LOAD_TIME <- as.Date(cleanedfile$LOAD_TIME)

# 构造时间间隔格式
library(lubridate)  # 处理日期格式数据包
interval <- interval(cleanedfile$FFP_DATE, cleanedfile$LOAD_TIME)  

# 以月为单位计算时长，输入为时间间隔
L <- time_length(interval, 'month')
L <- round(L, 2)

R <- cleanedfile$LAST_TO_END
F <- cleanedfile$FLIGHT_COUNT
M <- cleanedfile$SEG_KM_SUM
C <- cleanedfile$avg_discount

# 数据整合
airdata <- data.frame(L, R, F, M, C)
write.csv(airdata, './tmp/zscoredata.csv', row.names = FALSE)
