# 采用正则匹配那些带有翻页的网址，匹配网址的特点为：数字_页数.html的形式
stri_p <- regexec("(^.+/\\d+)_\\d{0,2}(.html)", info_d[, 2])

# 去除list_1.html形式的网页，以及与其类似的网页
infol <- info_d[-(which(sapply(stri_p, length) != 3)), ] 

# 提取正则匹配到的数据，并将数据进行粘接
parts <- do.call(rbind, regmatches(info_d[, 2], stri_p))
pas <- paste0(parts[, 2], parts[, 3])  
# 或者采用命令 paste(parts[,2],parts[,3],collapse = NULL)

# 将数据进行列组合，并且重新命名，对比处理前后的数据
combine <- cbind(parts, pas)
colnames(combine) <- c("fullurl", "temp1", "temp2", "new")

do.data <- data.frame((combine[, c(1, 4)]), stringsAsFactors = F)
# 如果不加stringsAsFactors参数，可能会将其中的数据类型转换为factor型
# 可以通过下列命令进行转换处理
# do.data[,1] <- as.character(do.data[, 1])
# do.data[,2] <- as.character(do.data[, 2])

# 判断处理前后的两列数据以及数据位置是否相同？
all.equal(infol[, 2], do.data[, 1]) 
# 如果返回为TRUE，两种数据集的连接采用如下方式
condata <- data.frame(cbind(infol[, 1], do.data[, 2]), stringsAsFactors = F)
colnames(condata) <- names(info_q)

# 如果判断结果为FALSE,可以采用如下方法
# 找到原始数据在处理后的数据集中的位置，将两种数据集进行连接
# pn <- data.frame(cbind(infol[,2], do.data[match(infol[, 2], do.data[, 1]), ]), stringsAsFactors = F)
# 如果pn中存在因子型，需要将其转换字符型
# for(i in 1:dim(pn)[2]) pn[,i] <- as.character( pn[, i]) all.equal(pn[, 1], pn[, 2])
# condata <- cbind(infol[, 1], pn[, 3])
# colnames(condata) <- names(info_q)

# 采用行连接将处理翻页后的数据与没有翻页的数据综合
item_info <- rbind(info_q, condata)

# 去重数据,以IP和网址划分数据集，选择其相同数据中的最后一条数据
user_info <- ddply(item_info, .(realIP,fullURL), tail, n = 1)  
