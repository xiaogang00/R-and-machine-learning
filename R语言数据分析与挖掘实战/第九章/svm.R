# 支持向量机模型构建
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter9/示例程序")
# 读取数据
trainData <- read.csv("./data/trainData.csv")
testData <- read.csv("./data/testData.csv")
# 将class列转换为factor类型
trainData <- transform(trainData, class = as.factor(class))
testData <- transform(testData, class = as.factor(class))

# 支持向量机分类模型构建
library(e1071)  # 加载e1071包
# 利用svm建立支持向量机分类模型
svm.model <- svm(class~., trainData[, -2])
summary(svm.model)

# 建立混淆矩阵
confusion <- table(trainData$class, predict(svm.model, trainData, type = 
                                              "class"))
accuracy <- sum(diag(confusion)) * 100 / sum(confusion)

# 保存输出结果
output_trainData = cbind(trainData, predict(svm.model, trainData, type = "class"))
colnames(output_trainData) <- c
("class", "id", "R1", "G1", "B1", "R2", "G2", "B2", "R3", "G3", "B3", "OUTPUT")
write.csv(output_trainData, "./tmp/output_trainData.csv", row.names = FALSE)

# 保存支持向量机模型
save(svm.model, file="./tmp/svm.model.RData")
