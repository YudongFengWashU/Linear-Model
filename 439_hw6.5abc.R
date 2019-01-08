library(faraway)
library(MASS)
data("pipeline")
attach(pipeline)
model1 <- lm(Lab ~ Field, data = pipeline)
summary(model1)


par(mfrow=c(2,2))
plot(model1)

#b
i <- order(pipeline$Field)
npipe <- pipeline[i,]
ff <- gl(12,9)[-108]
meanfield <- unlist(lapply(split(npipe$Field,ff),mean))
varlab <- unlist(lapply(split(npipe$Lab,ff),var))
gs1 <- lm(log(varlab[1:11])~log(meanfield[1:11]))
a1  <- gs1$coefficients[2]
a0  <- exp(gs1$coefficients[1]/a1)
w   <- 1/(a0+a1*pipeline$Field)
model2 <- lm(Lab ~ Field,weights = w, data = pipeline)
summary(model2)

par(mfrow=c(1,2))
plot(fitted(model1),residuals(model1),xlab = "Fitted",ylab = "Residuals")
abline(h=0)
plot(sqrt(w)*fitted(model2),sqrt(w)*residuals(model2),xlab = "Weighted Fitted",ylab = "Weighted Residuals")
abline(h=0)

#c
boxcox(model1,plotit = TRUE)
boxcox(model1,plotit = TRUE,lambda = seq(0,1,by=0.01))
