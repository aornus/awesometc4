print( 5 + (2.3 - 1.125)*3.2/1.1 + 1.23E3)
## [1] 1238.418
cat("log10(2)==", log10(2), "\n")
## sin(pi/2)= 1 
## 向量
x1 <- 1:12
print(x1)

##绘图
curve(x^8, -12, 12)

curve(sin(x), 0, 2*pi)
abline(h=0)
### 条形图
barplot(c("男生"=10, "女生"=7), 
        main="男女生人数")
### plot()函数做了散点图, plot()函数第一个自变量是各个点的横坐标值
# 第二个自变量是对应的纵坐标值。
exps <- c(-2:2)
plot(c(-2,-1,0,1,2), exp(exps))


## 基本绘图
d.cancer <- readr::read_csv("data/cancer.csv", 
                            locale=locale(encoding="GBK"))
res1 <- table(d.cancer[,'sex']); print(res1)
barplot(res1)
barplot(res1, main="性别分布", 
        col=c("brown1", "blue2"))

x <- rnorm(30, mean=100, sd=1)
print(round(x,2))
tmp.dens <- density(x)
hist(x, freq=FALSE,
     ylim=c(0,max(tmp.dens$y)),
     col=rainbow(15),
     main='正态随机数',
     xlab='', ylab='频数')
lines(tmp.dens, lwd=2, col='blue')

## 高级绘图
x <- seq(-3,3, length=100)
y <- x
f <- function(x,y,ssq1=1, ssq2=2, rho=0.5){
  det1 <- ssq1*ssq2*(1 - rho^2)
  s1 <- sqrt(ssq1)
  s2 <- sqrt(ssq2)
  1/(2*pi*sqrt(det1)) * exp(-0.5 / det1 * (
    ssq2*x^2 + ssq1*y^2 - 2*rho*s1*s2*x*y))
}
z <- outer(x, y, f)


image(x, y, z)
