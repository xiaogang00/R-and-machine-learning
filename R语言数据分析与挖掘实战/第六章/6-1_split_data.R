# 数据划分
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter6/示例程序")

# 把数据分为两部分：训练数据、测试数据
# 读入数据
Data <- read.csv("./data/model.csv")
# 数据命名
colnames(Data) <- c("time", "userid", "ele_ind", "loss_ind", "alarm_ind", "class")
# 数据分割
set.seed(1234)  # 设置随机种子
# 定义序列ind，随机抽取1和2,1的个数占80%，2的个数占20%
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.8, 0.2))
trainData <- Data[ind == 1,]  # 训练数据
testData <- Data[ind == 2,]  # 测试数据
# 数据存储
write.csv(trainData, "./tmp/trainData.csv", row.names = FALSE)
write.csv(testData, "./tmp/testData.csv", row.names = FALSE)
