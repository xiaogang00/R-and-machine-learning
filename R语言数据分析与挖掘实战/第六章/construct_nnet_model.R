# 神经网络模型构建
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter6/示例程序")
# 读取数据
trainData <- read.csv("./data/trainData.csv")

# 将class列转换为factor类型
trainData <- transform(trainData, class = as.factor(class))

# 神经网络模型构建
library(nnet) # 加载nnet包
# 利用nnet建立神经网络
nnet.model <- nnet(class ~ ele_ind + loss_ind + alarm_ind, trainData, 
                   size = 10, decay = 0.05)
summary(nnet.model)

# 建立混淆矩阵
confusion <- table(trainData$class, predict(nnet.model, trainData, 
                                            type = "class"))
accuracy <- sum(diag(confusion)) * 100 / sum(confusion)

# 保存输出结果
output_nnet.trainData <- cbind(trainData, predict(nnet.model, trainData, 
                                                  type = "class"))
colnames(output_nnet.trainData) <- c(colnames(trainData), "OUTPUT")
write.csv(output_nnet.trainData, "./tmp/output_nnet.trainData.csv", 
          row.names = FALSE)

# 保存神经网络模型
save(nnet.model, file = "./tmp/nnet.model.RData")
