library(faraway)
data(sat)
attach(sat)
fit.lm <- lm(total ~ expend + salary + ratio + takers)
summary(fit.lm)
y.res = resid(fit.lm)

#a#
plot(fitted(fit.lm),y.res,xlab = "Fitted",ylab = "Residuals")
abline(h=0)
summary(lm(abs(residuals(fit.lm)) ~ fitted(fit.lm)))

#b#
qqnorm(y.res,ylab = "Residuals")
qqline(y.res)

#c#
lev = hat(model.matrix(fit.lm))
plot(lev)

#d#
boxplot.stats(expend)$out
boxplot.stats(salary)$out
boxplot.stats(ratio)$out
boxplot.stats(takers)$out

#e#
cook <- cooks.distance(fit.lm)
halfnorm(cook,3)
