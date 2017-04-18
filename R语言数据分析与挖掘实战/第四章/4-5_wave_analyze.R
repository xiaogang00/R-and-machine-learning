# 数据生成，信号模拟
N <- 1024; k <- 6  # 参数赋值
x <- ((1:N) - N/2 ) * 2 * pi * k / N
y <- ifelse(x > 0, sin(x), sin(3 * x) )  # 划分低频波动段和高频波动段
signal <- y + rnorm(N) / 10  # 添加扰动项，生成信号变量

# 调用函数包
library(waveslim)

# 对信号z进行小波分解
d <- dwt(signal, n.levels = 4)

# 输出各层小波系数
data.frame(d$d1, d$d2, d$d3, d$d4)
