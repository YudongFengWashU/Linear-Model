library(faraway)
data("teengamb")
attach(teengamb)
#a
full <- lm(gamble~.,data=teengamb)
summary(full)

lm2 <- update(full,.~. - status)
summary(lm2)

lm3 <- update(lm2,.~. - verbal)
summary(lm3)


#b
step(full)


#c
library(leaps)
b <- regsubsets(gamble~.,data=teengamb)
summary(b)

(rs<-summary(b))
par(mfrow=c(1,2))
plot(2:5, rs$adjr2, xlab="No. of Parameters",ylab="Adjusted R-squqre")
plot(b,scale="adjr2")

#d
(rs<-summary(b))
par(mfrow=c(1,2))
plot(2:5, rs$cp, xlab="No. of Parameters",ylab="Cp Statistic")
plot(b,scale="Cp")
