library(faraway)
library(MASS)
data(pipeline)
attach(pipeline)
model <- lm(Lab ~ Field, data = pipeline)
summary(model)
plot(fitted(model),resid(model),xlab = "Fitted",ylab = "Residuals")
abline(h=0)


