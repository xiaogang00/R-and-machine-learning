require(plyr) 

# 利用R对数据进行处理，去除多余的属性列,保留用户ip,与访问网址列
info <- data[,c(1,11)]
# 亦可采用下列方法去除多余属性列
# info <- data.frame(cbind(realIP = data$realIP, fullURL = data$fullURL), stringsAsFactors = F)


# 处理info类型中存在带有“？”的网址
info[,2] <- gsub("\\?.*", "", info[, 2], perl = T)

detach("package:RMySQL")
# 这里采用sqldf包里的sqldf命令，通过SQL进行删选翻页与不翻页的网页。
info_d <- sqldf::sqldf("select * from info where fullurl like '%!_%' escape '!'") 
info_q <- sqldf::sqldf("select * from info where fullurl  not like '%!_%' escape '!' ")


# 读入ask类型的数据,并删选用户与项目属性
ask_data <- read.csv(file = "g:/ask02.csv", header = T, stringsAsFactors = F)  
askitem <- ask_data[, c(1, 2)]

# 将ask数据去重处理
item_ask <- ddply(askitem, .(realIP,FULLURL), tail, n = 1)
