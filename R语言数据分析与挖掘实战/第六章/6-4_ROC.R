# ROC曲线
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter6/示例程序")
# 读取数据
testData <- read.csv("./data/testData.csv")
# 读取模型
load("./tmp/tree.model.RData")
load("./tmp/nnet.model.RData")

# ROC曲线
library(ROCR)  # 加载ROCR包

# 画出神经网络模型的ROC曲线
nnet.pred <- prediction(predict(nnet.model, testData), testData$class)
nnet.perf <- performance(nnet.pred, "tpr", "fpr") 
plot(nnet.perf)

# 画出CART决策的ROC曲线
tree.pred <- prediction(predict(tree.model, testData)[, 2], testData$class)
tree.perf <- performance(tree.pred, "tpr", "fpr") 

plot(tree.perf)