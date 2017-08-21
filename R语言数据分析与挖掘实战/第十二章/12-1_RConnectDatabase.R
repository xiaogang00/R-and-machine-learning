setwd("F:/数据及程序/chapter12/示例程序")
# 访问MySQL数据库示例程序
# 加载RMySQL包
require(RMySQL) 

# 建立R与数据库的连接 
con <- dbConnect(MySQL(), host = "127.0.0.1", port = 3306, dbname = "new",
                 user = "root", password = "root")
# 修改成自己数据库名称、用户名、密码、端口等

# 修改此连接的编码为中文，只针对此连接有效。
dbSendQuery(con, "set character_set_results = gbk") 
dbSendQuery(con, "set character_set_connection = gbk")
dbSendQuery(con, "set character_set_database = gbk")
dbSendQuery(con, "set character_set_client = gbk")

# R通过连接对表按条件查询，查询fullurl中带有_的并且fullurlid为107001的数据(即知识类型页面)
con_query <- dbSendQuery(con, "select * from all_gzdata where fullurlid = 107001")

# 提取查询到的数据，n=-1代表提取所有数据，n=100代表提取前100行
data <- dbFetch(con_query, n = -1)

# 以下命令将本地的数据写入数据表中，name表示写入的表名
# value表示需要写入的数据
# dbWriteTable(con, name="info", value=info_d, append = T, row.names = T)

# 关闭连接
dbDisconnect(con) 
# 如果需要通过R的连接进行中文查询，可能需要修改下面的编码
# set character_set_client = gbk;客户端编码方式
# set character_set_connection = gbk;建立连接使用的编码
# set character_set_database = gbk;数据库的编码
# set character_set_results = gbk;结果集的编码
# set character_set_server = gbk;数据库服务器的编码
