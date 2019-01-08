library(MPV)
data(table.b10)
attach(table.b10)
y.lm <- lm(y ~ x1 + x2, data = table.b10)
summary(y.lm)
y.res = resid(y.lm)
qqnorm(y.res)
qqline(y.res)

plot(fitted(y.lm),y.res,xlab = "Fitted",ylab = "Residuals")
abline(h=0)

y2.lm <- lm(y ~ x2, data = table.b10)
summary(y2.lm)

PRESS(y.lm)
PRESS(y2.lm)
