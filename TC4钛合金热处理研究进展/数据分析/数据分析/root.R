# 读取数据文件
data <- read.csv("puredata.csv", header = TRUE)

# 查看数据摘要
summary(data)

# 加载神经网络包
library(neuralnet)

# 将数据标准化
data_scaled <- as.data.frame(scale(data))

# 将数据分为训练集和测试集
set.seed(123)
train_index <- sample(1:nrow(data_scaled), size = 0.7*nrow(data_scaled), replace = FALSE)
train_data <- data_scaled[train_index, ]
test_data <- data_scaled[-train_index, ]

# 创建神经网络模型
model <- neuralnet(strength ~ grong + gurongtime + shixiao.wendu + shixiao.time, train_data, hidden = 3)

# 查看模型结构
plot(model)

# 预测测试集结果
predictions <- predict(model, test_data)
predictions <- predictions * attr(train_data$strength, "scaled:scale") + attr(train_data$strength, "scaled:center")
test_data$strength <- test_data$strength * attr(train_data$strength, "scaled:scale") + attr(train_data$strength, "scaled:center")

# 计算平均绝对误差和均方误差
mae <- mean(abs(predictions - test_data$strength))
mse <- mean((predictions - test_data$strength)^2)

# 输出结果
print(paste("平均绝对误差为：", round(mae, 3)))
print(paste("均方误差为：", round(mse, 3)))

# 查看总体拟合度
plot(predictions, test_data$strength)
abline(0, 1, col="red")

# 预测“strength”对“grong”的最大值
grong_seq <- seq(min(data$grong), max(data$grong), length.out = 1000)
grong_data <- data.frame(grong = grong_seq, gurongtime = mean(data$gurongtime), 
                         shixiao.wendu = mean(data$shixiao.wendu), shixiao.time = mean(data$shixiao.time))
grong_data <- as.data.frame(scale(grong_data, center = attr(train_data, "scaled:center")[1:4], 
                                  scale = attr(train_data, "scaled:scale")[1:4]))

grong_predictions <- predict(model, grong_data)
grong_predictions <- grong_predictions * attr(train_data$strength, "scaled:scale") + attr(train_data$strength, "scaled:center")
max_strength_grong <- grong_seq[which.max(grong_predictions)]

# 输出结果
print(paste("当grong为", round(max_strength_grong, 2), "时，预测strength取最大值。"))
