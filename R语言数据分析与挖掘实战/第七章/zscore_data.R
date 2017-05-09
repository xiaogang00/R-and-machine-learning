# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter7/示例程序")
# 数据读取
datafile <- read.csv('./data/zscoredata.csv', header = TRUE)

# 数据标准化
zscoredfile <- scale(datafile)

# 数据写出
write.csv(zscoredfile, './tmp/zscoreddata.csv')


