library(faraway)
data("divusa")
attach(divusa)
#a
full <- lm(divorce~.,data=divusa)
summary(full)

lm2 <- update(full,.~. - unemployed)
summary(lm2)


#b
step(full)

#c
library(leaps)
b <- regsubsets(divorce~.,data=divusa)
summary(b)

(rs<-summary(b))
par(mfrow=c(1,2))
plot(2:7, rs$adjr2, xlab="No. of Parameters",ylab="Adjusted R-squqre")
plot(b,scale="adjr2")

#d
(rs<-summary(b))
par(mfrow=c(1,2))
plot(2:7, rs$cp, xlab="No. of Parameters",ylab="Cp Statistic")
plot(b,scale="Cp")
