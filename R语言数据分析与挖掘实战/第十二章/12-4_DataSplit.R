# 对网址进行处理，以/ 符合划分网址，获得其类别，结果为list型
web <- strsplit(user_info[,2], "/", fixed = TRUE) 
# 对每个LIST型的数据，将其组合成数据框的格式
w.combine <- ldply(web, rbind)

# 获取知识列表中婚姻类别的数据以及在原始数据中的位置
hunyi <- w.combine[which(w.combine[,5] == "hunyin"), ] 
item_hunyi <- user_info[row.names(hunyi), ]

# 或者采用更简单的办法，用SQL语句查询包含婚姻知识的关键字
# item_hunyi <- qldf::sqldf("select * from user_info where fullurl like '%info/hunyin%' ")
