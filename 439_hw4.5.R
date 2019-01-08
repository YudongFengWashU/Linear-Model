library(faraway)
data(sat)
attach(sat)
math.lm <- lm(math ~ expend + ratio + salary, data = sat)
summary(math.lm)

predict(math.lm,data.frame(expend=6,ratio=15,salary=c(25, 30, 35, 40, 45, 50, 55, 60, 65, 70)),interval = "prediction")
pred = predict(math.lm,data.frame(expend=6,ratio=15,salary=c(25, 30, 35, 40, 45, 50, 55, 60, 65, 70)),interval = "prediction")

newx = seq(25,70,by=5)
plot(newx,pred[,1],type = "l", xlim = range(25,70),ylim = range(100,800),xlab = "salary", ylab = "math")
lines(newx,pred[,2],col = "red")
lines(newx,pred[,3],col = "red")
