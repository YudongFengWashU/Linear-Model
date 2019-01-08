library(MPV)
data(table.b8)
attach(table.b8)
model <- lm(y ~ x1 + x2, data = table.b8)
summary(model)
par(mfrow=c(1,1))
plot(model)

plot(fitted(model), resid(model),xlab = "Fitted Value(original)", ylab = "Residuals")
abline(h=0)

model.rev = lm(offset(sqrt(y)) ~ x1 + x2, data = table.b8)
summary(model.rev)
plot(model.rev)

plot(fitted(model.rev),resid(model.rev),xlab = "Fitted Value(trans)", ylab = "Residuals")
abline(h=0)

