# 构建CART决策树模型
# 设置工作空间
# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/chapter6/示例程序")
# 读取数据
trainData <- read.csv("./data/trainData.csv")

# 将class列转换为factor类型
trainData <- transform(trainData, class = as.factor(class))

# 构建CART决策树模型
library(tree)#加载tree包
# 利用tree建立CART决策树
tree.model <- tree(class ~ ele_ind + loss_ind + alarm_ind, trainData)
summary(tree.model)

# 画决策树图
plot(tree.model)
text(tree.model)

# 建立混淆矩阵
confusion <- table(trainData$class, predict(tree.model, trainData, 
                                            type = "class"))
accuracy <- sum(diag(confusion)) * 100 / sum(confusion)

# 保存输出结果
output_tree.trainData <- cbind(trainData, predict(tree.model, trainData, 
                                                  type <- "class"))
colnames(output_tree.trainData) <- c(colnames(trainData), "OUTPUT")
write.csv(output_tree.trainData, "./tmp/output_tree.trainData.csv", 
          row.names = FALSE)

# 保存CART决策树模型
save(tree.model,file = "./tmp/tree.model.RData")